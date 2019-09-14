local shipyard = {
    type = "assembling-machine",
    ------------------

    crafting_categories = {"shipyard"},
    ingredient_count = 6,
    crafting_speed = 1,
    ---------------------

    name = "shipyard",
    icon = "__Annotorio__/graphics/icons/shipyard_icon.png",
    icon_size = 64,
    flags = {},
    minable = {mining_time = 0.2, result = "shipyard_dummy"},
    max_health = 5000,
    dying_explosion = "big-explosion",
    corpse = "big-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_mask = {"player-layer", "object-layer"},
    collision_box = {{-5.9, -7.9}, {5.9, 7.9}},
    selection_box = {{-6, -8}, {6, 8}},
    alert_icon_shift = util.by_pixel(-3, -12),
    animation = {
        north = {
            layers = {
                {
                    filename = "__Annotorio__/graphics/entity/shipyard_north.png",
                    priority = "extra-high",
                    width = 1344,
                    height = 1800,
                    scale = 0.5,
                    shift = util.by_pixel(-16, 64)
                }
            }
        },
        south = {
            layers = {
                {
                    filename = "__Annotorio__/graphics/entity/shipyard_south.png",
                    priority = "extra-high",
                    width = 1344,
                    height = 1800,
                    scale = 0.5,
                    shift = util.by_pixel(16, -16)
                }
            }
        },
        east = {
            layers = {
                {
                    filename = "__Annotorio__/graphics/entity/shipyard_east.png",
                    priority = "extra-high",
                    width = 1344,
                    height = 1800,
                    scale = 0.5,
                    shift = util.by_pixel(44, -4)
                }
            }
        },
        west = {
            layers = {
                {
                    filename = "__Annotorio__/graphics/entity/shipyard_west.png",
                    priority = "extra-high",
                    width = 1344,
                    height = 1800,
                    scale = 0.5,
                    shift = util.by_pixel(-44, 4)
                }
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = nil,
            pipe_covers = nil,
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0, 8.4}}}
        },
        off_when_no_fluid_recipe = false
        --Dont set this true or you wont be able to rotate the entity
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 6,
        drain = "0kW"
    },
    energy_usage = "150kW",
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

data:extend(
    {
        shipyard,
        --  shipyard_dummy item
        {
            type = "item",
            name = "shipyard_dummy",
            icon = "__Annotorio__/graphics/icons/shipyard_icon.png",
            icon_size = 64,
            subgroup = "ships_misc",
            order = "b[building]-r[shipyard]",
            place_result = "shipyard_dummy",
            stack_size = 25
        },
        --shipyard recipe
        {
            type = "recipe",
            name = "shipyard",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 150},
                {"ceramics", 30},
                {"anno_tool", 24}
            },
            result = "shipyard_dummy"
        },
        {
            type = "recipe-category",
            name = "shipyard"
        },
        {
            type = "offshore-pump",
            name = "shipyard_dummy",
            icon = "__Annotorio__/graphics/icons/shipyard_icon.png",
            icon_size = 64,
            flags = {"filter-directions"},
            collision_mask = {"ground-tile", "object-layer"},
            fluid_box_tile_collision_test = {"ground-tile"},
            adjacent_tile_collision_test = {"water-tile"},
            minable = {mining_time = 0.1, result = "shipyard_dummy"},
            max_health = 150,
            corpse = "small-remnants",
            fluid = "water",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                },
                {
                    type = "impact",
                    percent = 30
                }
            },
            collision_box = {{-5.9, -5.9}, {5.9, 5.9}},
            selection_box = {{-6, -6}, {6, 6}},
            fluid_box = {
                base_area = 1,
                base_level = 1,
                pipe_covers = nil,
                production_type = "output",
                filter = "water",
                pipe_connections = {
                    {position = {2, 6.5}},
                    {position = {1, 6.5}},
                    {position = {0, 6.5}},
                    {position = {-1, 6.5}},
                    {position = {-2, 6.5}}
                }
            },
            pumping_speed = 20,
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            picture = {
                filename = "__Annotorio__/graphics/icons/shipyard_icon.png",
                priority = "high",
                -- shift = {0.90625, 0.0625},
                width = 64,
                height = 64
            },
            placeable_position_visualization = {
                filename = "__core__/graphics/cursor-boxes-32x32.png",
                priority = "extra-high-no-scale",
                width = 64,
                height = 64,
                scale = 0.5,
                x = 3 * 64
            },
            circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points,
            circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        }
    }
)
