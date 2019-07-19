-- When  flag "icon" is set, it will automatically set these flags
local sprite_flags = {
    "no-crop",
    --"no-scale",
    "mipmap",
    "linear-minification",
    "linear-magnification",
    "linear-mip-level",
    "not-compressed"
}

data:extend(
    {
        {
            type = "sprite",
            name = "gold_icon",
            filename = "__Annotorio__/graphics/icons/gold_icon.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            flags = sprite_flags
        },
        {
            type = "sprite",
            name = "wood_icon",
            filename = "__Annotorio__/graphics/icons/wood_icon.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            flags = sprite_flags
        },
        {
            type = "sprite",
            name = "tool_icon",
            filename = "__Annotorio__/graphics/icons/anno_tool_icon.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            flags = sprite_flags
        },
        {
            type = "sprite",
            name = "burned_brick_icon",
            filename = "__Annotorio__/graphics/icons/burned_brick_icon.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            flags = sprite_flags
        }
    }
)
