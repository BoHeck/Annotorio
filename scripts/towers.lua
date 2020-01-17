function if_tower_build(event, entity_name)
    local ent = event.created_entity
    local player_index = event.player_index

    if (entity_name == "tower_wood") then
        global.towers[1][ent.force.name][ent.unit_number] = ent
    end
    if (entity_name == "tower_stone") then
        global.towers[2][ent.force.name][ent.unit_number] = ent
    end
end

function if_tower_removed(event, entity_name)
    local ent = event.entity

    if (entity_name == "tower_wood") then
        global.towers[1][ent.force.name][ent.unit_number] = nil
    end
    if (entity_name == "tower_stone") then
        global.towers[2][ent.force.name][ent.unit_number] = nil
    end
end
