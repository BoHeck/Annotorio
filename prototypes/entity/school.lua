data:extend(
    {
        --  school item
        {
            type = "item",
            name = "school",
            icon = "__Annotorio__/graphics/icons/school_icon.png",
            icon_size = 64,
            subgroup = "luxus_building",
            order = "dd",
            place_result = "school",
            stack_size = 25
        },
        -- school recipe
        {
            type = "recipe",
            name = "school",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 64},
                {"ceramics", 120},
                {"anno_tool", 36}
            },
            result = "school"
        },
        --school entity
        {
            type = "electric-energy-interface",
            name = "school",
            placeable_by = {item = "school", count = 1},
            icon = "__Annotorio__/graphics/icons/school_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "school"},
            max_health = 900,
            collision_box = {{-2.2, -1.7}, {2.2, 1.7}},
            selection_box = {{-2.5, -2.0}, {2.5, 2.0}},
            corpse = "big-remnants",
            dying_explosion = "massive-explosion",
            energy_source = {
                type = "electric",
                usage_priority = "primary-input",
                drain = "0kW",
                buffer_capacity = "180kJ",
                input_flow_limit = "180kW"
            },
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/school.png",
                        priority = "extra-high",
                        width = 760,
                        height = 582,
                        scale = 0.5,
                        shift = util.by_pixel(8, 20)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/school_s.png",
                        priority = "extra-high",
                        width = 760,
                        height = 582,
                        scale = 0.5,
                        shift = util.by_pixel(8, 20),
                        draw_as_shadow = true
                    }
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
            energy_usage = "120kW"
        }
    }
)
