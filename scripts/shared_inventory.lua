---------include these in the event collection-----------
--function search_in_kontor_on_every_x_ticks()   script.on_nth_tick(everyXticks, search_in_kontor_on_every_x_ticks)
--function init_shared_resources(PLAYER) in on_player_created_collection
--function inventory_changed_sync(player) in  on_player_main_inventory_changed_collection
--function dont_allow_inventory_placeholder_in_the_cursor(event) in on_player_cursor_stack_changed_collection
-------------------------------------------------------

--This files aims to implement the shared inventory function.
--There is a global stack of wood,tools and bricks that can be accessed by any player
--This is done by global.banked_wood ...
--And listening to  on_player_main_inventory_changed

require("scripts.util")

local resource_freshhold = 50 --The system aims to place this many resources into every players inventory.

if (global.banked_wood == nil) then
    global.banked_wood = 0
end
if (global.banked_tool == nil) then
    global.banked_tool = 0
end
if (global.banked_brick == nil) then
    global.banked_brick = 0
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
    log("inventory_changed_sync")
    check(player, "wood", "banked_wood", "wood_placeholder")
    check(player, "anno_tool", "banked_tool", "anno_tool_placeholder")
    check(player, "ceramics", "banked_brick", "ceramics_placeholder")
end

function check(player, item_name, global_name, placeholder_name)
    log(item_name)
    local reference_value = math.min(resource_freshhold, global[global_name])
    local difference = player.get_main_inventory().get_item_count(item_name) - reference_value

    log(reference_value)
    log(difference)

    if (difference ~= 0) then
        global[global_name] = global[global_name] + difference
        local insert_amount = math.min(resource_freshhold, global[global_name])

        if (reference_value ~= insert_amount) then
            log(insert_amount)
            sync_inventory_all(item_name, placeholder_name, insert_amount)
            check(player, item_name, global_name, placeholder_name)
        else
            sync_inventory(player, item_name, placeholder_name, insert_amount)
            check(player, item_name, global_name, placeholder_name)
        end
    end
end

--This function needs to be called for every new player so his starting resources get banked
function init_shared_resources(player)
    log("Init player")
    --Move relevant items into the bank
    global.banked_wood = global.banked_wood + player.get_main_inventory().get_item_count("wood")
    global.banked_tool = global.banked_tool + player.get_main_inventory().get_item_count("anno_tool")
    global.banked_brick = global.banked_brick + player.get_main_inventory().get_item_count("ceramics")
    log(global.banked_wood)
    log(global.banked_tool)
    log(global.banked_brick)

    local min = math.min(resource_freshhold, global.banked_wood)
    sync_inventory(player, "wood", "wood_placeholder", min)
    min = math.min(resource_freshhold, global.banked_tool)
    sync_inventory(player, "anno_tool", "anno_tool_placeholder", min)
    min = math.min(resource_freshhold, global.banked_brick)
    sync_inventory(player, "ceramics", "ceramics_placeholder", min)
end

function remove_all(item_name, inventory)
    local count = 1
    while (count > 0) do
        count = inventory.remove(item_name)
    end
end

function sync_inventory_all(item_name, placeholder_name, insert_amount)
    for _, player in pairs(game.players) do
        log(insert_amount)
        sync_inventory(player, item_name, placeholder_name, insert_amount)
    end
end

function sync_inventory(player, item_name, placeholder_name, insert_amount)
    remove_all(item_name, player.get_main_inventory())
    remove_all(placeholder_name, player.get_main_inventory())
    log(insert_amount)
    log("insert " .. insert_amount)
    if (insert_amount > 0) then
        player.insert {name = item_name, count = insert_amount}
    else
        player.insert {name = placeholder_name, count = 1}
    end
end

function search_in_kontor_on_every_x_ticks()
    deliver_kontor_resource_to_bank("wood", "wood_placeholder", "banked_wood")
    deliver_kontor_resource_to_bank("anno_tool", "anno_tool_placeholder", "banked_tool")
    deliver_kontor_resource_to_bank("ceramics", "ceramics_placeholder", "banked_brick")

    --------------------technlogy--------------------
    local index

    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        index = i
    end

    if (index ~= nil) then
        if (global.kontors[index].kontor.force.current_research ~= nil) then
            local t_name = global.kontors[index].kontor.force.current_research.name

            if (global.anno_technology_resource_requierements[t_name] ~= nil) then
                local progress = check_progress(global.anno_technology_resource_requierements[t_name])

                if (progress >= 1) then
                    global.kontors[index].kontor.force.current_research.researched = true
                    debug_print("consume")
                    consume(global.anno_technology_resource_requierements[t_name])
                else
                    set_progress(global.kontors[index].kontor.force, t_name, progress)
                end
            end
        end
    end
    -------------------------------------------------
