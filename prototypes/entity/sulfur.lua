local sulfur = table.deepcopy(data.raw.resource["copper-ore"])
sulfur.name = "sulfur"

sulfur.category = "anno_sulfur"
sulfur.selection_priority = 49
sulfur.autoplace = nil
sulfur.icon_size = 64
sulfur.icon = "__Annotorio__/graphics/icons/sulfur_icon.png"
sulfur.minable = {
    mining_time = 99999,
    result = "sulfur"
}

sulfur.stages.sheet = {
    filename = "__Annotorio__/graphics/entity/sulfur.png",
    priority = "extra-high",
    size = 64,
    frame_count = 8,
    variation_count = 8,
    --tint = {r = 0.737, g = 0.859, b = 0.216, a = 1},
    hr_version = {
        filename = "__Annotorio__/graphics/entity/hr_sulfur.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
        -- tint = {r = 0.737, g = 0.859, b = 0.216, a = 1}
    }
}

sulfur.map_color = {r = 0.937, g = 0.859, b = 0.216, a = 1}

data:extend(
    {
        sulfur, -- sulfur item
        {
            type = "item",
            name = "sulfur",
            icon = "__Annotorio__/graphics/icons/sulfur_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            order = "f[sulfur]",
            stack_size = 250
        }
    }
)
