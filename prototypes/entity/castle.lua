--castle entity
local castle = {
    type = "assembling-machine",
    ------------------

    crafting_categories = {"castle"},
    ingredient_count = 6,
    crafting_speed = 1,
    ---------------------

    name = "castle",
    icon = "__Annotorio__/graphics/icons/castle_icon.png",
    placeable_by = {item = "castle", count = 1},
    icon_size = 64,
    flags = {"player-creation"},
    minable = nil,
    max_health = 15000,
    dying_explosion = "big-explosion",
    corpse = "big-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-3.2, -2.2}, {0, 2.2}},
    selection_box = {{-3.5, -2.5}, {0, 2.5}},
    alert_icon_shift = util.by_pixel(-64, 0),
    animation = {
        layers = {
            {
                filename = "__Annotorio__/graphics/entity/castle.png",
                priority = "extra-high",
                width = 640,
                height = 557,
                scale = 0.5,
                shift = util.by_pixel(48, 6)
            },
            {
                filename = "__Annotorio__/graphics/entity/castle_s.png",
                priority = "extra-high",
                width = 640,
                height = 557,
                scale = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(48, 6)
            }
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 6,
        drain = "15kW"
    },
    energy_usage = "250kW",
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

local castle_dummy = table.deepcopy(castle)
castle_dummy.name = "castle_dummy"
castle_dummy.minable = {mining_time = 0.2, result = "castle"}
castle_dummy.collision_box = {{-3.2, -2.2}, {3.2, 2.2}}
castle_dummy.selection_box = {{-3.5, -2.5}, {3.5, 2.5}}

data:extend(
    {
        castle_dummy,
        castle,
        {
            type = "recipe-category",
            name = "castle"
        },
        --  castle item
        {
            type = "item",
            name = "castle",
            icon = "__Annotorio__/graphics/icons/castle_icon.png",
            icon_size = 64,
            subgroup = "defensive-structure",
            order = "i",
            place_result = "castle_dummy",
            stack_size = 25
        },
        -- castle recipe
        {
            type = "recipe",
            name = "castle",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 32},
                {"ceramics", 120},
                {"anno_tool", 26},
                {"bow", 20}
            },
            result = "castle"
        },
        -- castle_armory
        {
            type = "container",
            name = "castle_armory",
            icon = "__Annotorio__/graphics/icons/castle_icon.png",
            icon_size = 64,
            placeable_by = {item = "castle", count = 1},
            minable = {mining_time = 0.2, result = "castle"},
            max_health = 999999,
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
            collision_box = {{0, -2.2}, {3.2, 2.2}},
            selection_box = {{-0, -2.5}, {3.5, 2.5}},
            inventory_size = 60,
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            picture = {
                filename = "__core__/graphics/empty.png",
                priority = "extra-high",
                width = 1,
                height = 1
            },
            circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
            circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        }
    }
)
