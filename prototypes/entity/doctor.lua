data:extend(
    {
        --  doctor item
        {
            type = "item",
            name = "doctor",
            icon = "__Annotorio__/graphics/icons/doctor_icon.png",
            icon_size = 64,
            subgroup = "luxus_building",
            order = "cc",
            place_result = "doctor",
            stack_size = 25
        },
        -- doctor recipe
        {
            type = "recipe",
            name = "doctor",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 64},
                {"ceramics", 48},
                {"anno_tool", 10}
            },
            result = "doctor"
        },
        --doctor entity
        {
            type = "electric-energy-interface",
            name = "doctor",
            placeable_by = {item = "doctor", count = 1},
            icon = "__Annotorio__/graphics/icons/doctor_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "doctor"},
            max_health = 900,
            collision_box = {{-1.2, -0.7}, {1.2, 0.7}},
            selection_box = {{-1.5, -1.0}, {1.5, 1.0}},
            corpse = "big-remnants",
            dying_explosion = "massive-explosion",
            energy_source = {
                type = "electric",
                usage_priority = "primary-input",
                drain = "0kW",
                buffer_capacity = "160kJ",
                input_flow_limit = "160kW"
            },
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/doctor.png",
                        priority = "extra-high",
                        width = 283,
                        height = 322,
                        scale = 0.25,
                        shift = util.by_pixel(-2,-8)
                    },
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
            energy_usage = "120kW"
        }
    }
)
