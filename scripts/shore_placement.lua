require("scripts.util")

function if_shipyard_build(event, entity_name)
    local ent = event.created_entity

    if (entity_name == "shipyard_dummy") then
        ent.surface.create_entity {
            name = "shipyard",
            position = ent.position,
            direction = ent.direction,
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

--[[
function reverse_direction(direction)
    if (defines.direction.north == direction) then
        return defines.direction.south
    end
    if (defines.direction.south == direction) then
        return defines.direction.north
    end
    if (defines.direction.east == direction) then
        return defines.direction.west
    end
    if (defines.direction.west == direction) then
        return defines.direction.east
    end

    return defines.direction.north
end
]]
