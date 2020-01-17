---------include these in the event collection-----------
--function search_in_storage_on_every_x_ticks()   script.on_nth_tick(everyXticks, search_in_storage_on_every_x_ticks)
--function init_shared_resources(PLAYER) in on_player_created_collection
--function inventory_changed_sync(player) in  on_player_main_inventory_changed_collection
--function dont_allow_inventory_placeholder_in_the_cursor(event) in on_player_cursor_stack_changed_collection
-------------------------------------------------------

--This files aims to implement the shared inventory function.
--There is a global stack of wood,tools and bricks that can be accessed by any player
--This is done by global.banked_wood[force_index] ...
--And listening to  on_player_main_inventory_changed

require("scripts.util")

local resource_freshhold = 150 --The system aims to place this many resources into every players inventory.

function init_shared_inventory()
    if (global.banked_wood == nil) then
        global.banked_wood = {}
    end
    if (global.banked_tool == nil) then
        global.banked_tool = {}
    end
    if (global.banked_brick == nil) then
        global.banked_brick = {}
    end

    if (global.banked_gold == nil) then
        global.banked_gold = {}
    end

    for force_index, force in pairs(game.forces) do
        if (global.banked_wood[force_index] == nil) then
            global.banked_wood[force_index] = 0
            global.banked_tool[force_index] = 0
            global.banked_brick[force_index] = 0
            global.banked_gold[force_index] = 50000000
        end
    end
end

function dont_allow_inventory_placeholder_in_the_cursor(event)
    local player = game.players[event.player_index]
    if (player.cursor_stack.valid_for_read) then
        if
            (player.cursor_stack.name == "wood_placeholder" or player.cursor_stack.name == "anno_tool_placeholder" or
                player.cursor_stack.name == "ceramics_placeholder")
         then
            player.clean_cursor()
        end
    end
end

-- on_player_fast_transferred TODO prevent players from removing the placeholders

--If the inventory changed in some way then we need to find out if (wood,tool,brick) has changed and then update accordingly
function inventory_changed_sync(player)
    local force_index

    for index, force in pairs(game.forces) do
        if (force == player.force) then
            force_index = index
            break
        end
    end

    --log("inventory_changed_sync")
    check(force_index, player, "wood", "banked_wood", "wood_placeholder")
    check(force_index, player, "anno_tool", "banked_tool", "anno_tool_placeholder")
    check(force_index, player, "ceramics", "banked_brick", "ceramics_placeholder")
end

function check(force_index, player, item_name, global_name, placeholder_name)
    --log(item_name)
    local reference_value = math.min(resource_freshhold, global[global_name][force_index])
    local difference = player.get_main_inventory().get_item_count(item_name) - reference_value

    --log(reference_value)
    -- log(difference)

    if (difference ~= 0) then
        global[global_name][force_index] = global[global_name][force_index] + difference
        local insert_amount = math.min(resource_freshhold, global[global_name][force_index])

        if (reference_value ~= insert_amount) then
            -- log(insert_amount)
            sync_inventory_force(player.force, item_name, placeholder_name, insert_amount)
            check(force_index, player, item_name, global_name, placeholder_name)
        else
            sync_inventory(player, item_name, placeholder_name, insert_amount)
            check(force_index, player, item_name, global_name, placeholder_name)
        end
    end
end

--This function needs to be called for every new player so his starting resources get banked
function init_shared_resources(player)
    --  log("Init player")

    local force_index

    for index, force in pairs(game.forces) do
        if (force == player.force) then
            force_index = index
            break
        end
    end

    if (global.banked_wood[force_index] == nil) then
        global.banked_wood[force_index] = 0
        global.banked_tool[force_index] = 0
        global.banked_brick[force_index] = 0
    end

    --Move relevant items into the bank
    global.banked_wood[force_index] =
        global.banked_wood[force_index] + player.get_main_inventory().get_item_count("wood")
    global.banked_tool[force_index] =
        global.banked_tool[force_index] + player.get_main_inventory().get_item_count("anno_tool")
    global.banked_brick[force_index] =
        global.banked_brick[force_index] + player.get_main_inventory().get_item_count("ceramics")
    --log(global.banked_wood)
    --log(global.banked_tool)
    -- log(global.banked_brick)

    local min = math.min(resource_freshhold, global.banked_wood[force_index])
    sync_inventory(player, "wood", "wood_placeholder", min)
    min = math.min(resource_freshhold, global.banked_tool[force_index])
    sync_inventory(player, "anno_tool", "anno_tool_placeholder", min)
    min = math.min(resource_freshhold, global.banked_brick[force_index])
    sync_inventory(player, "ceramics", "ceramics_placeholder", min)
end

function remove_all(item_name, inventory)
    local count = 1
    while (count > 0) do
        count = inventory.remove(item_name)
    end
end

function sync_inventory_force(force, item_name, placeholder_name, insert_amount)
    for _, player in pairs(game.players) do
        if (player.force == force) then
            sync_inventory(player, item_name, placeholder_name, insert_amount)
        end
    end
end

function sync_inventory(player, item_name, placeholder_name, insert_amount)
    remove_all(item_name, player.get_main_inventory())
    remove_all(placeholder_name, player.get_main_inventory())
    -- log(insert_amount)
    -- log("insert " .. insert_amount)
    if (insert_amount > 0) then
        player.insert {name = item_name, count = insert_amount}
    else
        player.insert {name = placeholder_name, count = 1}
    end
end

