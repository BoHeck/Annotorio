data:extend(
    {
        -- pig_farm item
        {
            type = "item",
            name = "pig_farm",
            icon = "__Annotorio__/graphics/icons/pig_farm_icon.png",
            icon_size = 64,
            subgroup = "pasture",
            order = "b[building]-r[pig_farm]",
            place_result = "pig_farm",
            stack_size = 25
        },
        -- pig_farm recipe
        {
            type = "recipe",
            name = "pig_farm",
            ingredients = {
                {"wood", 18},
                {"anno_tool", 6}
            },
            result = "pig_farm",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --Pig item
        {
            type = "item",
            name = "pig",
            icon = "__Annotorio__/graphics/icons/pig_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[pig]",
            stack_size = 50
        },
        --pig recipe
        {
            type = "recipe",
            name = "pig",
            enabled = true,
            hidden = false,
            energy_required = 16,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {
                {"seedling", 4}
            },
            main_product = "pig",
            results = {
                {"pig", 1},
                {"fertilizer", 2}
            }
        },
        -- pig_farm entity
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "pig",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "pig_farm",
            icon = "__Annotorio__/graphics/icons/pig_farm_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "pig_farm"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
            selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/pig_farm.png",
                        priority = "extra-high",
                        width = 320,
                        height = 320,
                        scale = 0.5
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 16,
                drain = "3.3333333kW"
            },
            energy_usage = "6.666666kW",
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
