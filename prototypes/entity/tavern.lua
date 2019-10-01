data:extend(
    {
        --  tavern
        {
            type = "item",
            name = "tavern",
            icon = "__Annotorio__/graphics/icons/tavern_icon.png",
            icon_size = 64,
            subgroup = "luxus_building",
            order = "bb",
            place_result = "tavern",
            stack_size = 25
        },
        -- tavern
        {
            type = "recipe",
            name = "tavern",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 36},
                {"ceramics", 24},
                {"anno_tool", 5}
            },
            result = "tavern"
        },
        {
            type = "electric-energy-interface",
            name = "tavern",
            placeable_by = {item = "tavern", count = 1},
            icon = "__Annotorio__/graphics/icons/tavern_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "tavern"},
            max_health = 900,
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            corpse = "big-remnants",
            dying_explosion = "massive-explosion",
            energy_source = {
                type = "electric",
                usage_priority = "primary-input",
                drain = "0kW",
                buffer_capacity = "120kJ",
                input_flow_limit = "120kW"
            },
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/tavern.png",
                        priority = "extra-high",
                        width = 391,
                        height = 502,
                        -- scale = 0.4
                        scale = 0.22829
                    }
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
            energy_usage = "120kW"
        }
    }
)
