data:extend(
    {
        -- chicken_pen item
        {
            type = "item",
            name = "chicken_pen",
            icon = "__Annotorio__/graphics/icons/chicken_pen_icon.png",
            icon_size = 64,
            subgroup = "pasture",
            order = "b[building]-r[chicken_pen]",
            place_result = "chicken_pen",
            stack_size = 25
        },
        -- chicken_pen recipe
        {
            type = "recipe",
            name = "chicken_pen",
            ingredients = {
                {"wood", 18},
                {"anno_tool", 6},
                {"ceramics", 2}
            },
            result = "chicken_pen",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- egg item
        {
            type = "item",
            name = "egg",
            icon = "__Annotorio__/graphics/icons/egg_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[egg]",
            stack_size = 50
        },
        -- egg recipe
        {
            type = "recipe",
            name = "egg",
            enabled = true,
            hidden = false,
            energy_required = 8,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {
                {"wheat", 4}
            },
            result = "egg"
        },
        -- chicken_pen entity
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "egg",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "chicken_pen",
            icon = "__Annotorio__/graphics/icons/chicken_pen_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "chicken_pen"},
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
                        filename = "__Annotorio__/graphics/entity/chicken_pen.png",
                        priority = "extra-high",
                        width = 256,
                        height = 256,
                        scale = 0.5
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 16,
                drain = "5kW"
            },
            energy_usage = "10kW",
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
