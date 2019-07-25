---------include these in the event collection-----------
--function ifKontorBuild()
--function ifKontorRemoved()
-------------------------------------------------------

--This script implements the behaviour of the Kontor building
--The Kontor provides the powerpole behaviour plus the accumulator behaviour
--This is achieved by creating an invisible accumulator under it when it is placed (and removing it on death)

require("scripts.shared_inventory")
require("scripts.technology")

if (global.kontors == nil) then
    global.kontors = {}
    global.kontor_count = 0
end
if (global.banked_gold == nil) then
    global.banked_gold = 50000000
end

--place invisible accumulator and register it
function ifKontorBuild(event, entity_name)
    local ent = event.created_entity
    if (entity_name == "kontor") then
        local ent2 =
            ent.surface.create_entity {
            name = "hidden_accumulator",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }

        local ent3 =
            ent.surface.create_entity {
            name = "hidden_pole",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }

        local ent4 =
            ent.surface.create_entity {
            name = "hidden_generator_for_pioneers",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }
        local ent5 =
            ent.surface.create_entity {
            name = "hidden_generator_for_settlers",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }
        local ent6 =
            ent.surface.create_entity {
            name = "hidden_generator_for_citizens",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }
        local ent7 =
            ent.surface.create_entity {
            name = "hidden_trade_post",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }

        global.kontors[ent.unit_number] = {
            kontor = ent,
            accumulator = ent2,
            pole = ent3,
            generator_for_pioneers = ent4,
            generator_for_settlers = ent5,
            generator_for_citizens = ent6,
            tradepost = ent7
        }

        ent2.energy = global.banked_gold
        global.banked_gold = 0
        ------------------------------------------

        add_to_the_grid(ent3)

        ------------------------------------------
        local f = game.players[event.player_index].force
        if (f.technologies["settle_island"].researched == false) then
            f.technologies["settle_island"].researched = true
        end
        ------------------------------------------

        global.kontor_count = global.kontor_count + 1
    --------------------------------------------
    end
end

--remove invisible accumulator and deregister it
--also handle shared_resources
function ifKontorRemoved(event, entity_name)
    local ent = event.entity
    if (entity_name == "kontor") then
        -----------------------------------------------------------
        global.banked_gold = global.banked_gold + global.kontors[ent.unit_number].accumulator.energy --the gold is stored in a global variable until another kontor is build

        global.kontor_count = global.kontor_count - 1
        -----------------------------------------------------------
        remove_from_grid(global.kontors[ent.unit_number].pole)
        -----------------------------------------------------------

        global.kontors[ent.unit_number].accumulator.destroy()
        global.kontors[ent.unit_number].pole.destroy()
        global.kontors[ent.unit_number].generator_for_pioneers.destroy()
        global.kontors[ent.unit_number].generator_for_settlers.destroy()
        global.kontors[ent.unit_number].generator_for_citizens.destroy()
        global.kontors[ent.unit_number].tradepost.destroy()
        global.kontors[ent.unit_number] = nil
    end
end
