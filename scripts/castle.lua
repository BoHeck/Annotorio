local desired_stack_size = 20

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
        global.castles[ent.unit_number] = nil
    end
end

function castle_on_every_x_ticks()
    distribute("anno_arrow", 1)
    distribute("musket_ball", 2)
end

function distribute(item_name, index)
    log("distribute")

    local availible_items = 0

    for i, castle in pairs(global.castles) do
        availible_items =
            availible_items + castle.armory.get_inventory(defines.inventory.chest).get_item_count(item_name)
        log("castle")
    end
    log(availible_items)

    local availible_items_total = availible_items
    local count

    for j, tower in pairs(global.towers[index]) do
        if (availible_items <= 0) then
            break
        end
        log("tower")

        count = tower.get_inventory(defines.inventory.turret_ammo).get_item_count(item_name)

        if (count < desired_stack_size) then
            local a = math.min(availible_items, desired_stack_size - count)
            availible_items = availible_items - a
            log(a)
            tower.insert {name = item_name, count = a}
        end
    end
    log("--------part2------------")
    local distributed_count = availible_items_total - availible_items

    for i, castle in pairs(global.castles) do
        if (distributed_count <= 0) then
            break
        end
        log("castle")
        availible_items = castle.armory.get_inventory(defines.inventory.chest).get_item_count(item_name)

        local remove = math.min(availible_items, distributed_count)

        distributed_count = distributed_count - remove

        castle.armory.get_inventory(defines.inventory.chest).remove({name = item_name, count = remove})
    end
end
