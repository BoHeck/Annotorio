if (global.castles == nil) then
    global.castles = {}
end

function if_castle_build(event, entity_name)
    if (entity_name ~= "castle_dummy") then
        return
    end

    local ent = event.created_entity
    local player_index = event.player_index

    local ent1 =
        ent.surface.create_entity {
        name = "castle",
        position = ent.position,
        force = game.players[player_index].force,
        fast_replace = false,
        player = game.players[player_index],
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent2 =
        ent.surface.create_entity {
        name = "castle_armory",
        position = ent.position,
        force = game.players[player_index].force,
        fast_replace = false,
        player = game.players[player_index],
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    global.castles[ent2.unit_number] = {
        castle = ent1,
        armory = ent2
    }

    ent.destroy()
end





function if_castle_removed(event, entity_name)
    local ent = event.entity

    if (entity_name == "castle_armory") then
        global.castles[ent.unit_number].castle.destroy()
        global.castles[ent.unit_number]=nil
    end
end