--tower_wood entity
local tower_wood = {
    type = "ammo-turret",
    name = "tower_wood",
    icon = "__Annotorio__/graphics/icons/tower_wood_icon.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "tower_wood"},
    max_health = 4000,
    corpse = "gun-turret-remnants",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    alert_when_attacking = true,
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    folded_animation = {
        filename = "__Annotorio__/graphics/entity/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1,
        line_length = 1,
        direction_count = 1
    },
    preparing_animation = nil,
    prepared_animation = nil,
    attacking_animation = nil,
    folding_animation = nil,
    base_picture = {
        layers = {
            {
                filename = "__Annotorio__/graphics/entity/tower_wood.png",
                priority = "extra-high",
                width = 223,
                height = 301,
                scale = 0.5,
                direction_count = 1,
                frame_count = 1,
                shift = util.by_pixel(31, -16)
            },
            {
                filename = "__Annotorio__/graphics/entity/tower_wood_s.png",
                priority = "extra-high",
                width = 223,
                height = 301,
                scale = 0.5,
                direction_count = 1,
                frame_count = 1,
                shift = util.by_pixel(62, -32),
                draw_as_shadow = true
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    attack_parameters = {
        type = "projectile",
        ammo_category = "anno_arrow",
        cooldown = 25,
        projectile_creation_distance = 1.125,
        projectile_center = {0, -1},
        range = 32.3,
        --min_range = 1,
        sound = {
            {
                filename = "__Annotorio__/sound/fire_bow_sound-mike-koenig.wav",
                volume = 0.5
            }
        }
    },
    call_for_help_radius = 40
}

local tower_stone = table.deepcopy(tower_wood)
tower_stone.name = "tower_stone"
tower_stone.minable = {mining_time = 0.5, result = "tower_stone"}
tower_stone.max_health = 6000

tower_stone.base_picture = {
    layers = {
        {
            filename = "__Annotorio__/graphics/entity/tower_stone.png",
            priority = "extra-high",
            width = 223,
            height = 301,
            scale = 0.5,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(31, -16)
        },
        {
            filename = "__Annotorio__/graphics/entity/tower_stone_s.png",
            priority = "extra-high",
            width = 223,
            height = 301,
            scale = 0.5,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(62, -32),
            draw_as_shadow = true
        }
    }
}

tower_stone.attack_parameters = {
    type = "projectile",
    ammo_category = "musket_ball",
    cooldown = 40,
    projectile_creation_distance = 1.125,
    projectile_center = {0, -1},
    range = 38,
    --min_range = 1,
    sound = {
        {
            filename = "__Annotorio__/sound/44_Magnum.wav",
            volume = 0.5
        }
    }
}

data:extend(
    {
        --  tower_wood item
        {
            type = "item",
            name = "tower_wood",
            icon = "__Annotorio__/graphics/icons/tower_wood_icon.png",
            icon_size = 64,
            subgroup = "defensive-structure",
            order = "d",
            place_result = "tower_wood",
            stack_size = 25
        },
        --tower_wood recipe
        {
            type = "recipe",
            name = "tower_wood",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 24},
                {"anno_tool", 6},
                {"bow", 4}
            },
            result = "tower_wood"
        },
        --  tower_stone item
        {
            type = "item",
            name = "tower_stone",
            icon = "__Annotorio__/graphics/icons/tower_stone_icon.png",
            icon_size = 64,
            subgroup = "defensive-structure",
            order = "e",
            place_result = "tower_stone",
            stack_size = 25
        },
        --tower_stone recipe
        {
            type = "recipe",
            name = "tower_stone",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"tower_wood", 1},
                {"anno_tool", 12},
                {"ceramics", 36},
                {"musket", 8}
            },
            result = "tower_stone"
        },
        tower_wood,
        tower_stone
    }
)
