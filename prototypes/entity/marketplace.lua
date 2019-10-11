data:extend(
    {
        --Marketplace
        {
            type = "item",
            name = "marketplace_dummy",
            icon = "__Annotorio__/graphics/icons/marketplace_icon.png",
            icon_size = 64,
            subgroup = "administration",
            order = "b",
            place_result = "marketplace_dummy",
            stack_size = 25
        },
        --Marketplace
        {
            type = "recipe",
            name = "marketplace_dummy",
            ingredients = {
                {"wood", 5},
                {"anno_tool", 3}
            },
            result = "marketplace_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --Marketplace
        {
            type = "electric-pole",
            name = "marketplace_dummy",
            icon = "__Annotorio__/graphics/icons/marketplace_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "marketplace_dummy"},
            max_health = 600,
            corpse = "medium-small-remnants",
            resistances = {},
            collision_box = {{-3.65, -2.65}, {3.65, 2.65}},
            selection_box = {{-4, -3}, {4, 3}},
            drawing_box = {{-4, -3}, {4, 3}},
            maximum_wire_distance = 1,
            supply_area_distance = 36,
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/marketplace.png",
                        priority = "extra-high",
                        width = 269,
                        height = 160,
                        direction_count = 1
                        --shift = util.by_pixel(0, 0),
                        --scale = 0.33333
                    }
                }
            },
            draw_copper_wires = false,
            connection_points = {
                {
                    shadow = {
                        copper = util.by_pixel_hr(245.0, -34.0),
                        red = util.by_pixel_hr(301.0, -0.0),
                        green = util.by_pixel_hr(206.0, -0.0)
                    },
                    wire = {
                        copper = util.by_pixel_hr(0, -246.0),
                        red = util.by_pixel_hr(58.0, -211.0),
                        green = util.by_pixel_hr(-58.0, -211.0)
                    }
                }
            },
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
                width = 12,
                height = 12,
                priority = "extra-high-no-scale"
            }
        },
        --Marketplace
        {
            type = "electric-pole",
            name = "marketplace",
            placeable_by = {item = "marketplace_dummy", count = 1},
            icon = "__Annotorio__/graphics/icons/marketplace_icon.png",
            icon_size = 64,
            flags = {},
            max_health = 600,
            corpse = "medium-small-remnants",
            resistances = {},
            collision_box = {{0, 0}, {0, 0}},
            selection_box = {{0, -3}, {4, 3}},
            drawing_box = {{-4, -3}, {4, 3}},
            maximum_wire_distance = 64,
            supply_area_distance = 36,
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/marketplace.png",
                        priority = "extra-high",
                        width = 269,
                        height = 160,
                        direction_count = 1
                        --shift = util.by_pixel(0, 0),
                        --scale = 0.33333
                    }
                }
            },
            draw_copper_wires = false,
            connection_points = {
                {
                    shadow = {
                        copper = util.by_pixel_hr(245.0, -34.0),
                        red = util.by_pixel_hr(301.0, -0.0),
                        green = util.by_pixel_hr(206.0, -0.0)
                    },
                    wire = {
                        copper = util.by_pixel_hr(0, -246.0),
                        red = util.by_pixel_hr(58.0, -211.0),
                        green = util.by_pixel_hr(-58.0, -211.0)
                    }
                }
            },
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
                width = 12,
                height = 12,
                priority = "extra-high-no-scale"
            }
        },
        {
            type = "container",
            name = "marketplace_chest",
            placeable_by = {item = "marketplace_dummy", count = 1},
            icon = "__Annotorio__/graphics/icons/marketplace_icon.png",
            icon_size = 64,
            minable = {mining_time = 0.2, result = "marketplace_dummy"},
            max_health = 800,
            corpse = "medium-remnants",
            open_sound = {filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.65},
            close_sound = {filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7},
            resistances = {
                {
                    type = "fire",
                    percent = 90
                },
                {
                    type = "impact",
                    percent = 90
                }
            },
            collision_box = {{-3.65, -2.65}, {3.65, 2.65}},
            selection_box = {{-4, -3}, {0, 3}},
            inventory_size = 60,
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            picture = {
                layers = {}
            },
            circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
            circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        }
    }
)
