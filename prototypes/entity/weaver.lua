data:extend(
    {
        --  weaver
        {
            type = "item",
            name = "weaver",
            icon = "__Annotorio__/graphics/icons/weaver_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[weaver]",
            place_result = "weaver",
            stack_size = 25
        },
        --Weaver
        {
            type = "recipe",
            name = "weaver",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 12},
                {"anno_tool", 3}
            },
            result = "weaver"
        },
        --cloth
        {
            type = "tool",
            name = "cloth",
            icon = "__Annotorio__/graphics/icons/cloth_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "d[cloth]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --weaving
        {
            type = "recipe",
            name = "weaving",
            enabled = true,
            hidden = false,
            energy_required = 2,
            category = "predetermined",
            ingredients = {{"wool", 3}},
            result = "cloth"
        },
        --Weaver
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "weaving",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "weaver",
            icon = "__Annotorio__/graphics/icons/weaver_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "weaver"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.7, -1.2}, {1.7, 1.2}},
            selection_box = {{-2, -1.5}, {2, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/weaver.png",
                        priority = "extra-high",
                        width = 256,
                        height = 176,
                        scale = 0.5
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 8,
                drain = "10kW"
            },
            energy_usage = "20kW",
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
