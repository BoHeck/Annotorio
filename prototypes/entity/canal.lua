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
            width = 81,
            height = 89,
            scale = 0.5
        },
        straight_vertical = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_vertical.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        straight_horizontal = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_horizontal.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        corner_up_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_up_right.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        corner_up_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_up_left.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        corner_down_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_down_right.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        corner_down_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_corner_down_left.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        t_up = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_up.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        t_down = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_down.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        t_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_right.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        t_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_t_left.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        cross = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_cross.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        ending_up = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_up.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        ending_down = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_down.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        ending_right = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_right.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        ending_left = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_ending_left.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        ---------------------------------------
        straight_vertical_window = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_vertical.png",
            priority = "extra-high",
            width = 81,
            height = 89,
            scale = 0.5
        },
        straight_horizontal_window = {
            filename = "__Annotorio__/graphics/entity/canal/pipe_straight_horizontal.png",
            priority = "extra-high",
            width = 81,
            height = 89,
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
        --  mine dummy
        {
            type = "item",
            name = "canal",
            icon = "__Annotorio__/graphics/icons/canal_icon.png",
            icon_size = 64,
            subgroup = "transport",
            order = "b[building]-k[canal]",
            place_result = "canal",
            stack_size = 250
        },
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
                    {
                        filename = "__base__/sound/pipe.ogg",
                        volume = 0.85
                    }
                },
                match_volume_to_activity = true,
                max_sounds_per_type = 3
            },
            horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
            vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
        }
    }
)
