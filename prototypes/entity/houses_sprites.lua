-------------------------------------------
local animation_overlay_template = {
    name = "template",
    type = "simple-entity",
    flags = {},
    icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
    icon_size = 64,
    subgroup = "grass",
    order = "b[decorative]-x[house]",
    collision_mask = {},
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selectable_in_game = false,
    render_layer = "object",
    destructible = false,
    animations = nil
}
-------------------------------------------
local h1_1 = table.deepcopy(animation_overlay_template)
h1_1.name = "h1_1"
h1_1.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_1.png",
    width = 152,
    height = 113,
    scale = 0.6
}
h1_1.collision_mask = {"layer-11"}
-------------------------------------------
local h1_2 = table.deepcopy(animation_overlay_template)
h1_2.name = "h1_2"
h1_2.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_2.png",
    width = 157,
    height = 129,
    scale = 0.66666
}
h1_2.collision_mask = {"layer-11"}
-------------------------------------------
local h1_3 = table.deepcopy(animation_overlay_template)
h1_3.name = "h1_3"
h1_3.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_3.png",
    width = 178,
    height = 138,
    scale = 0.5
}
h1_3.collision_mask = {"layer-11"}
-------------------------------------------
local h1_4 = table.deepcopy(animation_overlay_template)
h1_4.name = "h1_4"
h1_4.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_4.png",
    width = 277,
    height = 268,
    scale = 0.6
}
h1_4.collision_mask = {"layer-11"}
-------------------------------------------
local h1_5 = table.deepcopy(animation_overlay_template)
h1_5.name = "h1_5"
h1_5.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_5.png",
    width = 277,
    height = 268,
    scale = 0.6
}
h1_5.collision_mask = {"layer-11"}
-------------------------------------------
local h1_6 = table.deepcopy(animation_overlay_template)
h1_6.name = "h1_6"
h1_6.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage1_6.png",
    width = 277,
    height = 268,
    scale = 0.5
}
h1_6.collision_mask = {"layer-11"}
-------------------------------------------
local h2_1 = table.deepcopy(animation_overlay_template)
h2_1.name = "h2_1"
h2_1.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_1.png",
    width = 230,
    height = 206,
    scale = 0.5
}
h2_1.collision_mask = {"layer-12"}
-------------------------------------------
local h2_2 = table.deepcopy(animation_overlay_template)
h2_2.name = "h2_2"
h2_2.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_2.png",
    width = 178,
    height = 141,
    scale = 0.5,
    mipmap_count = 2
}
h2_2.collision_mask = {"layer-12"}
-------------------------------------------
local h2_3 = table.deepcopy(animation_overlay_template)
h2_3.name = "h2_3"
h2_3.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_3.png",
    width = 175,
    height = 140,
    scale = 0.5,
    mipmap_count = 2
}
h2_3.collision_mask = {"layer-12"}
-------------------------------------------
local h2_4 = table.deepcopy(animation_overlay_template)
h2_4.name = "h2_4"
h2_4.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_4.png",
    width = 178,
    height = 137,
    scale = 0.5,
    mipmap_count = 2
}
h2_4.collision_mask = {"layer-12"}
-------------------------------------------
local h2_5 = table.deepcopy(animation_overlay_template)
h2_5.name = "h2_5"
h2_5.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_5.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(-10, -4)
}
h2_5.collision_mask = {"layer-12"}
-------------------------------------------
local h2_6 = table.deepcopy(animation_overlay_template)
h2_6.name = "h2_6"
h2_6.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_6.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(10, -4)
}
h2_6.collision_mask = {"layer-12"}
-------------------------------------------
local h2_7 = table.deepcopy(animation_overlay_template)
h2_7.name = "h2_7"
h2_7.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage2_7.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(10, -6)
}
h2_7.collision_mask = {"layer-12"}
-------------------------------------------
local h3_3 = table.deepcopy(animation_overlay_template)
h3_3.name = "h3_3"
h3_3.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_3.png",
    width = 320,
    height = 307,
    scale = 0.50
}
h3_3.collision_mask = {"layer-13"}
-------------------------------------------
local h3_4 = table.deepcopy(animation_overlay_template)
h3_4.name = "h3_4"
h3_4.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_4.png",
    width = 320,
    height = 307,
    scale = 0.50
}
h3_4.collision_mask = {"layer-13"}
-------------------------------------------
local h3_5 = table.deepcopy(animation_overlay_template)
h3_5.name = "h3_5"
h3_5.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_5.png",
    width = 320,
    height = 307,
    scale = 0.50
}
h3_5.collision_mask = {"layer-13"}
-------------------------------------------
local h3_6 = table.deepcopy(animation_overlay_template)
h3_6.name = "h3_6"
h3_6.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_6.png",
    width = 320,
    height = 307,
    scale = 0.50
}
h3_6.collision_mask = {"layer-13"}
-------------------------------------------
local h3_7 = table.deepcopy(animation_overlay_template)
h3_7.name = "h3_7"
h3_7.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_7.png",
    width = 320,
    height = 307,
    scale = 0.50
}
h3_7.collision_mask = {"layer-13"}
-------------------------------------------
local h3_8 = table.deepcopy(animation_overlay_template)
h3_8.name = "h3_8"
h3_8.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_8.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(-16, -4)
}
h3_8.collision_mask = {"layer-13"}
-------------------------------------------
local h3_9 = table.deepcopy(animation_overlay_template)
h3_9.name = "h3_9"
h3_9.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_9.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(8, 8)
}
h3_9.collision_mask = {"layer-13"}
-------------------------------------------
local h3_10 = table.deepcopy(animation_overlay_template)
h3_10.name = "h3_10"
h3_10.picture = {
    filename = "__Annotorio__/graphics/entity/house_stage3_10.png",
    width = 320,
    height = 307,
    scale = 0.50,
    shift = util.by_pixel(-8, -16)
}
h3_10.collision_mask = {"layer-13"}
-------------------------------------------

data:extend(
    {
        --These all need to be mirrored into scripts.houses
        h1_1,
        h1_2,
        h1_3,
        h1_4,
        h1_5,
        h1_6,
        ---
        h2_1,
        h2_2,
        h2_3,
        h2_4,
        h2_5,
        h2_6,
        h2_7,
        ---
        h3_3,
        h3_4,
        h3_5,
        h3_6,
        h3_7,
        h3_8,
        h3_9,
        h3_10
    }
)
