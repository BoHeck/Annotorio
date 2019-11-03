data:extend(
    {
        -- bakery item
        {
            type = "item",
            name = "bakery",
            icon = "__Annotorio__/graphics/icons/bakery_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[bakery]",
            place_result = "bakery",
            stack_size = 25
        },
        -- bakery recipe
        {
            type = "recipe",
            name = "bakery",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 26},
                {"anno_tool", 9},
                {"ceramics", 14}
            },
            result = "bakery"
        },
        -- bacon_omelet recipe
        {
            type = "recipe",
            name = "bacon_omelet",
            enabled = true,
            hidden = false,
            energy_required = 8,
            category = "bakery",
            ingredients = {
                {"egg", 4},
                {"pig", 1}
            },
            result = "bacon_omelet"
        },
        -- bacon_omelet item
        {
            type = "tool",
            name = "bacon_omelet",
            icon = "__Annotorio__/graphics/icons/bacon_omelet_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "f[bacon_omelet]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        {
            type = "recipe-category",
            name = "bakery"
        },
        -- bakery entity
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"bakery"},
            ingredient_count = 6,
            crafting_speed = 1,
            ---------------------

            name = "bakery",
            icon = "__Annotorio__/graphics/icons/bakery_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "bakery"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.2, -1.7}, {1.2, 1.7}},
            selection_box = {{-1.5, -2.0}, {1.5, 2.0}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/bakery.png",
                        priority = "extra-high",
                        width = 327,
                        height = 379,
                        scale = 0.375,
                        shift = util.by_pixel(15, 2)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/bakery_s.png",
                        priority = "extra-high",
                        width = 327,
                        height = 379,
                        scale = 0.375,
                        shift = util.by_pixel(15, 2),
                        draw_as_shadow = true
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 6,
                drain = "15kW"
            },
            energy_usage = "30kW",
            open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
            close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            working_sound = {
                sound = {
                    {
                        filename = "__base__/sound/assembling-machine-t1-1.ogg",
                        volume = 0.8
                    },
                    {
                        filename = "__base__/sound/assembling-machine-t1-2.ogg",
                        volume = 0.8
                    }
                },
                idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
                apparent_volume = 1.5
            }
        }
    }
)
