data:extend(
    {
        --Woodcutter
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "young_tree",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "tree_planter",
            icon = "__Annotorio__/graphics/icons/tree_planter_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "tree_planter"},
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
                        filename = "__Annotorio__/graphics/entity/tree_planter.png",
                        priority = "extra-high",
                        width = 224,
                        height = 240,
                        scale = 0.4,
                        shift = util.by_pixel(12, 4)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/tree_planterS.png",
                        priority = "extra-high",
                        width = 224,
                        height = 240,
                        scale = 0.4,
                        draw_as_shadow = true,
                        shift = util.by_pixel(12, 4)
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 0,
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
        },
        {
            type = "simple-entity",
            name = "young_tree",
            enable_inventory_bar = false,
            icon = data.raw["tree"]["tree-01"].icon,
            icon_size = 32,
            flags = {},
            subgroup = "wrecks",
            order = "d[remnants]-f",
            map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
            max_health = 50,
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            picture = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/_tree_08_70000.png",
                        priority = "extra-high",
                        width = 140,
                        height = 219,
                        scale = 0.5
                        --shift = util.by_pixel(12, 4)
                    }
                }
            }
        }
    }
)
