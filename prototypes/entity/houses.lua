-------------------------------------------
local house_pioneer = {
    type = "assembling-machine",
    name = "house_pioneer",
    ------------------
    fixed_recipe = "pioneer_needs",
    crafting_categories = {"people_needs"},
    ingredient_count = 4,
    crafting_speed = 1,
    ---------------------
    energy_source = {
        type = "void"
    },
    energy_usage = "0.000001kW",
    -----------
    fast_replaceable_group = "house",
    icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.2, result = "house_pioneer"},
    max_health = 300,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    animation = {
        filename = "__Annotorio__/graphics/entity/house_stage1_1.png",
        width = 152,
        height = 113,
        scale = 0.5
    },
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
}
house_pioneer.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-11"}
local invisible_house_pioneer = table.deepcopy(house_pioneer)
invisible_house_pioneer.name = "invisible_house_pioneer"
invisible_house_pioneer.animation = nil
invisible_house_pioneer.flags = {"player-creation", "not-rotatable", "hidden"}
invisible_house_pioneer.placeable_by = {item = "house_pioneer", count = 1}
-------------------------------------------
local house_settler = {
    type = "assembling-machine",
    name = "house_settler",
    placeable_by = {item = "house_pioneer", count = 1},
    ------------------
    fixed_recipe = "settler_needs",
    crafting_categories = {"people_needs2"},
    ingredient_count = 7,
    crafting_speed = 1,
    ---------------------
    energy_source = {
        type = "void"
    },
    energy_usage = "0.000001kW",
    -----------
    fast_replaceable_group = "house",
    icon = "__Annotorio__/graphics/icons/house_settler_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.2, result = "house_settler"},
    max_health = 500,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    animation = {
        layers = {
            {
                filename = "__Annotorio__/graphics/entity/house_stage2_1.png",
                width = 174,
                height = 158,
                scale = 0.5
            }
        }
    },
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
}
house_settler.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-12"}
local invisible_house_settler = table.deepcopy(house_settler)
invisible_house_settler.name = "invisible_house_settler"
invisible_house_settler.animation = nil
invisible_house_settler.flags = {"player-creation", "not-rotatable", "hidden"}
-------------------------------------------
local house_citizen = {
    type = "assembling-machine",
    name = "house_citizen",
    placeable_by = {item = "house_pioneer", count = 1},
    ------------------
    fixed_recipe = "citizen_needs",
    crafting_categories = {"people_needs3"},
    ingredient_count = 7,
    crafting_speed = 1,
    ---------------------
    energy_source = {
        type = "void"
    },
    energy_usage = "0.00001kW",
    -----------
    fast_replaceable_group = "house",
    icon = "__Annotorio__/graphics/icons/house_citizen_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.2, result = "house_citizen"},
    max_health = 750,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    animation = {
        layers = {
            {
                filename = "__Annotorio__/graphics/entity/house_stage3_3.png",
                width = 320,
                height = 307,
                scale = 0.50
            }
        }
    },
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8}
}
house_citizen.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-13"}
local invisible_house_citizen = table.deepcopy(house_citizen)
invisible_house_citizen.name = "invisible_house_citizen"
invisible_house_citizen.animation = nil
invisible_house_citizen.flags = {"player-creation", "not-rotatable", "hidden"}
-------------------------------------------

data:extend(
    {
        house_settler,
        invisible_house_settler,
        house_pioneer,
        invisible_house_pioneer,
        house_citizen,
        invisible_house_citizen,
        --House1 item
        {
            type = "item",
            name = "house_pioneer",
            icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
            icon_size = 64,
            subgroup = "house",
            order = "a",
            place_result = "house_pioneer",
            stack_size = 25
        },
        --House2 item
        {
            type = "item",
            name = "house_settler",
            icon = "__Annotorio__/graphics/icons/house_settler_icon.png",
            icon_size = 64,
            subgroup = "house",
            order = "b",
            place_result = "house_settler",
            stack_size = 25
        },
        --House3 item
        {
            type = "item",
            name = "house_citizen",
            icon = "__Annotorio__/graphics/icons/house_citizen_icon.png",
            icon_size = 64,
            subgroup = "house",
            order = "c",
            place_result = "house_citizen",
            stack_size = 25
        },
        --House 1 recipe
        {
            type = "recipe",
            name = "house_pioneer",
            ingredients = {
                {"wood", 6}
            },
            result = "house_pioneer",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --House 2 recipe
        {
            type = "recipe",
            name = "house_settler",
            ingredients = {
                {"wood", 9},
                {"anno_tool", 2},
                {"house_pioneer", 1}
            },
            result = "house_settler",
            category = "not_in_build",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --House 3 recipe
        {
            type = "recipe",
            name = "house_citizen",
            hidden = true,
            ingredients = {
                {"ceramics", 24},
                {"wood", 18},
                {"anno_tool", 12},
                {"house_settler", 1}
            },
            result = "house_citizen",
            category = "not_in_build",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
