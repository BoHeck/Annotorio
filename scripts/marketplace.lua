---------include these in the event collection-----------
--function ifMarketBuild()
--function ifMarketRemoved()
-------------------------------------------------------

require("scripts.united_grid")

if (global.markets == nil) then
    global.markets = {}
end

function ifMarketBuild(event, entity_name)
    local ent = event.created_entity
    if (entity_name == "marketplace_dummy") then
        local ent2 =
            ent.surface.create_entity {
            name = "marketplace_chest",
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
            name = "marketplace",
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }

        add_to_the_grid(ent3)

        global.markets[ent2.unit_number] = {
            pole = ent3,
            chest = ent2
        }

        ent.destroy()
    end
end

function ifMarketRemoved(event, entity_name)
    local ent = event.entity
    if (entity_name == "marketplace_chest") then
        remove_from_grid(global.markets[ent.unit_number].pole)

        global.markets[ent.unit_number].pole.destroy()
        global.markets[ent.unit_number] = nil
    end
end
