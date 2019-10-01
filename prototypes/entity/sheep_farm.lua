data:extend(
    {
        -- sheep farm
        {
            type = "item",
            name = "sheep_farm",
            icon = "__Annotorio__/graphics/icons/sheep_farm_icon.png",
            icon_size = 64,
            subgroup = "pasture",
            order = "b[building]-r[sheep_farm]",
            place_result = "sheep_farm",
            stack_size = 25
        },
        -- sheep farm
        {
            type = "recipe",
            name = "sheep_farm",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "sheep_farm",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --Wool
        {
            type = "item",
            name = "wool",
            icon = "__Annotorio__/graphics/icons/wool_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[wool]",
            stack_size = 50
        },
        --Wool recipe
        {
            type = "recipe",
            name = "sheep_wool",
            enabled = true,
            hidden = false,
            energy_required = 4,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "wool"
        },
        --Sheep farm
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "sheep_wool",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "sheep_farm",
            icon = "__Annotorio__/graphics/icons/sheep_farm_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "sheep_farm"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-2.2, -1.7}, {2.2, 1.7}},
            selection_box = {{-2.5, -2}, {2.5, 2}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/sheep_farm.png",
                        priority = "extra-high",
                        width = 320,
                        height = 248,
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
