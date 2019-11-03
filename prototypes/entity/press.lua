data:extend(
    {
        --  press
        {
            type = "item",
            name = "press",
            icon = "__Annotorio__/graphics/icons/press_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[press]",
            place_result = "press",
            stack_size = 25
        },
        --press
        {
            type = "recipe",
            name = "press",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 16},
                {"ceramics", 24},
                {"anno_tool", 4}
            },
            result = "press"
        },
        --press_sugar_cane
        {
            type = "recipe",
            name = "press_sugar_cane",
            enabled = true,
            hidden = false,
            energy_required = 8,
            category = "press",
            ingredients = {
                {"sugar_cane", 12},
                {"wood_barrel", 1}
            },
            result = "barreled_sugar_cane_syrup",
            allow_as_intermediate = true
        },
        --press_cider
        {
            type = "recipe",
            name = "press_cider",
            enabled = true,
            hidden = false,
            energy_required = 4,
            category = "press",
            ingredients = {
                {"apple", 4},
                {"ceramics", 1}
            },
            result = "cider"
        },
        --cider
        {
            type = "tool",
            name = "cider",
            icon = "__Annotorio__/graphics/icons/cider_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "d[cider]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --barreled_sugar_cane_syrup
        {
            type = "item",
            name = "barreled_sugar_cane_syrup",
            icon = "__Annotorio__/graphics/icons/barreled_sugar_cane_syrup.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "a[barreled_sugar_cane_syrup]",
            stack_size = 50
        },
        {
            type = "recipe-category",
            name = "press"
        },
        --press
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"press"},
            ingredient_count = 4,
            crafting_speed = 1,
            ---------------------

            name = "press",
            icon = "__Annotorio__/graphics/icons/press_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "press"},
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
                        filename = "__Annotorio__/graphics/entity/press_workshop.png",
                        priority = "extra-high",
                        width = 310,
                        height = 353,
                        scale = 0.375,
                        shift = util.by_pixel(11, 8)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/press_workshop_s.png",
                        priority = "extra-high",
                        width = 310,
                        height = 353,
                        scale = 0.375,
                        draw_as_shadow = true,
                        shift = util.by_pixel(11, 8)
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
