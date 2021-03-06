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
    ----------------------------------------------------------
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
    ----------------------------------------------------------
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
    global.settler_needs["copperwares"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 95.76,
        DurabilityLossPerTick = 0.01111111111,
        luxus_buildings = 2
    }
    global.settler_needs["barreled_rum"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 160.34,
        DurabilityLossPerTick = 0.003703703704,
        luxus_buildings = 3
    }
    global.settler_needs["bacon_omelet"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 170,8854167,
        DurabilityLossPerTick = 0.003125,
        luxus_buildings = 4
    }
    ----------------------------------------------------------
    global.citizen_needs = {}
    global.settler_needs["anno_fish"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 21.18,
        DurabilityLossPerTick = 0.02083333333,
        luxus_buildings = 0
    }
    global.citizen_needs["cloth"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 77.92,
        DurabilityLossPerTick = 0.025,
        luxus_buildings = 1
    }
    global.citizen_needs["cider"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 67.5,
        DurabilityLossPerTick = 0.01,
        luxus_buildings = 2
    }
    global.citizen_needs["copperwares"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 95.76,
        DurabilityLossPerTick = 0.01111111111,
        luxus_buildings = 2
    }
    global.citizen_needs["barreled_rum"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 160.34,
        DurabilityLossPerTick = 0.003703703704,
        luxus_buildings = 3
    }
    global.citizen_needs["bacon_omelet"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 140.8854167,
        DurabilityLossPerTick = 0.003125,
        luxus_buildings = 4
    }
    ----------------------------------------------------------
    global.luxus_buildings = {}
    global.luxus_buildings[1] = {name = "chapel", range = 24}
    global.luxus_buildings[2] = {name = "tavern", range = 36}
    global.luxus_buildings[3] = {name = "doctor", range = 38}
    global.luxus_buildings[4] = {name = "school", range = 42}
    ----------------------------------------------------------
    global.buildings_with_overlay = {}
    global.buildings_with_overlay[1] = {name = "woodcutter", range = 14}
    global.buildings_with_overlay[2] = {name = "tree_planter", range = 24}
    ----------------------------------------------------------
    global.upgrade_tables = {}
    global.upgrade_tables["pioneers"] = {
        upgrade_progress = 0,
        progress_needed = 15,
        needs_count = 3,
        next_house = "invisible_house_settler",
        cost_wood = 9,
        cost_tools = 2,
        cost_bricks = 0
    }
    global.upgrade_tables["settlers"] = {
        upgrade_progress = 0,
        progress_needed = 20,
        needs_count = 6,
        next_house = "invisible_house_citizen",
        cost_wood = 18,
        cost_tools = 12,
        cost_bricks = 24
    }
    global.upgrade_tables["citizen"] = {
        upgrade_progress = 0,
        progress_needed = 40,
        needs_count = 9,
        next_house = "invisible_house_citizen",
        --TODO
        cost_wood = 36,
        cost_tools = 25,
        cost_bricks = 48
    }
    ----------------------------------------------------------
    global.house_pioneer_variants = {
        "h1_1",
        "h1_2",
        "h1_3",
        "h1_4",
        "h1_5",
        "h1_6"
    }
    global.house_settler_variants = {
        "h2_1",
        "h2_2",
        "h2_3",
        "h2_4",
        "h2_5",
        "h2_6",
        "h2_7"
    }
    global.house_citizen_variants = {
        "h3_3",
        "h3_4",
        "h3_5",
        "h3_6",
        "h3_7",
        "h3_8",
        "h3_9",
        "h3_10"
    }
    global.last_house_index = 1
    ----------------------------------------------------------

    global.kontor_replacement_table = {}

    global.kontor_replacement_table["kontor_container_west"] = "kontor_container_2_west"
    global.kontor_replacement_table["kontor_container_east"] = "kontor_container_2_east"
    global.kontor_replacement_table["kontor_container_north"] = "kontor_container_2_north"
    global.kontor_replacement_table["kontor_container_south"] = "kontor_container_2_south"
    global.kontor_replacement_table["anno_crane"] = "anno_crane_3"
    ----------------------------------------------------------
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
        house_build(ent, "invisible_house_pioneer", global.houses_pioneers)
    end
    -------------------------------------------------------------------------
    if (entity_name == "house_settler") then
        house_build(ent, "invisible_house_settler", global.houses_settlers)
    end
    -------------------------------------------------------------------------
    if (entity_name == "house_citizen") then
        house_build(ent, "invisible_house_citizen", global.houses_citizens)
    end
    -------------------------------------------------------------------------
    if (entity_name == "invisible_house_pioneer") then
        invisible_house_build(ent, global.houses_pioneers)
    end
    -------------------------------------------------------------------------
    if (entity_name == "invisible_house_settler") then
        invisible_house_build(ent, global.houses_settlers)
    end
    -------------------------------------------------------------------------
    if (entity_name == "invisible_house_citizen") then
        invisible_house_build(ent, global.houses_citizens)
    end
