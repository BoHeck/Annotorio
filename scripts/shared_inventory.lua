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
        if (player.cursor_stack.name == "inventory_placeholder") then
            player.clean_cursor()
        end
    end
end

-- on_player_fast_transferred TODO prevent players from removing the placeholders

--If the inventory changed in some way then we need to find out if (wood,tool,brick) has changed and then update accordingly
function inventory_changed_sync(player)
    local wood_reference_value = math.min(resource_freshhold, global.banked_wood)
    local tool_reference_value = math.min(resource_freshhold, global.banked_tool)
    local brick_reference_value = math.min(resource_freshhold, global.banked_brick)

    local wood = player.get_main_inventory().get_item_count("wood") - wood_reference_value
    local tool = player.get_main_inventory().get_item_count("anno_tool") - tool_reference_value
    local brick = player.get_main_inventory().get_item_count("ceramics") - brick_reference_value

    local sync_one = false
    local sync_all = false

    if (wood ~= 0) then
        global.banked_wood = global.banked_wood + wood

        math.min(resource_freshhold, global.banked_wood)
        if (wood_reference_value ~= math.min(resource_freshhold, global.banked_wood)) then
            sync_all = true
        else
            sync_one = true
        end
    end

    if (tool ~= 0) then
        global.banked_tool = global.banked_tool + tool

        if (tool_reference_value ~= math.min(resource_freshhold, global.banked_tool)) then
            sync_all = true
        else
            sync_one = true
        end
    end

    if (brick ~= 0) then
        global.banked_brick = global.banked_brick + brick

        if (brick_reference_value ~= math.min(resource_freshhold, global.banked_brick)) then
            sync_all = true
        else
            sync_one = true
        end
    end

    if (sync_all) then
        sync_inventory_all()
        return
    end

    if (sync_one) then
        sync_inventory(player)
        return
    end
end

--This function needs to be called for every new player so his starting resources get banked
function init_shared_resources(player)
    --Move relevant items into the bank
    global.banked_wood = global.banked_wood + player.get_main_inventory().get_item_count("wood")
    global.banked_tool = global.banked_tool + player.get_main_inventory().get_item_count("anno_tool")
    global.banked_brick = global.banked_brick + player.get_main_inventory().get_item_count("ceramics")

    sync_inventory(player)
end

function sync_inventory_all()
    for _, player in pairs(game.players) do
        sync_inventory(player)
    end
end

function remove_all(item, inventory)
    local count = 1
    while (count > 0) do
        count = inventory.remove(item)
    end
end

function sync_inventory(player)
    remove_all("wood", player.get_main_inventory())
    remove_all("anno_tool", player.get_main_inventory())
    remove_all("ceramics", player.get_main_inventory())
    remove_all("inventory_placeholder", player.get_main_inventory())

    local wood = math.min(resource_freshhold, global.banked_wood)
    local tool = math.min(resource_freshhold, global.banked_tool)
    local brick = math.min(resource_freshhold, global.banked_brick)

    if (wood > 0) then
        player.insert {name = "wood", count = wood}
    else
        player.insert {name = "inventory_placeholder", count = 1}
    end
    if (tool > 0) then
        player.insert {name = "anno_tool", count = tool}
    else
        player.insert {name = "inventory_placeholder", count = 1}
    end
    if (brick > 0) then
        player.insert {name = "ceramics", count = brick}
    else
        player.insert {name = "inventory_placeholder", count = 1}
    end
end

function search_in_kontor_on_every_x_ticks()
    deliver_kontor_resource_to_bank("wood", "banked_wood")
    deliver_kontor_resource_to_bank("anno_tool", "banked_tool")
    deliver_kontor_resource_to_bank("ceramics", "banked_brick")
end

function get_gold_count()
    local gold = 0

    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        gold = gold + kontor.accumulator.energy
    end
    return gold + global.banked_gold
end

function deliver_kontor_resource_to_bank(item, global_name)
    local new_res = 0

    for i, kontor in pairs(global.kontors) do
        new_res = new_res + kontor.kontor.get_inventory(defines.inventory.chest).get_item_count(item)
        remove_all(item, kontor.kontor.get_inventory(defines.inventory.chest))
    end

    for i, market in pairs(global.markets) do
        new_res = new_res + market.chest.get_inventory(defines.inventory.chest).get_item_count(item)
        remove_all(item, market.chest.get_inventory(defines.inventory.chest))
    end

    global[global_name] = global[global_name] + new_res

    if (new_res > 0 and (global[global_name] - new_res) < resource_freshhold) then
        sync_inventory_all()
    end
end
