function water_pump_stripes()
    local result = {}

    for index = 1, 20, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/water_pump/water_pump_" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end
    return result
end

local water_pump_anim = {
    frame_count = 20,
    stripes = water_pump_stripes(),
    priority = "high",
    width = 230,
    height = 199,
    shift = util.by_pixel(14, -4),
    scale = 0.5,
    direction_count = 1,
    animation_speed = 1 / 4
}

data:extend(
    {
        --  oil_pump item
        {
            --TODO order
            type = "item",
            name = "oil_pump",
            icon = "__base__/graphics/icons/pumpjack.png",
            icon_size = 32,
            subgroup = "plantation",
            order = "b[building]-x[oil_pump]",
            place_result = "oil_pump",
            stack_size = 25
        },
        -- oil_pump recipe
        {
            type = "recipe",
            name = "oil_pump",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 36},
                {"ceramics", 18},
                {"anno_tool", 12}
            },
            result = "oil_pump"
        },
        -- oil_pump
        {
            type = "mining-drill",
            name = "oil_pump",
            icon = "__base__/graphics/icons/pumpjack.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.5, result = "oil_pump"},
            resource_categories = {"anno_oil"},
            max_health = 600,
            dying_explosion = "medium-explosion",
            collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            selection_priority = 51,
            -- collision_mask = ???

            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 6,
                drain = "5kW"
            },
            energy_usage = "25kW",
            output_fluid_box = {
                production_type = "input-output",
                base_area = 1,
                base_level = 1,
                pipe_covers = {
                    --pipecoverspictures(),
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
                pipe_connections = {
                    {
                        positions = {{0, -2}, {2, 0}, {0, 2}, {-2, 0}}
                    }
                }
            },
            mining_speed = 1,
            resource_searching_radius = 0.49,
            vector_to_place_result = {0, 0},
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
                width = 12,
                height = 12
            },
            monitor_visualization_tint = {r = 78, g = 173, b = 255},
            base_picture = nil,
            animations = water_pump_anim,
            --[[
            animations = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/oil_pump/oil_pump_1.png",
                        priority = "high",
                        width = 230,
                        height = 199,
                        shift = util.by_pixel(14, -4),
                        scale = 0.5,
                        direction_count = 1
                    }
                }
            },]]
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.65},
            circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
            circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        },
        -- category fresh_water
        {
            type = "resource-category",
            name = "anno_oil"
        },
        -- fresh_water resource
        {
            type = "resource",
            name = "anno_oil",
            icon = "__base__/graphics/icons/crude-oil.png",
            icon_size = 32,
            selection_priority = 49,
            flags = {"placeable-neutral"},
            category = "anno_oil",
            order = "a-b-a",
            infinite = true,
            highlight = true,
            minimum = 60,
            normal = 60,
            infinite_depletion_amount = 0,
            resource_patch_search_radius = 12,
            tree_removal_probability = 0.7,
            tree_removal_max_distance = 32 * 32,
            minable = {
                mining_time = 1,
                results = {
                    {
                        type = "fluid",
                        name = "crude-oil",
                        amount_min = 60,
                        amount_max = 60,
                        probability = 1
                    }
                }
            },
            collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            autoplace = nil,
            stage_counts = {0},
            stages = {
                sheet = {
                    filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
                    priority = "extra-high",
                    width = 75,
                    height = 61,
                    frame_count = 4,
                    variation_count = 1
                }
            },
            map_color = {0.78, 0.2, 0.77},
            map_grid = false
        }
    }
)
