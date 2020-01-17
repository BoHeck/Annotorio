---------include these in the event collection-----------
--function ifKontorBuild()
--function ifKontorRemoved()
-------------------------------------------------------

--This script implements the behaviour of the Kontor building
--The Kontor provides the powerpole behaviour plus the accumulator behaviour
--This is achieved by creating an invisible accumulator under it when it is placed (and removing it on death)

require("scripts.shared_inventory")
require("scripts.technology")
require("scripts.util")

--------------------globals--------------------------
if (global.kontors == nil) then
    global.kontors = {}
    global.kontor_count = 0
end

local names_stage_1 = {
    "kontor_container_west",
    "kontor_container_east",
    "kontor_container_north",
    "kontor_container_south"
}
-------------------------------------------------------

function if_kontor_upgraded(event, entity_name)
    if (entity_name == "kontor_upgrade_kit_1") then
        if (upgrade_kit(event, entity_name, names_stage_1)) then
            set_progress(game.players[event.player_index].force, "upgrade_your_kontor_1", 1)
        end
    end
end

function upgrade_kit(event, entity_name, names)
    local ent = event.created_entity
    local player = game.players[event.player_index]

    local kon =
        ent.surface.find_entities_filtered {
        position = ent.position,
        name = names,
        limit = 1
    }

    if (kon[1] ~= nil) then
        ent.destroy()
        upgrade_kontor(kon[1])
        return true
    else
        player.print("Can only be placed on a Kontor")
        ent.destroy()
        player.insert {name = entity_name, count = 1} --entity_name = item name which places it
        return false
    end
end

function upgrade_kontor(kontor_container)
    local replacement_name = global.kontor_replacement_table[kontor_container.name]
    local old_unit_number = kontor_container.unit_number

    local new_kont =
        kontor_container.surface.create_entity {
        name = replacement_name,
        position = kontor_container.position,
        force = kontor_container.force,
        fast_replace = true,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = true
    }

    ----------------------------------
    global.kontors[new_kont.unit_number] = global.kontors[old_unit_number]

    global.kontors[new_kont.unit_number].kontor = new_kont

    global.kontors[old_unit_number] = nil

    ----------------------------------
    upgrade_cranes(new_kont)
end

