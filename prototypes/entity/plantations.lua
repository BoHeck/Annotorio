local template = {
    type = "mining-drill",
    name = "plantation_dummy_template_6x4",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.3, result = "unobtainable_dummy"},
    max_health = 300,
    resource_categories = {"cold_climate_fertile_soil"},
    corpse = "medium-remnants",
    collision_box = {{-2.7, -1.7}, {2.7, 1.7}},
    selection_box = {{-3, -2}, {3, 2}},
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
                filename = "__core__/graphics/empty.png",
                priority = "extra-high",
                width = 1,
                height = 1,
                direction_count = 1
            }
        }
    },
    mining_speed = 1,
    energy_source = {
        type = "electric",
        emissions_per_minute = 16,
        usage_priority = "secondary-input",
        darin = "5kW"
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
    fast_replaceable_group = "plantation",
    circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
}

local apple_orchard_dummy = table.deepcopy(template)
apple_orchard_dummy.name = "apple_orchard_dummy"
apple_orchard_dummy.icon = "__Annotorio__/graphics/icons/apple_orchard_icon.png"
apple_orchard_dummy.icon_size = 64
apple_orchard_dummy.animations = {
    layers = {
        {
            filename = "__Annotorio__/graphics/entity/apple_orchard.png",
            priority = "extra-high",
            width = 353,
            height = 254,
            scale = 0.6
        }
    }
}
apple_orchard_dummy.collision_box = {{-2.7, -1.7}, {2.7, 1.7}}
apple_orchard_dummy.selection_box = {{-3, -2}, {3, 2}}

data:extend(
    {
        apple_orchard_dummy
    }
)
--------------------------------------------------
data:extend(
    {
        --  apple_orchard_dummy
        {
            type = "item",
            name = "apple_orchard_dummy",
            icon = "__Annotorio__/graphics/icons/apple_orchard_icon.png",
            icon_size = 64,
            subgroup = "plantation",
            order = "b[building]-r[apple_orchard]",
            place_result = "apple_orchard_dummy",
            stack_size = 25
        },
        --Apple orchard dummy
        {
            type = "recipe",
            name = "apple_orchard_dummy",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "apple_orchard_dummy"
        },
        --Apple
        {
            type = "item",
            name = "apple",
            icon = "__Annotorio__/graphics/icons/apple_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[apple]",
            stack_size = 50
        },
        --grow Aplles
        {
            type = "recipe",
            name = "grow_apples",
            enabled = true,
            hidden = false,
            energy_required = 2.5,
            category = "predetermined",
            ingredients = {},
            result = "apple"
        },
        --apple orchard
        {
            type = "assembling-machine",
            ------------------
            fixed_recipe = "grow_apples",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ---------------------

            name = "apple_orchard",
            placeable_by = {item = "apple_orchard_dummy", count = 1},
            icon = "__Annotorio__/graphics/icons/apple_orchard_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "apple_orchard_dummy"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-2.7, -1.7}, {2.7, 1.7}},
            selection_box = {{-3, -2}, {3, 2}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/apple_orchard.png",
                        priority = "extra-high",
                        width = 353,
                        height = 254,
                        scale = 0.6
                    }
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 16,
                drain = "3.33kW"
            },
            energy_usage = "6.64kW",
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