end

function house_build(ent, replacement_name, global_table)
    local new_ent = replace_with_invisible(ent, replacement_name)

    invisible_house_build(new_ent, global_table)
end

function invisible_house_build(new_ent, global_table)
    local overlay = place_random_overlay(new_ent, new_ent.name)

    global_table[new_ent.unit_number] = {
        house = new_ent,
        chapel = find_luxus_building_in_range(new_ent, "chapel", global.luxus_buildings[1].range),
        tavern = find_luxus_building_in_range(new_ent, "tavern", global.luxus_buildings[2].range),
        doctor = find_luxus_building_in_range(new_ent, "doctor", global.luxus_buildings[2].range),
        school = find_luxus_building_in_range(new_ent, "school", global.luxus_buildings[2].range),
        overlay = overlay
    }
end

function replace_with_invisible(ent, replacement_name)
    local new_ent =
        ent.surface.create_entity {
        name = replacement_name,
        position = ent.position,
        force = ent.force,
        fast_replace = true,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent.destroy()
    return new_ent
end

function place_random_overlay(ent, replacement_name)
    local overlay_name
    local global_table
    if (replacement_name == "invisible_house_pioneer") then
        global_table = global.house_pioneer_variants
    end
    if (replacement_name == "invisible_house_settler") then
        global_table = global.house_settler_variants
    end
    if (replacement_name == "invisible_house_citizen") then
        global_table = global.house_citizen_variants
    end

    local index = global.last_house_index
    while (index == global.last_house_index) do --warning need at least 2 sprites for this to not loop endlessly
        index = math.random(1, #global_table)
    end
    global.last_house_index = index

    overlay_name = global_table[index]

    local new_ent =
        ent.surface.create_entity {
        name = overlay_name,
        position = ent.position,
        raise_built = false,
        create_build_effect_smoke = false
    }
    return new_ent
end

function ifHouseRemoved(event, entity_name)
    local ent = event.entity

    if (entity_name == "invisible_house_pioneer") then
        global.houses_pioneers[ent.unit_number].overlay.destroy()
        global.houses_pioneers[ent.unit_number] = nil
    end

    if (entity_name == "invisible_house_settler") then
        global.houses_settlers[ent.unit_number].overlay.destroy()
        global.houses_settlers[ent.unit_number] = nil
    end

    if (entity_name == "invisible_house_citizen") then
        global.houses_citizens[ent.unit_number].overlay.destroy()
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

    --store input resources
    local inv = house.get_inventory(defines.inventory.assembling_machine_input)

    local res = {}
    local index = 0

    while (index < #inv) do
        index = index + 1
        if (inv[index].valid_for_read) then
            res[inv[index].name] = {amount = inv[index].count, durability = inv[index].durability}
        end
    end

    ent =
        house.surface.create_entity {
        name = upgrade_table.next_house,
        position = house.position,
        force = house.force,
        --  fast_replace = true,
        spill = false,
        raise_built = true,
        create_build_effect_smoke = true
    }

    --inserting stored resources
    --ent.set_recipe("settler_needs")
    --TODO this is a hack , instead it needs to be set dynamicly
    inv = ent.get_inventory(defines.inventory.assembling_machine_input)

    for item_name, value in pairs(res) do
        inv.insert {name = item_name, count = value.amount, durability = value.durability}
    end

    house.destroy()
    houses[unit_number].overlay.destroy()
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
        convert_goods_into_money(
            global.houses_citizens,
            global.citizen_needs,
            global.upgrade_tables.citizen,
            global.kontors[index].generator_for_citizens
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
