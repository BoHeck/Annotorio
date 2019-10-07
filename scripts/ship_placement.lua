if (global.anno_ships == nil) then
    global.anno_ships = {}
end

function if_ship_build(event, entity_name)
    local ent = event.created_entity

    if (entity_name == "carrack_cargo") then
        place_locomotive(ent, "carrack_loc", event.player_index)
    end
    if (entity_name == "sloop_cargo") then
        place_locomotive(ent, "sloop_loc", event.player_index)
    end
end

function if_ship_removed(event, entity_name)
    local ent = event.entity

    if (entity_name == "carrack_cargo") then
        global.anno_ships[ent.unit_number].loco.destroy()
        global.anno_ships[ent.unit_number] = nil
    end
    if (entity_name == "sloop_cargo") then
        global.anno_ships[ent.unit_number].loco.destroy()
        global.anno_ships[ent.unit_number] = nil
    end

    if (entity_name == "sloop_loc") then
        local cargo = find_cargo(ent)
        global.anno_ships[cargo.unit_number] = nil
        cargo.destroy()
    end

    if (entity_name == "carrack_loc") then
        local cargo = find_cargo(ent)
        global.anno_ships[cargo.unit_number] = nil
        cargo.destroy()
    end
end

function find_cargo(ent)
    for i, v in pairs(global.anno_ships) do
        if (v.loco == ent) then
            return v.cargo
        end
    end
end

function place_locomotive(cargo_wagon, loco_name, player_index)
    local new_ent =
        cargo_wagon.surface.create_entity {
        name = loco_name,
        position = get_locomotive_position(cargo_wagon),
        direction = get_locomotive_direction(cargo_wagon),
        force = game.players[player_index].force,
        fast_replace = false,
        player = game.players[player_index],
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    if (new_ent ~= nil) then
        --Keep track of the ships so we can later remove the locomotive
        global.anno_ships[cargo_wagon.unit_number] = {cargo = cargo_wagon, loco = new_ent}

        new_ent.rotatable = false
        cargo_wagon.rotatable = false
    else
        --Placing the Locomotive failed
        --Remove the cargo_wagon and give warning
        game.players[player_index].print(
            "Failed to place ship. Try a straight section with a little space behind the ship"
        )

        game.players[player_index].insert {name = cargo_wagon.prototype.items_to_place_this[1].name, count = 1}
        cargo_wagon.destroy()
    end
end

function get_locomotive_position(cargo_wagon)
    local pos = cargo_wagon.position
    local orientation = cargo_wagon.orientation
    local dist = cargo_wagon.prototype.collision_box.right_bottom.y

    --log(cargo_wagon.position.x)
    -- log(cargo_wagon.position.y)
    --log(orientation)

    --point north
    if (orientation == 0) then
        return {x = pos.x, y = pos.y + 4}
    end
    --point northeast
    if (orientation == 0.125) then
        return {x = pos.x - 3, y = pos.y + 3}
    end
    --point east
    if (orientation == 0.25) then
        return {x = pos.x - 4, y = pos.y}
    end
    --point southeast
    if (orientation == 0.375) then
        return {x = pos.x - 3, y = pos.y - 3}
    end
    --point south
    if (orientation == 0.5) then
        return {x = pos.x, y = pos.y - 4}
    end
    --point southwest
    if (orientation == 0.625) then
        return {x = pos.x + 3, y = pos.y - 3}
    end
    --point west
    if (orientation == 0.75) then
        return {x = pos.x + 4, y = pos.y}
    end
    --point northwest
    if (orientation == 0.875) then
        return {x = pos.x + 3, y = pos.y + 3}
    end

    return {x = pos.x, y = pos.y}
end

function get_locomotive_direction(cargo_wagon)
    local orientation = cargo_wagon.orientation

    --point north
    if (orientation == 0) then
        return 0
    end
    --point northeast
    if (orientation == 0.125) then
        return 1
    end
    --point east
    if (orientation == 0.25) then
        return 2
    end
    --point southeast
    if (orientation == 0.375) then
        return 3
    end
    --point south
    if (orientation == 0.5) then
        return 4
    end
    --point southwest
    if (orientation == 0.625) then
        return 5
    end
    --point west
    if (orientation == 0.75) then
        return 6
    end
    --point northwest
    if (orientation == 0.875) then
        return 7
    end

    return 0
end
