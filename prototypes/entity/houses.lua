data:extend(
    {
        --house1
        {
            type = "assembling-machine",
            name = "house_pioneer",
            ------------------
            fixed_recipe = "pioneer_needs",
            crafting_categories = {"people_needs"},
            ingredient_count = 5,
            crafting_speed = 1,
            ---------------------
            energy_source = {
                type = "void"
            },
            energy_usage = "0.000001kW",
            -----------

            icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "house_pioneer"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/house_pioneer.png",
                        priority = "extra-high",
                        width = 1099,
                        height = 819,
                        scale = 0.1
                    }
                }
            },
            open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
            close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
        },
        --house2
        {
            type = "assembling-machine",
            name = "house_settler",
            placeable_by = {item = "house_pioneer", count = 1},
            ------------------
            fixed_recipe = "pioneer_needs",
            crafting_categories = {"people_needs"},
            ingredient_count = 5,
            crafting_speed = 1,
            ---------------------
            energy_source = {
                type = "void"
            },
            energy_usage = "0.000001kW",
            -----------

            icon = "__Annotorio__/graphics/icons/house_settler_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "house_settler"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/house_settler.png",
                        priority = "extra-high",
                        width = 1158,
                        height = 983,
                        scale = 0.118
                    }
                }
            },
            open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
            close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
        },
        --house3
        {
            type = "assembling-machine",
            name = "house_citizen",
            placeable_by = {item = "house_pioneer", count = 1},
            ------------------
            --fixed_recipe = "pioneer_needs",
            crafting_categories = {"people_needs"},
            ingredient_count = 5,
            crafting_speed = 1,
            ---------------------
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 0,
                drain = "0kW"
            },
            energy_usage = "0.00001kW",
            -----------

            icon = "__Annotorio__/graphics/icons/house_citizen_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "house_citizen"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/house_citizen.png",
                        priority = "extra-high",
                        width = 622,
                        height = 570,
                        scale = 0.18
                    }
                }
            },
            open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
            close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
        }
    }
)