function upgrade_cranes(new_kont)
    local kontor = global.kontors[new_kont.unit_number]
    log(kontor.crane_1.name)
    local replacement_name = global.kontor_replacement_table[kontor.crane_1.name]
    log(replacement_name)

    local pos_old_1 = kontor.crane_1.position
    local pos_old_2 = kontor.crane_2.position

    kontor.crane_2.teleport({pos_old_2.x + 100, pos_old_2.y + 100})

    local ent8 =
        new_kont.surface.create_entity {
        name = replacement_name,
        position = kontor.crane_1.position,
        direction = kontor.crane_1.direction,
        force = kontor.crane_1.force,
        fast_replace = true,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    ent8.rotatable = false

    local ent9 =
        new_kont.surface.create_entity {
        name = replacement_name,
        position = kontor.crane_2.position,
        direction = kontor.crane_2.direction,
        force = kontor.crane_2.force,
        fast_replace = true,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent9.rotatable = false
    ent9.teleport(pos_old_2)

    kontor.crane_1 = ent8
    kontor.crane_2 = ent9
end

function if_kontor_build(event, entity_name)
    if (entity_name ~= "kontor_dummy") then
        return
    end

    local ent = event.created_entity

    --local player_index = event.player_index

    local data = determine_kontor_data(ent.direction, ent.position)
    local player_force = game.players[event.player_index].force
    local player = game.players[event.player_index]

    local ent1 =
        ent.surface.create_entity {
        name = data.container_name,
        position = data.container_position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    local ent2 =
        ent.surface.create_entity {
        name = "hidden_accumulator",
        position = ent.position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    local ent3 =
        ent.surface.create_entity {
        name = "hidden_pole",
        position = data.pole_position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    local ent4 =
        ent.surface.create_entity {
        name = "hidden_generator_for_pioneers",
        position = ent.position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent5 =
        ent.surface.create_entity {
        name = "hidden_generator_for_settlers",
        position = ent.position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent6 =
        ent.surface.create_entity {
        name = "hidden_generator_for_citizens",
        position = ent.position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent7 =
        ent.surface.create_entity {
        name = "hidden_trade_post",
        position = data.trade_post_position,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent8 =
        ent.surface.create_entity {
        name = "anno_crane",
        position = data.crane_1_position,
        direction = data.crane_1_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent8.rotatable = false

    local ent9 =
        ent.surface.create_entity {
        name = "anno_crane",
        position = data.crane_2_position,
        direction = data.crane_2_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent9.rotatable = false

    -----------------------------------------
    ent.surface.create_entity {
        name = "water_rail_straight",
        position = data.rail_1_position,
        direction = data.rail_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent.surface.create_entity {
        name = "water_rail_straight",
        position = data.rail_2_position,
        direction = data.rail_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent.surface.create_entity {
        name = "water_rail_straight",
        position = data.rail_3_position,
        direction = data.rail_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    ent.surface.create_entity {
        name = "water_rail_straight",
        position = data.rail_4_position,
        direction = data.rail_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    local ent10 =
        ent.surface.create_entity {
        name = "anno_harbor",
        position = data.harbor_1_position,
        direction = data.harbor_1_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }
    local ent11 =
        ent.surface.create_entity {
        name = "anno_harbor",
        position = data.harbor_2_position,
        direction = data.harbor_2_rotation,
        force = player_force,
        fast_replace = false,
        player = player,
        spill = false,
        raise_built = false,
        create_build_effect_smoke = false
    }

    ---------------------------------------

    global.kontors[ent1.unit_number] = {
        kontor = ent1,
        accumulator = ent2,
        pole = ent3,
        generator_for_pioneers = ent4,
        generator_for_settlers = ent5,
        generator_for_citizens = ent6,
        tradepost = ent7,
        crane_1 = ent8,
        crane_2 = ent9,
        harbor_1 = ent10,
        harbor_2 = ent11
    }

    ------------------------------------------
    local force_index

    for index, force2 in pairs(game.forces) do
        if (force2 == player.force) then
            force_index = index
            break
        end
    end

    ent2.energy = global.banked_gold[force_index]
    global.banked_gold[force_index] = 0
    ------------------------------------------

    add_to_the_grid(ent3)

    ------------------------------------------
    if (set_progress(player_force, "settle_island", 1)) then
        player_force.set_spawn_position(player.position, player.surface)
    end
    ------------------------------------------

    global.kontor_count = global.kontor_count + 1
    --------------------------------------------
    ent.destroy()
end

--remove invisible accumulator and deregister it
--also handle shared_resources
function ifKontorRemoved(event, entity_name)
    local ent = event.entity
    local force_index

    for index, force in pairs(game.forces) do
        if (force == event.entity.force) then
            force_index = index
            break
        end
    end



    if string.find(entity_name, "kontor_container") then
        -----------------------------------------------------------
        global.banked_gold[force_index] = global.banked_gold[force_index] + global.kontors[ent.unit_number].accumulator.energy --the gold is stored in a global variable until another kontor is build

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
        global.kontors[ent.unit_number].crane_1.destroy()
        global.kontors[ent.unit_number].crane_2.destroy()
        global.kontors[ent.unit_number].harbor_1.destroy()
        global.kontors[ent.unit_number].harbor_2.destroy()
        global.kontors[ent.unit_number] = nil
    end
end

function determine_kontor_data(direction, position)
    local name
    local container_pos
    local trade_pos
    local pole_pos

    local crane_1_pos
    local crane_1_rot
    local crane_2_pos
    local crane_2_rot

    local rail_1_pos
    local rail_2_pos
    local rail_3_pos
    local rail_4_pos
    local rail_rot

    local harbor_1_pos
    local harbor_2_pos

    if (direction == 0) then
        name = "kontor_container_north"
        container_pos = {x = position.x, y = position.y + 1}
        pole_pos = {x = position.x + 1.25, y = position.y + 2.25}
        trade_pos = {x = position.x - 1.25, y = position.y + 2.25}

        crane_1_pos = {x = position.x + 1.25, y = position.y - 0.25}
        crane_2_pos = {x = position.x + 1.25, y = position.y - 0.25}

        crane_1_rot = 0
        crane_2_rot = 4
        rail_rot = 2

        rail_1_pos = {x = position.x - 3, y = position.y - 3}
        rail_2_pos = {x = position.x - 1, y = position.y - 3}
        rail_3_pos = {x = position.x + 1, y = position.y - 3}
        rail_4_pos = {x = position.x + 3, y = position.y - 3}

        harbor_1_pos = {x = position.x - 3, y = position.y - 5}
        harbor_2_pos = {x = position.x + 3, y = position.y - 1.5}
        harbor_1_rot = 6
        harbor_2_rot = 2
    end
    if (direction == 2) then
        name = "kontor_container_east"
        container_pos = position
        pole_pos = {x = position.x - 1.25, y = position.y + 1.25}
        trade_pos = {x = position.x - 1.25, y = position.y - 1.25}

        crane_1_pos = {x = position.x + 2.25, y = position.y + 1.25}
        crane_2_pos = {x = position.x + 2.25, y = position.y + 1.25}

        crane_1_rot = 2
        crane_2_rot = 6
        rail_rot = 4

        rail_1_pos = {x = position.x + 5, y = position.y - 3}
        rail_2_pos = {x = position.x + 5, y = position.y - 1}
        rail_3_pos = {x = position.x + 5, y = position.y + 1}
        rail_4_pos = {x = position.x + 5, y = position.y + 3}

        harbor_1_pos = {x = position.x + 7, y = position.y - 3}
        harbor_2_pos = {x = position.x + 3, y = position.y + 3}
        harbor_1_rot = 0
        harbor_2_rot = 4
    end
    if (direction == 4) then
        name = "kontor_container_south"
        container_pos = {x = position.x, y = position.y - 1}
        pole_pos = {x = position.x - 1.25, y = position.y - 2.25}
        trade_pos = {x = position.x + 1.25, y = position.y - 2.25}

        crane_1_pos = {x = position.x - 1.25, y = position.y + 0.25}
        crane_2_pos = {x = position.x - 1.25, y = position.y + 0.25}

        crane_1_rot = 4
        crane_2_rot = 0
        rail_rot = 2

        rail_1_pos = {x = position.x - 3, y = position.y + 3}
        rail_2_pos = {x = position.x - 1, y = position.y + 3}
        rail_3_pos = {x = position.x + 1, y = position.y + 3}
        rail_4_pos = {x = position.x + 3, y = position.y + 3}

        harbor_1_pos = {x = position.x + 3, y = position.y + 5}
        harbor_2_pos = {x = position.x - 3, y = position.y + 1}
        harbor_1_rot = 2
        harbor_2_rot = 6
    end
    if (direction == 6) then
        name = "kontor_container_west"
        container_pos = position
        pole_pos = {x = position.x + 1.25, y = position.y - 1.25}
        trade_pos = {x = position.x + 1.25, y = position.y + 1.25}

        crane_1_pos = {x = position.x - 2.25, y = position.y - 1.25}
        crane_2_pos = {x = position.x - 2.25, y = position.y - 1.25}

        crane_1_rot = 6
        crane_2_rot = 2
        rail_rot = 4

        rail_1_pos = {x = position.x - 5, y = position.y - 3}
        rail_2_pos = {x = position.x - 5, y = position.y - 1}
        rail_3_pos = {x = position.x - 5, y = position.y + 1}
        rail_4_pos = {x = position.x - 5, y = position.y + 3}

        harbor_1_pos = {x = position.x - 7, y = position.y + 3}
        harbor_2_pos = {x = position.x - 3, y = position.y - 3}
        harbor_1_rot = 4
        harbor_2_rot = 0
    end

    return {
        container_name = name,
        container_position = container_pos,
        trade_post_position = trade_pos,
        pole_position = pole_pos,
        crane_1_position = crane_1_pos,
        crane_1_rotation = crane_1_rot,
        crane_2_position = crane_2_pos,
        crane_2_rotation = crane_2_rot,
        rail_1_position = rail_1_pos,
        rail_2_position = rail_2_pos,
        rail_3_position = rail_3_pos,
        rail_4_position = rail_4_pos,
        rail_rotation = rail_rot,
        harbor_1_position = harbor_1_pos,
        harbor_2_position = harbor_2_pos,
        harbor_1_rotation = harbor_1_rot,
        harbor_2_rotation = harbor_2_rot
    }
end
