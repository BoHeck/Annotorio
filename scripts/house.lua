---------include these in the event collection-----------
--function ifHouseBuild()
--function ifHouseRemoved()
--function houses_on_every_x_ticks()  //////    script.on_nth_tick(everyXticks, houses_on_every_x_ticks)
--local everyXticks=60
-------------------------------------------------------

--Take a look at the Anotorio spreadsheet on
-- https://docs.google.com/spreadsheets/d/12XpO3NGwNVHsxEYYcaBZuqqXzK2D3cf86Yt9lEuyxoo/edit?usp=sharing

require("scripts.util")
require("scripts.shared_inventory")
require("scripts.technology")

--Its fine to set these globals up on every load
function setup_needs()
    global.pioneer_needs = {}
    global.pioneer_needs["anno_fish"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 21.18,
        DurabilityLossPerTick = 0.02083333333,
        luxus_buildings = 0
    }
    global.pioneer_needs["cloth"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 77.92,
        DurabilityLossPerTick = 0.025,
        luxus_buildings = 1
    }
    global.pioneer_needs["cider"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 67.5,
        DurabilityLossPerTick = 0.01,
        luxus_buildings = 2
    }

    global.settler_needs = {}
    global.settler_needs["anno_fish"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 21.18,
        DurabilityLossPerTick = 0.02083333333,
        luxus_buildings = 0
    }
    global.settler_needs["cloth"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 77.92,
        DurabilityLossPerTick = 0.025,
        luxus_buildings = 1
    }
    global.settler_needs["cider"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 67.5,
        DurabilityLossPerTick = 0.01,
        luxus_buildings = 2
    }

    global.luxus_buildings = {}
    global.luxus_buildings[1] = {name = "chapel", range = 24}
    global.luxus_buildings[2] = {name = "tavern", range = 36}
    global.luxus_buildings[3] = {name = "doctor", range = 24}
    global.luxus_buildings[4] = {name = "school", range = 24}

    global.upgrade_tables = {}
    global.upgrade_tables["pioneers"] = {
        upgrade_progress = 0,
        progress_needed = 10,
        needs_count = 3,
        next_house = "house_settler",
        cost_wood = 9,
        cost_tools = 2,
        cost_bricks = 0
    }
    global.upgrade_tables["settlers"] = {
        upgrade_progress = 0,
        progress_needed = 10,
        needs_count = 6,
        next_house = "house_citizen",
        cost_wood = 18,
        cost_tools = 12,
        cost_bricks = 24
    }
end

--called just in case
setup_needs()

if (global.houses_pioneers == nil) then
    global.houses_pioneers = {}
end
if (global.houses_settlers == nil) then
    global.houses_settlers = {}
end

if (global.houses_citizens == nil) then
    global.houses_citizens = {}
end

local every_x_ticks = 60
local technology_counter = 0
-------------------------------------------------------------------------
function ifHouseBuild(ent, entity_name)
    if (entity_name == "house_pioneer") then
        global.houses_pioneers[ent.unit_number] = {
            house = ent,
            chapel = find_luxus_building_in_range(ent, "chapel", global.luxus_buildings[1].range),
            tavern = find_luxus_building_in_range(ent, "tavern", global.luxus_buildings[2].range)
        }
    end

    if (entity_name == "house_settler") then
        global.houses_settlers[ent.unit_number] = {
            house = ent,
            chapel = find_luxus_building_in_range(ent, "chapel", global.luxus_buildings[1].range),
            tavern = find_luxus_building_in_range(ent, "tavern", global.luxus_buildings[2].range)
        }
    end

    if (entity_name == "house_citizen") then
        global.houses_citizens[ent.unit_number] = {
            house = ent,
            chapel = find_luxus_building_in_range(ent, "chapel", global.luxus_buildings[1].range),
            tavern = find_luxus_building_in_range(ent, "tavern", global.luxus_buildings[2].range)
        }
    end
end

function ifHouseRemoved(event, entity_name)
    local ent = event.entity

    if (entity_name == "house_pioneer") then
        global.houses_pioneers[ent.unit_number] = nil
    end

    if (entity_name == "house_settler") then
        global.houses_settlers[ent.unit_number] = nil
    end

    if (entity_name == "house_citizen") then
        global.houses_citizens[ent.unit_number] = nil
    end
end

