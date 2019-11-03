data:extend(
    {
        --  apothecary
        {
            type = "item",
            name = "apothecary",
            icon = "__Annotorio__/graphics/icons/apothecary_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[apothecary]",
            place_result = "apothecary",
            stack_size = 25
        },
        --apothecary
        {
            type = "recipe",
            name = "apothecary",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 36},
                {"ceramics", 18},
                {"anno_tool", 12}
            },
            result = "apothecary"
        },
        {
            type = "recipe-category",
            name = "apothecary"
        },
        -- fertilizer item
        {
            type = "item",
            name = "fertilizer",
            icon = "__Annotorio__/graphics/icons/fertilizer_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "a[fertilizer]",
            stack_size = 250
        },
        --gun_powder item
        {
            type = "item",
            name = "gun_powder",
            icon = "__Annotorio__/graphics/icons/gun_powder_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "a[gun_powder]",
            stack_size = 50
        },
        -- gun_powder recipe
        {
            type = "recipe",
            name = "gun_powder",
            enabled = true,
            hidden = false,
            energy_required = 8,
            category = "apothecary",
            ingredients = {
                {"fertilizer", 3},
                {"coal", 1},
                {"sulfur", 1}
            },
            results = {{"gun_powder", 5}}
        },
        --apothecary
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"apothecary"},
            ingredient_count = 4,
            crafting_speed = 1,
            ---------------------

            name = "apothecary",
            icon = "__Annotorio__/graphics/icons/apothecary_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "apothecary"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
            selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/apothecary.png",
                        priority = "extra-high",
                        width = 288,
                        height = 260,
                        scale = 0.5,
                        shift = util.by_pixel(18, 10)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/apothecary_s.png",
                        priority = "extra-high",
                        width = 288,
                        height = 260,
                        scale = 0.5,
                        shift = util.by_pixel(18, 10),
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
