data:extend(
    {
        -- wheat_field item
        {
            type = "item",
            name = "wheat_field",
            icon = "__Annotorio__/graphics/icons/wheat_field_icon.png",
            icon_size = 64,
            subgroup = "pasture",
            order = "b[building]-r[wheat_field]",
            place_result = "wheat_field",
            stack_size = 25
        },
        -- wheat_field recipe
        {
            type = "recipe",
            name = "wheat_field",
            ingredients = {
                {"wood", 18},
                {"anno_tool", 6}
            },
            result = "wheat_field",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --wheat item
        {
            type = "item",
            name = "wheat",
            icon = "__Annotorio__/graphics/icons/wheat_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[wheat]",
            stack_size = 50
        },
        --wheat recipe
        {
            type = "recipe",
            name = "wheat",
            enabled = true,
            hidden = false,
            energy_required = 18,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "wheat"
        },
        -- wheat_field entity
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "wheat",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "wheat_field",
            icon = "__Annotorio__/graphics/icons/wheat_field_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation","not-rotatable"},
            minable = {mining_time = 0.2, result = "wheat_field"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.7, -2.2}, {1.7, 2.2}},
            selection_box = {{-2.0, -2.5}, {2.0, 2.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/wheat_field.png",
                        priority = "extra-high",
                        width = 256,
                        height = 330,
                        scale = 0.5
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 16,
                drain = "1.666666kW"
            },
            energy_usage = "3.333333kW",
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