function convert_goods_into_money(houses, needs, upgrade_table, power_interface)
    local income = 0
    local houses_with_all_needs_meet_count = 0
    local houses_for_technology_count = 0
    local needs_count = 0
    local inv
    local luxus_buildings

    for _, house in pairs(houses) do
        inv = house.house.get_inventory(defines.inventory.assembling_machine_input)
        luxus_buildings = get_number_of_luxus_buildings(house)
        needs_count = 0

        for need, value in pairs(needs) do
            if (value.luxus_buildings <= luxus_buildings) then
                local stack = inv.find_item_stack(need)
                if (stack ~= nil) then
                    needs_count = needs_count + 1
                    stack.drain_durability(value.DurabilityLossPerTick)
                    income = income + value.SellValuePerTick
                end
            end
        end
        ----------------------upgrade house-----------------------
        if (needs_count == upgrade_table.needs_count) then
            houses_with_all_needs_meet_count = houses_with_all_needs_meet_count + 1
            if (upgrade_table.upgrade_progress > upgrade_table.progress_needed) then
                if (upgrade(house.house, upgrade_table, houses)) then
                    upgrade_table.upgrade_progress = upgrade_table.upgrade_progress - upgrade_table.progress_needed
                end
            end
        end

        ------------------------technology-------------------------
        if (power_interface.force.current_research ~= nil) then
            local t_name = power_interface.force.current_research.name

            if (global.anno_technology_requierements[t_name] ~= nil) then
                if (needs_count >= global.anno_technology_requierements[t_name].different_goods) then
                    technology_counter = technology_counter + 1
                end
            end
        end
        -----------------------------------------------------------
    end
    power_interface.power_production = income

    upgrade_table.upgrade_progress = upgrade_table.upgrade_progress + houses_with_all_needs_meet_count
end

function upgrade(house, upgrade_table, houses)
    local unit_number = house.unit_number

    if
        (global.banked_wood < upgrade_table.cost_wood or global.banked_wood < upgrade_table.cost_tools or
            global.banked_wood < upgrade_table.cost_bricks)
     then
        return false
    end

    change_banked_count("wood", "wood_placeholder", "banked_wood", -upgrade_table.cost_wood)
    change_banked_count("anno_tool", "anno_tool_placeholder", "banked_tool", -upgrade_table.cost_tools)
    change_banked_count("ceramics", "ceramics_placeholder", "banked_brick", -upgrade_table.cost_bricks)

    house.surface.create_entity {
        name = upgrade_table.next_house,
        position = house.position,
        force = house.force,
        fast_replace = true,
        spill = false,
        raise_built = true,
        create_build_effect_smoke = true
    }
    houses[unit_number] = nil
    return true
end

function get_number_of_luxus_buildings(entry)
    local number = 0
    for i, luxus_building in ipairs(global.luxus_buildings) do --TODO check if this iterates 1 2 3 4 5....
        if (entry[luxus_building.name] ~= nil) then
            number = number + 1
        else
            return number
        end
    end
    return number
end

function houses_on_every_x_ticks()
    local index
    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        index = i
    end

    technology_counter = 0 --resetting it because its used in convert_goods_into_money
    if (index ~= nil) then
        convert_goods_into_money(
            global.houses_pioneers,
            global.pioneer_needs,
            global.upgrade_tables.pioneers,
            global.kontors[index].generator_for_pioneers
        )
        convert_goods_into_money(
            global.houses_settlers,
            global.settler_needs,
            global.upgrade_tables.settlers,
            global.kontors[index].generator_for_settlers
        )

        ------------------------technology-------------------------
        local current_force = global.kontors[index].generator_for_pioneers.force

        if (current_force.current_research ~= nil) then
            local t_name = current_force.current_research.name

            if (global.anno_technology_requierements[t_name] ~= nil) then
                set_progress(
                    current_force,
                    t_name,
                    technology_counter / global.anno_technology_requierements[t_name].amount
                )
            end
        end
    -----------------------------------------------------------
    end
end

function find_luxus_building_in_range(searching_entity, luxus_building_name, range)
    return searching_entity.surface.find_entities_filtered {
        name = luxus_building_name,
        position = searching_entity.position,
        radius = range,
        limit = 1
    }[1]
    --This is either the luxus_building we were searching for or nil.
end

function register_onto_houses_in_range(searching_entity, house_name, houses_global_name, register_name, range)
    local houses =
        searching_entity.surface.find_entities_filtered {
        name = house_name,
        position = searching_entity.position,
        radius = range
    }

    for i, house in ipairs(houses) do
        global[houses_global_name][house.unit_number][register_name] = searching_entity
    end
end

function deregister_from_houses(entity_to_deregister, houses_global_name, register_name)
    for i, house in pairs(global[houses_global_name]) do
        if (house[register_name] == entity_to_deregister) then
            house[register_name] = nil
        end
    end
end
