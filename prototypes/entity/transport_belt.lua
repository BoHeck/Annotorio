local anno_wooden_underground_belt = table.deepcopy(data.raw["underground-belt"]["underground-belt"])
anno_wooden_underground_belt.name = "anno_wooden_underground_belt"
anno_wooden_underground_belt.minable = {mining_time = 0.1, result = "anno_wooden_underground_belt"}

local anno_wodden_splitter = table.deepcopy(data.raw["splitter"]["splitter"])
anno_wodden_splitter.name = "anno_wodden_splitter"
anno_wodden_splitter.minable = {mining_time = 0.1, result = "anno_wodden_splitter"}


data:extend(
    {
        anno_wooden_underground_belt,
        anno_wodden_splitter,
        {
            type = "transport-belt",
            name = "anno_wooden_belt",
            icon = "__base__/graphics/icons/transport-belt.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.1, result = "anno_wooden_belt"},
            max_health = 150,
            corpse = "transport-belt-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 90
                }
            },
            collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            working_sound = {
                sound = {
                    filename = "__base__/sound/transport-belt.ogg",
                    volume = 0.4
                },
                persistent = true
            },
            animation_speed_coefficient = 32,
            belt_animation_set = basic_belt_animation_set,
            fast_replaceable_group = "transport-belt",
            --next_upgrade = "fast-transport-belt",
            speed = 0.03125,
            connector_frame_sprites = transport_belt_connector_frame_sprites,
            circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
            circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
            circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
        }
    }
)
