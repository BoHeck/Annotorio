collision_maskForWaterTiles = {
    "water-tile",
    "item-layer",
    --"player-layer",
    "doodad-layer",
    "layer-15"
}

collision_mask_for_land_resources = {
    "resource-layer",
    "layer-15"
}

--Change collision of water tiles
for i, v in pairs(data.raw.tile) do
    if (v.draw_in_water_layer) then --This should be the clear sign of a water tile
        v.collision_mask = collision_maskForWaterTiles
    else
        table.insert(v.collision_mask, "layer-14")
    end
end

--Change collision of Resources
for i, v in pairs(data.raw.resource) do
    v.collision_mask = collision_mask_for_land_resources
end

--long list of pictures needed for the fishing route aka fish pipe
fishing_route_pictures = function()
    return {
        straight_vertical_single = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_vertical = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_vertical_window = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_horizontal_window = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        straight_horizontal = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_up_right = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_up_left = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_down_right = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        corner_down_left = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_up = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_down = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_right = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        t_left = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        cross = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_up = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_down = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_right = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        ending_left = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        horizontal_window_background = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        vertical_window_background = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        fluid_background = {
            filename = "__Annotorio__/graphics/entity/fishing_route.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        low_temperature_flow = {
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
        middle_temperature_flow = {
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
        high_temperature_flow = {
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
        gas_flow = {
            layers = {
                {
                    filename = "__core__/graphics/empty.png",
                    priority = "extra-high",
                    width = 1,
                    height = 1,
                    direction_count = 1
                }
            }
        }
    }
end

fish_fluid_animation_overlay = {
    name = "fish_fluid_animation_overlay",
    type = "simple-entity",
    flags = {},
    icon = "__Annotorio__/graphics/icons/fishing_route_icon.png",
    icon_size = 64,
    subgroup = "grass",
    order = "b[decorative]-z[fish_fluid]",
    collision_mask = {},
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selectable_in_game = false,
    render_layer = "object",
    destructible = false,
    random_animation_offset = true,
    animations = {
        {
            filename = "__Annotorio__/graphics/entity/fish_resource_sheet2.png",
            priority = "extra-high",
            width = 160,
            height = 112,
            frame_count = 64,
            variation_count = 1,
            line_length = 8,
            shift = util.by_pixel(10, 0),
            animation_speed = 0.65
        }
    }
}

data:extend(
    {
        --Fishing Boat (is a building)
        {
            type = "item",
            name = "fishing_boat",
            icon = "__Annotorio__/graphics/icons/fishing_boat_icon.png",
            icon_size = 64,
            subgroup = "fishing",
            order = "b[building]-f[fishing_boat]",
            place_result = "fishing_boat",
            stack_size = 25
        },
        --Fishing Route aka fish pipe
        {
            type = "item",
            name = "fishing_route",
            icon = "__Annotorio__/graphics/icons/fishing_route_icon.png",
            icon_size = 64,
            subgroup = "fishing",
            order = "b[building]-f[fishing_route]",
            place_result = "fishing_route",
            stack_size = 50
        },
        --fishers hut
        {
            type = "item",
            name = "fishers_hut",
            icon = "__Annotorio__/graphics/icons/fishers_hut_icon.png",
            icon_size = 64,
            subgroup = "fishing",
            order = "b[building]-f[fishers_hut]",
            place_result = "fishers_hut",
            stack_size = 25
        },
        -- fishing boat
        {
            type = "recipe",
            name = "fishing_boat",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2},
                {"cloth", 4}
            },
            result = "fishing_boat",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- fishing route aka fish pipe
        {
            type = "recipe",
            name = "fishing_route",
            ingredients = {},
            result = "fishing_route",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- fishers hut
        {
            type = "recipe",
            name = "fishers_hut",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "fishers_hut",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --anno Fish
        {
            type = "tool",
            name = "anno_fish",
            icon = "__Annotorio__/graphics/icons/anno_fish_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "d[fish]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --Fish
        {
            type = "recipe",
            name = "fishing",
            enabled = true,
            hidden = false,
            energy_required = 4,
            category = "predetermined",
            ingredients = {
                {
                    type = "fluid",
                    name = "fish_fluid",
                    amount = 80
                }
            },
            result = "anno_fish"
        },
        fish_fluid_animation_overlay,
        -- category fish_fluid
        {
            type = "resource-category",
            name = "fish_fluid"
        },
        -- fluid fish_fluid
        {
            type = "fluid",
            name = "fish_fluid",
            default_temperature = 25,
            heat_capacity = "0.1KJ",
            base_color = {r = 0, g = 0, b = 0},
            flow_color = {r = 0, g = 0, b = 1},
            max_temperature = 100,
            icon = "__Annotorio__/graphics/icons/fish_fluid_icon.png",
            icon_size = 32,
            order = "a[fluid]-f[fish_fluid]"
        },
        -- resource fish_fluid
        {
            type = "resource",
            name = "fish_fluid",
            icon = "__Annotorio__/graphics/icons/fishing_route_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral"},
            category = "fish_fluid",
            collision_mask = {"resource-layer", "layer-14"},
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
                        name = "fish_fluid",
                        amount_min = 60,
                        amount_max = 60,
                        probability = 1
                    }
                }
            },
            collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            autoplace = nil,
            stage_counts = {1},
            stages = {
                sheet = {
                    filename = "__Annotorio__/graphics/entity/empty.png",
                    priority = "high",
                    width = 1,
                    height = 1,
                    frame_count = 1,
                    line_length = 1,
                    variation_count = 1
                }
                --[[

                animation =
                {
                  filename = "__Annotorio__/graphics/entity/fish_resource_sheet2.png",
                  priority = "high",
                  width = 160,
                  height = 112,
                  frame_count = 64,
                  line_length = 8,
                },
                --]]
            },
            map_color = {r = 0, g = 0, b = 1},
            map_grid = false
        },
        --fishing route aka the sea pipeline
        {
            type = "pipe",
            name = "fishing_route",
            icon = "__Annotorio__/graphics/icons/fishing_route_icon.png",
            icon_size = 32,
            flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
            minable = {mining_time = 0.1},
            max_health = 100,
            corpse = "pipe-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 80
                },
                {
                    type = "impact",
                    percent = 30
                }
            },
            fast_replaceable_group = "pipe",
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            collision_mask = {"resource-layer", "ground-tile", "object-layer", "train-layer"},
            fluid_box = {
                base_area = 1,
                pipe_connections = {
                    {position = {0, -1}},
                    {position = {1, 0}},
                    {position = {0, 1}},
                    {position = {-1, 0}}
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            pictures = fishing_route_pictures(),
            working_sound = {
                sound = {
                    {
                        filename = "__base__/sound/pipe.ogg",
                        volume = 0.85
                    }
                },
                match_volume_to_activity = true,
                max_sounds_per_type = 3
            },
            horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
            vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
        },
        --fishing boat
        {
            type = "mining-drill",
            name = "fishing_boat",
            icon = "__Annotorio__/graphics/icons/fishing_boat_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.5, result = "fishing_boat"},
            resource_categories = {"fish_fluid"},
            max_health = 200,
            dying_explosion = "medium-explosion",
            collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            collision_mask = {"object-layer", "train-layer"},
            energy_source = {
                type = "void",
                emissions_per_minute = 12,
                usage_priority = "secondary-input"
            },
            output_fluid_box = {
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
                        positions = {{1, -2}, {2, -1}, {-1, 2}, {-2, 1}}
                    }
                }
            },
            energy_usage = "0.00001kW",
            mining_speed = 1,
            resource_searching_radius = 0.49,
            vector_to_place_result = {0, 0},
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
                width = 12,
                height = 12
            },
            monitor_visualization_tint = {r = 78, g = 173, b = 255},
            base_render_layer = "lower-object-above-shadow",
            base_picture = {
                filename = "__Annotorio__/graphics/entity/fishing_boat.png",
                priority = "high",
                width = 192,
                height = 277,
                shift = util.by_pixel(0, -20),
                scale = 0.5
            },
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
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.65},
            circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
            circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        },
        --fishers hut
        {
            type = "assembling-machine",
            name = "fishers_hut",
            -----------

            fixed_recipe = "fishing",
            crafting_categories = {"predetermined"},
            ingredient_count = 1,
            crafting_speed = 1,
            ------------------
            icon = "__Annotorio__/graphics/icons/fishers_hut_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "fishers_hut"},
            max_health = 300,
            dying_explosion = "medium-explosion",
            corpse = "medium-remnants",
            resistances = {
                {
                    type = "fire",
                    percent = 70
                }
            },
            fluid_boxes = {
                {
                    production_type = "input",
                    pipe_picture = assembler1pipepictures(),
                    pipe_covers = pipecoverspictures(),
                    base_area = 10,
                    base_level = -1,
                    pipe_connections = {{type = "input", position = {0, -2}}},
                    secondary_draw_orders = {north = -1}
                },
                {
                    production_type = "output",
                    pipe_picture = assembler1pipepictures(),
                    pipe_covers = pipecoverspictures(),
                    base_area = 10,
                    base_level = 1,
                    pipe_connections = {{type = "output", position = {0, 2}}},
                    secondary_draw_orders = {north = -1}
                },
                off_when_no_fluid_recipe = true
            },
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            fast_replaceable_group = "assembling-machine",
            next_upgrade = "assembling-machine-2",
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                filename = "__Annotorio__/graphics/entity/fishers_hut.png",
                width = 122,
                height = 75,
                priority = "high"
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 16,
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
