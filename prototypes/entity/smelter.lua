data:extend(
    {
        --  smelter
        {
            type = "item",
            name = "smelter",
            icon = "__Annotorio__/graphics/icons/smelter_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[smelter]",
            place_result = "smelter",
            stack_size = 25
        },
        --Smelter
        {
            type = "recipe",
            name = "smelter",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"ceramics", 9}
            },
            result = "smelter"
        },
        {
            type = "recipe-category",
            name = "smelter"
        },
        -- anno_steel
        {
            type = "recipe",
            name = "anno_steel",
            enabled = true,
            hidden = false,
            energy_required = 5,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"coal", 10},
                {"iron-plate", 2}
            },
            result = "steel-plate",
            allow_as_intermediate = true
        },
        -- iron-plate 1
        {
            type = "recipe",
            name = "anno_iron_1",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"wood", 1},
                {"iron-ore", 2}
            },
            result = "iron-plate",
            allow_as_intermediate = true
        },
        -- iron-plate 2
        {
            type = "recipe",
            name = "anno_iron_2",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"coal", 1},
                {"iron-ore", 2}
            },
            result = "iron-plate",
            allow_as_intermediate = true
        },
        -- copper-plate 1
        {
            type = "recipe",
            name = "anno_copper_1",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"wood", 1},
                {"copper-ore", 2}
            },
            result = "copper-plate",
            allow_as_intermediate = true
        },
        -- copper-plate 2
        {
            type = "recipe",
            name = "anno_copper_2",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"coal", 1},
                {"copper-ore", 2}
            },
            result = "copper-plate",
            allow_as_intermediate = true
        },
        {
            type = "assembling-machine",
            ------------------
            crafting_categories = {"smelter"},
            ingredient_count = 4,
            crafting_speed = 1,
            ------------------

            name = "smelter",
            icon = "__Annotorio__/graphics/icons/smelter_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "smelter"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 100
                }
            },
            collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
            selection_box = {{-2, -2}, {2, 2}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/smelter_working.png",
                        priority = "extra-high",
                        width = 468,
                        height = 367,
                        scale = 0.5,
                        shift = util.by_pixel(56, 34)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/smelter_shadow.png",
                        priority = "extra-high",
                        width = 468,
                        height = 367,
                        scale = 0.5,
                        shift = util.by_pixel(56, 34),
                        draw_as_shadow = true
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
