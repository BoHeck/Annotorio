--Note nothing is actually mining these soils. They are only meant to limit the places where certain plantations can be build
local noise = require("noise")

local dont_place =
    noise.define_noise_function(
    function(x, y, tile, map)
        return 0
    end
)

data:extend(
    {
        --------- categories -------------
        {
            type = "resource-category",
            name = "apple_soil"
        },
        {
            type = "resource-category",
            name = "sugar_cane_soil"
        },
        --[[
        {
            type = "autoplace-control",
            name = "apple_soil",
            richness = true,
            order = "b-g",
            category = "resource"
        },
        {
            type = "autoplace-control",
            name = "sugar_cane_soil",
            richness = true,
            order = "b-h",
            category = "resource"
        },]]
        ----------------------------------
        --apple_soil
        {
            type = "item",
            name = "apple_soil",
            icon = "__Annotorio__/graphics/icons/apple_soil_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 50
        },
        --sugar_cane_soil
        {
            type = "item",
            name = "sugar_cane_soil",
            icon = "__Annotorio__/graphics/icons/sugar_cane_soil_icon.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 64
        },
        {
            type = "resource",
            name = "apple_soil",
            icon = "__Annotorio__/graphics/icons/apple_soil_icon.png",
            icon_size = 64,
            category = "apple_soil",
            flags = {"placeable-neutral"},
            selection_priority = 49,
            order = "a-b-e",
            tree_removal_probability = 0.7,
            tree_removal_max_distance = 32 * 32,
            minable = {
                mining_time = 99999,
                result = "apple_soil"
            },
            collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            --[[
            autoplace = resource_autoplace.resource_autoplace_settings {
                name = "apple_soil",
                order = "g",
                base_density = 0.9,
                base_spots_per_km2 = 1.25,
                has_starting_area_placement = true,
                random_spot_size_minimum = 2,
                random_spot_size_maximum = 4,
                patch_set_name = "apple_soil",
                regular_rq_factor_multiplier = 1
            },
            ]]
            autoplace = {
                probability_expression = dont_place
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
            map_color = {r = 0.6, g = 0.7, b = 0.6}
        },
        {
            type = "resource",
            name = "sugar_cane_soil",
            icon = "__Annotorio__/graphics/icons/sugar_cane_soil_icon.png",
            icon_size = 64,
            category = "sugar_cane_soil",
            flags = {"placeable-neutral"},
            selection_priority = 49,
            order = "a-b-e",
            tree_removal_probability = 0.7,
            tree_removal_max_distance = 32 * 32,
            minable = {
                mining_time = 99999,
                result = "sugar_cane_soil"
            },
            collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            autoplace = {
                probability_expression = dont_place
            },
            --[[
            autoplace = resource_autoplace.resource_autoplace_settings {
                name = "sugar_cane_soil",
                order = "h",
                base_density = 0.9,
                base_spots_per_km2 = 1.25,
                has_starting_area_placement = false,
                random_spot_size_minimum = 2,
                random_spot_size_maximum = 4,
                patch_set_name = "sugar_cane_soil",
                regular_rq_factor_multiplier = 1
            },
            ]]
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
            map_color = {r = 0, g = 0.7, b = 0}
        }
    }
)
