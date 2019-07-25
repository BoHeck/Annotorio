data:extend(
    {
        --  kiln
        {
            type = "item",
            name = "kiln",
            icon = "__Annotorio__/graphics/icons/kiln_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[kiln]",
            place_result = "kiln",
            stack_size = 25
        },
        --kiln
        {
            type = "recipe",
            name = "kiln",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"clay", 9}
            },
            result = "kiln"
        },
        --ceramics
        {
            type = "item",
            name = "ceramics",
            icon = "__Annotorio__/graphics/icons/ceramics_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "a[bricks]",
            stack_size = 50
        },
        {
            type = "recipe-category",
            name = "kiln"
        },
        -- ceramics 1
        {
            type = "recipe",
            name = "ceramics_1",
            enabled = true,
            energy_required = 24,
            category = "kiln",
            ingredients = {
                {"clay", 12},
                {"wood", 2}
            },
            results = {
                {"ceramics", 6}
            }
        },
        -- ceramics 2
        {
            type = "recipe",
            name = "ceramics_2",
            enabled = true,
            energy_required = 24,
            category = "kiln",
            ingredients = {
                {"clay", 12},
                {"coal", 2}
            },
            results = {
                {"ceramics", 6}
            }
        },
        --kiln
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"kiln"},
            ingredient_count = 4,
            crafting_speed = 1,
            ---------------------

            name = "kiln",
            icon = "__Annotorio__/graphics/icons/kiln_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "kiln"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
            selection_box = {{-1, -1.5}, {1, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/kiln.png",
                        priority = "extra-high",
                        width = 176,
                        height = 180,
                        scale = 0.5,
                        shift = util.by_pixel(16, 8)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/kiln_shadow.png",
                        priority = "extra-high",
                        width = 176,
                        height = 180,
                        scale = 0.5,
                        draw_as_shadow = true,
                        shift = util.by_pixel(16, 8)
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 6,
                drain = "1.6666666kW"
            },
            energy_usage = "3.3333333kW",
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
