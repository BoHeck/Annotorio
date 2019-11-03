---------include these in the event collection-----------
--function if_mine_build(event)
-------------------------------------------------------

--This script replaces the mine_dummy with an appropriate mine depending on the ore below it

require("scripts.util")

function if_mine_build(event, entity_name) --entity_name is used to prevent a crash in case soime other function deleted the entity
    local ent = event.created_entity

    if (entity_name == "mine_dummy") then
        ent.surface.create_entity {
            name = find_correct_mine(ent),
            position = ent.position,
            force = game.players[event.player_index].force,
            fast_replace = false,
            player = game.players[event.player_index],
            spill = false,
            raise_built = false,
            create_build_effect_smoke = false
        }

        ent.destroy()
    end
end

function find_correct_mine(ent)
    local iron =
        ent.surface.count_entities_filtered {
        position = ent.position,
        name = "iron-ore",
        radius = 1.5
    }
    local copper =
        ent.surface.count_entities_filtered {
        position = ent.position,
        name = "copper-ore",
        radius = 1.5
    }
    local coal =
        ent.surface.count_entities_filtered {
        position = ent.position,
        name = "coal",
        radius = 1.5
    }
    local sulfur =
        ent.surface.count_entities_filtered {
        position = ent.position,
        name = "sulfur",
        radius = 1.5
    }
    local max = iron
    local result = "iron_mine"

    if (copper > max) then
        max = copper
        result = "copper_mine"
    end

    if (coal > max) then
        max = coal
        result = "coal_mine"
    end

    if (sulfur > max) then
        max = coal
        result = "sulfur_mine"
    end

    return result
    --Its presumed that there was at least 1 resource entity found else it would not have been possible to place the mine_dummy
end
