data:extend(
    {
        --  distillery
        {
            type = "item",
            name = "distillery",
            icon = "__Annotorio__/graphics/icons/distillery_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[distillery]",
            place_result = "distillery",
            stack_size = 25
        },
        --Distillery
        {
            type = "recipe",
            name = "distillery",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 12},
                {"anno_tool", 3}
            },
            result = "distillery"
        },
        --distil_rum
        {
            type = "recipe",
            name = "distil_rum",
            icon = "__Annotorio__/graphics/icons/rum_barrel_icon.png",
            icon_size = 64,
            enabled = true,
            hidden = false,
            energy_required = 6,
            subgroup = "advanced_item",
            category = "distillery",
            ingredients = {
                {"barreled_sugar_cane_syrup", 2}
            },
            results = {{"barreled_rum", 1}, {"wood_barrel", 1}}
        },
        --barreled_rum
        {
            type = "tool",
            name = "barreled_rum",
            icon = "__Annotorio__/graphics/icons/rum_barrel_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "e[barreled_rum]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },


        {
            type = "recipe-category",
            name = "distillery"
        },
        --Distillery
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"distillery"},
            ingredient_count = 4,
            crafting_speed = 1,
            ---------------------

            name = "distillery",
            icon = "__Annotorio__/graphics/icons/distillery_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "distillery"},
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
                        filename = "__Annotorio__/graphics/entity/distillery.png",
                        priority = "extra-high",
                        width = 422,
                        height = 288,
                        scale = 0.35,
                        shift = util.by_pixel(18, 8)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/distillery_shadow.png",
                        priority = "extra-high",
                        width = 422,
                        height = 288,
                        scale = 0.35,
                        shift = util.by_pixel(18, 8),
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