end

function consume(resources)
    for i, v in pairs(resources) do
        consume_single(v.name, v.amount)
    end
end

function consume_single(item_name, amount)
    if (item_name == "wood") then
        change_banked_count(item_name, "wood_placeholder", "banked_wood", -amount)
        return
    end
    if (item_name == "anno_tool") then
        change_banked_count(item_name, "anno_tool_placeholder", "banked_tool", -amount)
        return
    end
    if (item_name == "ceramics") then
        change_banked_count(item_name, "ceramics_placeholder", "banked_brick", -amount)
        return
    end
    -------------------------------------------------
    local amount_left = amount
    local res
    local removed

    for i, kontor in pairs(global.kontors) do
        res = kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
        removed = math.min(res, amount_left)
        amount_left = amount_left - removed
        kontor.kontor.get_inventory(defines.inventory.chest).remove({name = item_name, count = removed})
        if (amount_left == 0) then
            return
        end
    end

    for i, market in pairs(global.markets) do
        res = market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
        removed = math.min(res, amount_left)
        amount_left = amount_left - removed
        market.chest.get_inventory(defines.inventory.chest).remove({name = item_name, count = removed})
        if (amount_left == 0) then
            return
        end
    end
end

function check_progress(resources)
    local sum = 0
    local found = 0
    for i, v in pairs(resources) do
        found = found + search(v.name, v.amount)
        sum = sum + v.amount
    end

    return (found / sum)
end

function search(name, amount)
    if (name == "wood") then
        return math.min(amount, global.banked_wood)
    end
    if (name == "anno_tool") then
        return math.min(amount, global.banked_tool)
    end
    if (name == "ceramics") then
        return math.min(amount, global.banked_brick)
    end

    return math.min(search_resources_in_kontors(name), amount)
end

function get_gold_count()
    local gold = 0

    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        gold = gold + kontor.accumulator.energy
    end
    return gold + global.banked_gold
end

function search_resources_in_kontors(item_name)
    local new_res = 0

    for i, kontor in pairs(global.kontors) do
        new_res = new_res + kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
    end

    for i, market in pairs(global.markets) do
        new_res = new_res + market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
    end

    return new_res
end

function deliver_kontor_resource_to_bank(item_name, placeholder_name, global_name)
    local new_res = 0

    for i, kontor in pairs(global.kontors) do
        new_res = new_res + kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)
        remove_all(item_name, kontor.kontor.get_inventory(defines.inventory.chest))
    end

    for i, market in pairs(global.markets) do
        new_res = new_res + market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)
        remove_all(item_name, market.chest.get_inventory(defines.inventory.chest))
    end

    global[global_name] = global[global_name] + new_res

    if (new_res ~= 0 and (global[global_name] - new_res) < resource_freshhold) then
        sync_inventory_all(item_name, placeholder_name, math.min(resource_freshhold, global[global_name]))
    end
end

--[[
function deliver_kontor_resource_with_limit(item_name, global_name, limit)
    local maximum = limit - global[global_name]
    local new_res = 0
    local curren_res = 0

    if (maximum == 0) then
        return
    end

    for i, kontor in pairs(global.kontors) do
        curren_res = kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item_name)

        remove_amount(item_name, kontor.kontor.get_inventory(defines.inventory.chest), math.min(curren_res, maximum))
        new_res = new_res + math.min(curren_res, maximum)
        maximum = maximum - math.min(curren_res, maximum)
    end

    for i, market in pairs(global.markets) do
        curren_res = market.chest.get_inventory(defines.inventory.chest).get_item_count(item_name)

        remove_amount(item_name, market.chest.get_inventory(defines.inventory.chest), math.min(curren_res, maximum))
        new_res = new_res + math.min(curren_res, maximum)
        maximum = maximum - math.min(curren_res, maximum)
    end
    global[global_name] = global[global_name] + new_res
end
]]
function change_banked_count(item_name, placeholder_name, global_name, amount)
    global[global_name] = global[global_name] + amount

    if (amount ~= 0 and (global[global_name] - amount) < resource_freshhold) then
        sync_inventory_all(item_name, placeholder_name, math.min(resource_freshhold, global[global_name]))
    end
end
