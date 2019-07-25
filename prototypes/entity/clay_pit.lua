--include add_dummy_replacement_pair("clay_pit_dummy", "clay_pit") in dummy_replacement_pair.lua

data.raw.resource["stone"].minable = {
    mining_particle = "stone-particle",
    mining_time = 1,
    result = "clay"
}
data.raw.resource["stone"].category = "anno_clay"
data.raw.resource["stone"].selection_priority = 49
data.raw.resource["stone"].stages.sheet = {
    filename = "__base__/graphics/entity/stone/stone.png",
    priority = "extra-high",
    size = 64,
    frame_count = 8,
    variation_count = 8,
    --tint = {r = 0.75, g = 0.337, b = 0.25, a = 1},
    tint = {r = 0.75, g = 0.437, b = 0.35, a = 1},
    hr_version = {
        filename = "__base__/graphics/entity/stone/hr-stone.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5,
        tint = {r = 0.75, g = 0.437, b = 0.35, a = 1}
        --tint = {r = 0.75, g = 0.337, b = 0.25, a = 1},
    }
}

data:extend(
    {
        {
            type = "resource-category",
            name = "anno_clay"
        },
        --Clay Pit
        {
            type = "item",
            name = "clay_pit_dummy",
            icon = "__Annotorio__/graphics/icons/clay_pit_icon.png",
            icon_size = 64,
            subgroup = "basic",
            order = "b[building]-f[clay_pit]",
            place_result = "clay_pit_dummy",
            stack_size = 25
        },
        -- Clay Pit dummy
        {
            type = "recipe",
            name = "clay_pit_dummy",
            ingredients = {
                {"wood", 8},
                {"anno_tool", 2}
            },
            result = "clay_pit_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --clay
        {
            type = "item",
            name = "clay",
            icon = "__Annotorio__/graphics/icons/clay_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[clay]",
            stack_size = 50
        },
        --clay
        {
            type = "recipe",
            name = "clay",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "clay"
        },
        --clay pit
        {
            type = "assembling-machine",
            name = "clay_pit",
            placeable_by = {item = "clay_pit_dummy", count = 1},
            ------------------
            fixed_recipe = "clay",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------
            icon = "__Annotorio__/graphics/icons/clay_pit_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "clay_pit_dummy"},
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
                        filename = "__Annotorio__/graphics/entity/clay_pit_big.png",
                        priority = "extra-high",
                        width = 319,
                        height = 223,
                        scale = 0.5
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 8,
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
            type = "mining-drill",
            name = "clay_pit_dummy",
            --placeable_by = {item = "clay_pit_dummy", count = 1},
            icon = "__base__/graphics/icons/electric-mining-drill.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            selection_priority = 51,
            minable = {mining_time = 0.3, result = "unobtainable_dummy"},
            max_health = 300,
            resource_categories = {"anno_clay"},
            corpse = "medium-remnants",
            collision_box = {{-2.2, -1.7}, {2.2, 1.7}},
            selection_box = {{-2.5, -2}, {2.5, 2}},
            working_sound = {
                sound = {
                    filename = "__base__/sound/electric-mining-drill.ogg",
                    volume = 0.75
                },
                apparent_volume = 1.5
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            animations = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/clay_pit_big.png",
                        priority = "extra-high",
                        width = 319,
                        height = 223,
                        scale = 0.5
                    }
                }
            },
            mining_speed = 1,
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 8,
                drain = "5kW"
            },
            energy_usage = "10kW",
            resource_searching_radius = 1.49,
            vector_to_place_result = {0, -1.85},
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
                width = 10,
                height = 10
            },
            monitor_visualization_tint = {r = 78, g = 173, b = 255},
            circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
            circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        }
    }
)
