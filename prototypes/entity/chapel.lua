data:extend(
    {
        --  chapel
        {
            type = "item",
            name = "chapel",
            icon = "__Annotorio__/graphics/icons/chapel_icon.png",
            icon_size = 64,
            subgroup = "luxus_building",
            order = "aa",
            place_result = "chapel",
            stack_size = 25
        },
        --chapel
        {
            type = "recipe",
            name = "chapel",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 22},
                {"anno_tool", 3}
            },
            result = "chapel"
        },
        {
            type = "electric-energy-interface",
            name = "chapel",
            placeable_by = {item = "chapel", count = 1},
            icon = "__Annotorio__/graphics/icons/chapel_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation","not-rotatable"},
            minable = {mining_time = 0.2, result = "chapel"},
            max_health = 900,
            collision_box = {{-1.8, -2.7}, {1.8, 2.7}},
            selection_box = {{-2, -3}, {2, 3}},
            corpse = "big-remnants",
            dying_explosion = "massive-explosion",
            energy_source = {
                type = "electric",
                usage_priority = "primary-input",
                drain = "0kW",
                buffer_capacity = "15kJ",
                input_flow_limit = "15kW"
            },
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/chapel.png",
                        priority = "extra-high",
                        width = 624,
                        height = 898,
                        scale = 0.5,
                        shift = util.by_pixel(91, -76)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/chapel_s.png",
                        priority = "extra-high",
                        width = 624,
                        height = 898,
                        scale = 0.5,
                        shift = util.by_pixel(91, -76),
                        draw_as_shadow = true
                    }
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
            energy_usage = "15kW"
        }
    }
)
