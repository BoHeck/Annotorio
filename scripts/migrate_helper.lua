require("scripts.shared_inventory")
require("prototypes.map.resource_placement")
--util = require("util")

function migrate_0_3_0()
    log("apply 0_3_0 to 0_3_1")
    migrate_0_3_1()
end

function migrate_0_3_1()
    log("apply 0_3_1 to 0_3_2")
    --Find all "fish_fluid" and placing "fish_fluid_animation_overlay" on each
    local all_fish_fluid

    for name, surface in pairs(game.surfaces) do
        all_fish_fluid = surface.find_entities_filtered {name = "fish_fluid"}
        for i, fish_fluid in pairs(all_fish_fluid) do
            surface.create_entity {
                name = "fish_fluid_animation_overlay",
                position = fish_fluid.position
            }
        end
    end
    if (global.banked_gold == nil) then
        global.banked_gold = 0
    end

    migrate_0_3_2()
end

function migrate_0_3_2()
    log("apply 0_3_2 to 0_3_3")
    -------------------------------------------------------
    if (global.banked_wood == nil) then
        global.banked_wood = 0
    end
    if (global.banked_tool == nil) then
        global.banked_tool = 0
    end
    if (global.banked_brick == nil) then
        global.banked_brick = 0
    end

    for _, player in pairs(game.players) do
        init_shared_resources(player)
    end
    ---------------------------------------------

    local kontor_count = 0

    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        kontor_count = kontor_count + 1

        local buffer =
            kontor.pole.surface.find_entities_filtered {
            name = "kontor"
        }
        for j, v in pairs(buffer) do
            kontor.kontor = v
        end
    end

    global.kontor_count = kontor_count
    ---------------------------------------------

    if (global.markets == nil) then
        global.markets = {}

        for i, surface in pairs(game.surfaces) do
            local markets =
                surface.find_entities_filtered {
                name = "marketplace"
            }
            for j, market in pairs(markets) do
                local ent2 =
                    surface.create_entity {
                    name = "marketplace_chest",
                    position = market.position,
                    force = market.force,
                    fast_replace = false,
                    spill = false,
                    raise_built = false,
                    create_build_effect_smoke = false
                }

                global.markets[ent2.unit_number] = {
                    pole = market,
                    chest = ent2
                }
            end
        end
    end

    ----------------------------------------------
    migrate_0_3_3()
end

function migrate_0_3_3()
    log("apply 0_3_3 to 0_3_4")
    pipette_init()
    migrate_0_3_4()
end

function migrate_0_3_4()
    log("apply 0_3_4 to higher")
    log("Migrating version 0_3_4 or lower can not be migrated to 0_4_0 or higher")
    error("Version 0_3_4 or lower can not be migrated to 0_4_0 or higher")
end

function migrate_0_5_0()
    log("apply 0_5_0 to 0_6_0")

    if (global.anno_ships == nil) then
        global.anno_ships = {}
    end

    --Destroy all existing Kontors and give the player a Kontor item as compensation
    game.players[1].insert {name = "kontor", count = global.kontor_count}

    for i, kontor in pairs(global.kontors) do
        -----------------------------------------------------------
        global.banked_gold = global.banked_gold + kontor.accumulator.energy --the gold is stored in a global variable until another kontor is build

        global.kontor_count = global.kontor_count - 1
        -----------------------------------------------------------
        remove_from_grid(kontor.pole)
        -----------------------------------------------------------

        kontor.accumulator.destroy()
        kontor.pole.destroy()
        kontor.generator_for_pioneers.destroy()
        kontor.generator_for_settlers.destroy()
        kontor.generator_for_citizens.destroy()
        kontor.tradepost.destroy()
        kontor.kontor.destroy()

        global.kontors[i] = nil

        -----------------------------------------------------------
    end

    migrate_0_6_0()
end

function migrate_0_6_0()
    log("apply 0_6_0 to 0_6_1")
    migrate_0_6_1()
end

function migrate_0_6_1()
    log("apply 0_6_1 to 0_6_2")
    migrate_0_6_2()
end

function migrate_0_6_2()
    log("apply 0_6_2 to 0_6_3")

    if (global.towers == nil) then
        global.towers = {}
        global.towers[1] = {}
        global.towers[2] = {}
        global.towers[3] = {}
    end
    --This was forgotten in a previous migration
    if (global.anno_ships == nil) then
        global.anno_ships = {}
    end

    if (global.castles == nil) then
        global.castles = {}
    end

    migrate_0_6_3()
end

function migrate_0_6_3()
    log("apply 0_6_3 to 0_6_4")

    rebuild_houses("houses_pioneers", "invisible_house_pioneer")
    rebuild_houses("houses_settlers", "invisible_house_settler")
    rebuild_houses("houses_citizens", "invisible_house_citizen")

    migrate_0_7_1()
end

function migrate_0_6_4()
    log("apply0_6_4 to 0_6_5")
    migrate_0_6_5()
end

function migrate_0_6_5()
    log("apply 0_6_5 to 0_6_6")
    migrate_0_6_6()
end
function migrate_0_6_6()
    log("apply 0_6_6 to 0_6_7")
    migrate_0_6_7()
end

function migrate_0_6_7()
    log("apply 0_6_7 to 0_6_8")
    migrate_0_6_8()
end

function migrate_0_6_8()
    log("apply 0_6_8 to 0_6_9")
    migrate_0_6_9()
end

function migrate_0_6_9()
    log("apply 0_6_9 to 0_7_1")
    migrate_0_7_1()
end

function migrate_0_7_1()
    log("apply 0_7_1 to 0_7_2")
    migrate_0_7_2()
end

function migrate_0_7_2()
    log("apply 0_7_2 to 0_7_3")

    global.adventurers_guild_gui = {}
    global.adventurers_guild_gui.fertility_frame = {}
    global.adventurers_guild_gui.ore_frame = {}
    global.adventurers_guild_gui.fluid_frame = {}
    global.adventurers_guild_gui.alternative_frame = {}
    global.adventurers_guild_gui.fertility_frame.dropdown_last_selected = 0
    global.adventurers_guild_gui.ore_frame.dropdown_last_selected = 0
    global.adventurers_guild_gui.fluid_frame.dropdown_last_selected = 0
    global.adventurers_guild_gui.alternative_frame.dropdown_last_selected = 0
    global.adventurers_guild_gui.send_explorers = false
    global.adventurers_guild_gui.additional_frame_switch = "right"
end

function rebuild_houses(global_name, replacement)
    local copy = deepcopy2(global[global_name])
    global[global_name] = {}

    for number, house in pairs(copy) do
        local ent =
            house.house.surface.create_entity {
            name = replacement,
            position = house.house.position,
            force = house.house.force,
            fast_replace = true,
            spill = false,
            raise_built = true,
            create_build_effect_smoke = false
        }
    end
end

function allways_try_these()
    --Redo players gui
    for _, player in pairs(game.players) do
        create_gui_for_player(player)
    end

    for _, force in pairs(game.forces) do
        force.reset_technology_effects()
        --set stack_inserter bonus
        force.stack_inserter_capacity_bonus = 200
        --TODO remove this once the game allowes us to set this in another way
    end

    --Migrade tables
    if (global.houses_pioneers == nil) then
        global.houses_pioneers = {}
    end

    if (global.houses_pioniers ~= nil) then
        for number, ent in pairs(global.houses_pioniers) do
            global.houses_pioneers[number] = ent
        end
        global.houses_pioniers = nil
    end

    reset_global_ores_and_soils()
end

function deepcopy2(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            -- don't copy factorio rich objects
            return object
        elseif object.__self then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
