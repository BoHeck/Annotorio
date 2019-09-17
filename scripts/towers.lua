if (global.towers == nil) then
    global.towers = {}
    global.towers[1] = {}
    global.towers[2] = {}
    global.towers[3] = {}
end

function if_tower_build(event, entity_name)
    local ent = event.created_entity
    local player_index = event.player_index

    if (entity_name == "tower_wood") then
        global.towers[1][ent.unit_number] = ent
    end
    if (entity_name == "tower_stone") then
        global.towers[2][ent.unit_number] = ent
    end
end

function if_tower_removed(event, entity_name)
    local ent = event.entity

    if (entity_name == "tower_wood") then
        global.towers[1][ent.unit_number] = nil
    end
    if (entity_name == "tower_stone") then
        global.towers[2][ent.unit_number] = nil
    end
end
