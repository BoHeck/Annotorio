local empty = {
    filename = "__core__/graphics/empty.png",
    priority = "extra-high",
    width = 1,
    height = 1
}

local pipepictures = function()
    return {
        straight_vertical_single = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_vertical_single.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_vertical = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_vertical.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_horizontal = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_up_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_up_right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_up_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_up_left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_down_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_down_right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_down_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_down_left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_up = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_up.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_down = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_down.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        cross = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_cross.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_up = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_up.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_down = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_down.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ---------------------------------------
        straight_vertical_window = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_vertical.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_horizontal_window = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        horizontal_window_background = empty,
        vertical_window_background = empty,
        fluid_background = empty,
        low_temperature_flow = empty,
        middle_temperature_flow = empty,
        high_temperature_flow = empty,
        gas_flow = empty
    }
end

data:extend(
    {
        -- canal item
        {
            type = "item",
            name = "canal",
            icon = "__Annotorio__/graphics/icons/canal_icon.png",
            icon_size = 64,
            subgroup = "plantation",
            order = "b[building]-z[canal]",
            place_result = "canal",
            stack_size = 250
        },
        -- canal_to_ground item
        {
            type = "item",
            name = "canal_to_ground",
            icon = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-down.png",
            icon_size = 64,
            subgroup = "plantation",
            order = "b[building]-zz[canal]",
            place_result = "canal_to_ground",
            stack_size = 250
        },
        -- canal recipe
        {
            type = "recipe",
            name = "canal",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"ceramics", 4}
            },
            result = "canal"
        },
        -- canal_to_ground recipe
        {
            type = "recipe",
            name = "canal_to_ground",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"ceramics", 24}
            },
            result = "canal_to_ground"
        },
        -- canal entity
        {
            type = "pipe",
            name = "canal",
            icon = "__Annotorio__/graphics/icons/canal_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
            minable = {mining_time = 0.1, result = "canal"},
            max_health = 100,
            corpse = nil,
            resistances = {
                {
                    type = "fire",
                    percent = 100
                },
                {
                    type = "impact",
                    percent = 100
                }
            },
            fast_replaceable_group = "pipe",
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box = {
                base_area = 1,
                pipe_connections = {
                    {position = {0, -1}},
                    {position = {1, 0}},
                    {position = {0, 1}},
                    {position = {-1, 0}}
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            pictures = pipepictures(),
            working_sound = {
                sound = {
                    filename = "__Annotorio__/sound/Flowing_Water_1_Short.wav",
                    volume = 0.75
                },
                --match_volume_to_activity = true,
                max_sounds_per_type = 1
            },
            horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
            vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
        },
        {
            type = "pipe-to-ground",
            name = "canal_to_ground",
            icon = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-down.png",
            icon_size = 64,
            flags = {"placeable-neutral", "player-creation"},
            minable = {mining_time = 0.1, result = "canal_to_ground"},
            max_health = 150,
            corpse = nil,
            resistances = {
                {
                    type = "fire",
                    percent = 100
                },
                {
                    type = "impact",
                    percent = 100
                }
            },
            fast_replaceable_group = "pipe",
            collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box = {
                base_area = 1,
                pipe_connections = {
                    {position = {0, -1}},
                    {
                        position = {0, 1},
                        max_underground_distance = 6
                    }
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            pictures = {
                up = {
                    filename = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-up.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    scale = 0.5
                },
                down = {
                    filename = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-down.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    scale = 0.5
                },
                left = {
                    filename = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-left.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    scale = 0.5
                },
                right = {
                    filename = "__Annotorio__/graphics/entity/canal/to_ground/pipe-to-ground-right.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    scale = 0.5
                }
            }
        }
    }
)
