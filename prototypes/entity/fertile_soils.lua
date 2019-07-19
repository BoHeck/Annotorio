--Note nothing is actually mining these soils. They are only meant to limit the places where certain plantations can be build

--local res_index = resource_autoplace.get_next_resource_index()
--resource_autoplace.resource_indexes["cold_climate_fertile_soil"] = res_index
--res_index = resource_autoplace.get_next_resource_index()
--resource_autoplace.resource_indexes["warm_climate_fertile_soil"] = res_index
data:extend(
    {
        --------- categories -------------
        {
            type = "resource-category",
            name = "cold_climate_fertile_soil"
        },
        {
            type = "resource-category",
            name = "warm_climate_fertile_soil"
        },
        {
            type = "autoplace-control",
            name = "cold_climate_fertile_soil",
            richness = true,
            order = "b-g",
            category = "resource"
        },
        {
            type = "autoplace-control",
            name = "warm_climate_fertile_soil",
            richness = true,
            order = "b-h",
            category = "resource"
        },
        ----------------------------------
        {
            type = "resource",
            name = "cold_climate_fertile_soil",
            icon = "__Annotorio__/graphics/icons/cold_climate_fertile_soil_icon.png",
            icon_size = 64,
            category = "cold_climate_fertile_soil",
            flags = {"placeable-neutral"},
            selection_priority = 49,
            order = "a-b-e",
            tree_removal_probability = 0.7,
            tree_removal_max_distance = 32 * 32,
            minable = {
                mining_time = 99999,
                result = "cold_climate_fertile_soil"
            },
            collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            autoplace = resource_autoplace.resource_autoplace_settings {
                name = "cold_climate_fertile_soil",
                order = "g",
                base_density = 0.9,
                base_spots_per_km2 = 1.25,
                has_starting_area_placement = true,
                random_spot_size_minimum = 2,
                random_spot_size_maximum = 4,
                patch_set_name = "cold_climate_fertile_soil",
                regular_rq_factor_multiplier = 1
            },
            stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
            stages = {
                sheet = {
                    filename = "__base__/graphics/entity/uranium-ore/uranium-ore.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    frame_count = 8,
                    variation_count = 8,
                    hr_version = {
                        filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore.png",
                        priority = "extra-high",
                        width = 128,
                        height = 128,
                        frame_count = 8,
                        variation_count = 8,
                        scale = 0.5
                    }
                }
            },
            stages_effect = {
                sheet = {
                    filename = "__base__/graphics/entity/uranium-ore/uranium-ore-glow.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    frame_count = 8,
                    variation_count = 8,
                    blend_mode = "additive",
                    flags = {"light"},
                    hr_version = {
                        filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore-glow.png",
                        priority = "extra-high",
                        width = 128,
                        height = 128,
                        frame_count = 8,
                        variation_count = 8,
                        scale = 0.5,
                        blend_mode = "additive",
                        flags = {"light"}
                    }
                }
            },
            effect_animation_period = 5,
            effect_animation_period_deviation = 1,
            effect_darkness_multiplier = 3.6,
            min_effect_alpha = 0.2,
            max_effect_alpha = 0.3,
            map_color = {r = 1, g = 0, b = 1}
        },
        {
            type = "resource",
            name = "warm_climate_fertile_soil",
            icon = "__Annotorio__/graphics/icons/warm_climate_fertile_soil_icon.png",
            icon_size = 64,
            category = "warm_climate_fertile_soil",
            flags = {"placeable-neutral"},
            selection_priority = 49,
            order = "a-b-e",
            tree_removal_probability = 0.7,
            tree_removal_max_distance = 32 * 32,
            minable = {
                mining_time = 99999,
                result = "warm_climate_fertile_soil"
            },
            collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            autoplace = resource_autoplace.resource_autoplace_settings {
                name = "warm_climate_fertile_soil",
                order = "h",
                base_density = 0.9,
                base_spots_per_km2 = 1.25,
                has_starting_area_placement = false,
                random_spot_size_minimum = 2,
                random_spot_size_maximum = 4,
                patch_set_name = "warm_climate_fertile_soil",
                regular_rq_factor_multiplier = 1
            },
            stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
            stages = {
                sheet = {
                    filename = "__base__/graphics/entity/uranium-ore/uranium-ore.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    frame_count = 8,
                    variation_count = 8,
                    hr_version = {
                        filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore.png",
                        priority = "extra-high",
                        width = 128,
                        height = 128,
                        frame_count = 8,
                        variation_count = 8,
                        scale = 0.5
                    }
                }
            },
            stages_effect = {
                sheet = {
                    filename = "__base__/graphics/entity/uranium-ore/uranium-ore-glow.png",
                    priority = "extra-high",
                    width = 64,
                    height = 64,
                    frame_count = 8,
                    variation_count = 8,
                    blend_mode = "additive",
                    flags = {"light"},
                    hr_version = {
                        filename = "__base__/graphics/entity/uranium-ore/hr-uranium-ore-glow.png",
                        priority = "extra-high",
                        width = 128,
                        height = 128,
                        frame_count = 8,
                        variation_count = 8,
                        scale = 0.5,
                        blend_mode = "additive",
                        flags = {"light"}
                    }
                }
            },
            effect_animation_period = 5,
            effect_animation_period_deviation = 1,
            effect_darkness_multiplier = 3.6,
            min_effect_alpha = 0.2,
            max_effect_alpha = 0.3,
            map_color = {r = 0, g = 1, b = 0}
        }
    }
)
