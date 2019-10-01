data:extend(
    {
        --Woodcutter
        {
            type = "item",
            name = "woodcutter",
            icon = "__Annotorio__/graphics/icons/woodcutter_icon.png",
            icon_size = 64,
            subgroup = "basic",
            order = "b[building]-r[woodcutter]",
            place_result = "woodcutter",
            stack_size = 25
        },
        --Woodcutter
        {
            type = "recipe",
            name = "woodcutter",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 3},
                {"anno_tool", 2}
            },
            result = "woodcutter"
        },
        --Wood
        {
            type = "recipe",
            name = "tree_trunk_to_wood",
            enabled = true,
            hidden = false,
            energy_required = 4,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {
                {
                    type = "item",
                    name = "tree_trunk",
                    amount = 1
                }
            },
            icon = "__Annotorio__/graphics/icons/wood_icon.png",
            icon_size = 64,
            results = {
                {
                    type = "item",
                    name = "wood",
                    amount = 4
                },
                {
                    type = "item",
                    name = "seedling",
                    amount = 1
                },
                {
                    type = "item",
                    name = "seedling",
                    amount = 1,
                    probability = 0.25
                }
            }
        },
        -- seedling
        {
            type = "item",
            name = "seedling",
            icon = "__Annotorio__/graphics/icons/seedling_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[seedling]",
            stack_size = 50
        },
        --Tree Trunk
        {
            type = "item",
            name = "tree_trunk",
            icon = "__base__/graphics/icons/tree-03.png",
            icon_size = 32,
            subgroup = "anno_raw",
            order = "f[tree_trunk]",
            stack_size = 50
        },
        --Woodcutter
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "tree_trunk_to_wood",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "woodcutter",
            icon = "__Annotorio__/graphics/icons/woodcutter_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "woodcutter"},
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
                        filename = "__Annotorio__/graphics/entity/woodcutter.png",
                        priority = "extra-high",
                        width = 186,
                        height = 141,
                        scale = 0.45
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 6,
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