function search_in_storage_on_every_x_ticks()
    for force_index, force in pairs(game.forces) do
        deliver_resource_to_bank(force_index, "wood", "wood_placeholder", "banked_wood")
        deliver_resource_to_bank(force_index, "anno_tool", "anno_tool_placeholder", "banked_tool")
        deliver_resource_to_bank(force_index, "ceramics", "ceramics_placeholder", "banked_brick")

        update_technology_resource_requierements(force_index)
    end
end

--Some technologies progress depends on resources which is handled here
function update_technology_resource_requierements(force_index)
    --If the current research is listed in global.anno_technology_resource_requierements
    --1) determine the progress
    --2) if the requierements are meet then aquiere the technology and deduce resources

    local force = game.forces[force_index]

    if (force.current_research ~= nil) then
        local t_name = force.current_research.name

        if (global.anno_technology_resource_requierements[t_name] ~= nil) then
            local progress = check_progress(force_index, global.anno_technology_resource_requierements[t_name])

            if (progress >= 1) then
                force.current_research.researched = true
                consume(force_index, global.anno_technology_resource_requierements[t_name])
            else
                set_progress(force, t_name, progress)
            end
        end
    end
end

function consume(force_index, resources)
    for i, v in pairs(resources) do
        consume_single(force_index, v.name, v.amount)
    end
end

function consume_single(force_index, item_name, amount)
    if (item_name == "wood") then
        change_banked_count(force_index, item_name, "wood_placeholder", "banked_wood", -amount)
        return
    end
    if (item_name == "anno_tool") then
        change_banked_count(force_index, item_name, "anno_tool_placeholder", "banked_tool", -amount)
        return
    end
    if (item_name == "ceramics") then
        change_banked_count(force_index, item_name, "ceramics_placeholder", "banked_brick", -amount)
        return
    end
    -------------------------------------------------
    local amount_left = amount
    local res
    local removed

    for i, kontor in pairs(global.kontors) do
        if (kontor.kontor.force == game.forces[force_index]) then
            res = kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
            removed = math.min(res, amount_left)
            amount_left = amount_left - removed
            kontor.kontor.get_inventory(defines.inventory.chest).remove({name = item_name, count = removed})
            if (amount_left == 0) then
                return
            end
        end
    end

    for i, market in pairs(global.markets) do
        if (market.chest.force == force) then
            res = market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
            removed = math.min(res, amount_left)
            amount_left = amount_left - removed
            market.chest.get_inventory(defines.inventory.chest).remove({name = item_name, count = removed})
            if (amount_left == 0) then
                return
            end
        end
    end
end

function check_progress(force_index, resources)
    local sum = 0
    local found = 0

    for i, v in pairs(resources) do
        found = found + search(force_index, v.name, v.amount)
        sum = sum + v.amount
    end

    return (found / sum)
end

function search(force_index, name, amount)
    if (name == "wood") then
        return math.min(amount, global.banked_wood[force_index])
    end
    if (name == "anno_tool") then
        return math.min(amount, global.banked_tool[force_index])
    end
    if (name == "ceramics") then
        return math.min(amount, global.banked_brick[force_index])
    end

    return math.min(search_resources_in_storage(game.forces[force_index], name), amount)
end

function get_gold_count(force_index)
    local gold = 0

    for i, kontor in pairs(global.kontors) do
        if (kontor.kontor.force == game.forces[force_index]) then
            gold = gold + kontor.accumulator.energy
        end
    end
    return gold + global.banked_gold[force_index]
end

function search_resources_in_storage(force, item_name)
    local new_res = 0

    for i, kontor in pairs(global.kontors) do
        if (kontor.kontor.force == force) then
            new_res = new_res + kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
        end
    end

    for i, market in pairs(global.markets) do
        if (market.chest.force == force) then
            new_res = new_res + market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
        end
    end

    return new_res
end

function deliver_resource_to_bank(force_index, item_name, placeholder_name, global_name)
    local new_res = 0
    local limit = settings.global["do_not_send_more_resources_after_limit"]["value"]
    local force = game.forces[force_index]

    if (limit >= 0) then
        if (global[global_name][force_index] >= limit) then
            return
        end
    end

    ------Handle Kontors------
    if (settings.global["kontors_function_like_markets"]["value"]) then
        for i, kontor in pairs(global.kontors) do
            if (kontor.kontor.force == force) then
                new_res = new_res + kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
                remove_all(item_name, kontor.kontor.get_inventory(defines.inventory.chest))
            end
        end
    end

    ------Handle Markets------
    for i, market in pairs(global.markets) do
        if (market.chest.force == force) then
            new_res = new_res + market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
            remove_all(item_name, market.chest.get_inventory(defines.inventory.chest))
        end
    end

    global[global_name][force_index] = global[global_name][force_index] + new_res

    if (new_res ~= 0 and (global[global_name][force_index] - new_res) < resource_freshhold) then
        sync_inventory_force(
            force,
            item_name,
            placeholder_name,
            math.min(resource_freshhold, global[global_name][force_index])
        )
    end
end

function change_banked_count(force_index, item_name, placeholder_name, global_name, amount)
    global[global_name][force_index] = global[global_name][force_index] + amount

    if (amount ~= 0 and (global[global_name][force_index] - amount) < resource_freshhold) then
        sync_inventory_force(
            game.forces[force_index],
            item_name,
            placeholder_name,
            math.min(resource_freshhold, global[global_name][force_index])
        )
    end
end
