data:extend(
    {
        --  blacksmith
        {
            type = "item",
            name = "blacksmith",
            icon = "__Annotorio__/graphics/icons/blacksmith_icon.png",
            icon_size = 64,
            subgroup = "advanced",
            order = "b[building]-r[blacksmith]",
            place_result = "blacksmith",
            stack_size = 25
        },
        --Blacksmith
        {
            type = "recipe",
            name = "blacksmith",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 6},
                {"ceramics", 9},
                {"anno_tool", 3}
            },
            result = "blacksmith"
        },
        {
            type = "recipe-category",
            name = "blacksmith"
        },
        --wood barrel
        {
            type = "recipe",
            name = "wood_barrel",
            enabled = true,
            hidden = false,
            energy_required = 2,
            subgroup = "blacksmith",
            category = "blacksmith",
            ingredients = {
                {"wood", 2},
                {"iron-plate", 1}
            },
            result = "wood_barrel",
            allow_as_intermediate = true
        },
        --Tool
        {
            type = "item",
            name = "anno_tool",
            icon = "__Annotorio__/graphics/icons/anno_tool_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "a[anno_tool]",
            stack_size = 250
        },
        --copperwares
        {
            type = "tool",
            name = "copperwares",
            icon = "__Annotorio__/graphics/icons/copperwares_icon.png",
            icon_size = 64,
            subgroup = "advanced_item",
            order = "d[copperwares]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --wood_barrel
        {
            type = "item",
            name = "wood_barrel",
            icon = "__Annotorio__/graphics/icons/wood_barrel_icon.png",
            icon_size = 64,
            subgroup = "barreled_item",
            order = "f[wood_barrel]",
            stack_size = 50
        },
        --Tools
        {
            type = "recipe",
            name = "anno_tool",
            ingredients = {
                {"wood", 1},
                {"iron-plate", 1}
            },
            result = "anno_tool",
            energy_required = 2,
            subgroup = "blacksmith",
            category = "blacksmith",
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- blunderbuss
        {
            type = "recipe",
            name = "blunderbuss",
            enabled = true,
            energy_required = 10,
            category = "blacksmith",
            ingredients = {
                {"steel-plate", 2},
                {"wood", 1},
                {"anno_tool", 2}
            },
            result = "blunderbuss",
            allow_as_intermediate = true
        },
        -- musket
        {
            type = "recipe",
            name = "musket",
            enabled = true,
            energy_required = 10,
            category = "blacksmith",
            ingredients = {
                {"steel-plate", 2},
                {"wood", 1},
                {"anno_tool", 2}
            },
            result = "musket",
            allow_as_intermediate = true
        },
        --copperwares
        {
            type = "recipe",
            name = "copperwares",
            enabled = true,
            energy_required = 6,
            subgroup = "blacksmith",
            category = "blacksmith",
            ingredients = {
                {"copper-plate", 2},
                {"anno_tool", 1}
            },
            results = {{"copperwares", 2}}
        },
        --Blacksmith
        {
            type = "assembling-machine",
            ------------------

            crafting_categories = {"blacksmith"},
            ingredient_count = 4,
            crafting_speed = 1,
            ---------------------

            name = "blacksmith",
            icon = "__Annotorio__/graphics/icons/blacksmith_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "blacksmith"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-1.9, -1.2}, {1.9, 1.2}},
            selection_box = {{-2, -1.5}, {2, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/blacksmith.png",
                        priority = "extra-high",
                        width = 355,
                        height = 280,
                        scale = 0.5,
                        shift = util.by_pixel(24, -4)
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
