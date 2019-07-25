-------
data.raw.resource["coal"].category = "anno_coal"
data.raw.resource["coal"].selection_priority = 49
data.raw.resource["copper-ore"].category = "anno_copper"
data.raw.resource["copper-ore"].selection_priority = 49
data.raw.resource["iron-ore"].category = "anno_iron"
data.raw.resource["iron-ore"].selection_priority = 49
-------

--Mine Iron
local iron_mine = {
    type = "assembling-machine",
    ------------------
    fixed_recipe = "iron_mining",
    crafting_categories = {"predetermined"},
    ingredient_count = 1,
    crafting_speed = 1,
    ---------------------

    name = "iron_mine",
    placeable_by = {item = "mine_dummy", count = 1},
    icon = "__Annotorio__/graphics/icons/mine_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    selection_priority = 51,
    minable = {mining_time = 0.2, result = "mine_dummy"},
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
        layers = {
            {
                filename = "__Annotorio__/graphics/entity/mine.png",
                priority = "extra-high",
                width = 200,
                height = 148,
                scale = 0.5,
                shift = util.by_pixel(10, 6)
            },
            {
                filename = "__Annotorio__/graphics/entity/mine_s.png",
                priority = "extra-high",
                width = 200,
                height = 148,
                scale = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(10, 6)
            }
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 8,
        drain = "6.666666kW"
    },
    energy_usage = "13.333333kW",
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

local copper_mine = table.deepcopy(iron_mine)
copper_mine.name = "copper_mine"
copper_mine.fixed_recipe = "copper_mining"
local coal_mine = table.deepcopy(iron_mine)
coal_mine.name = "coal_mine"
coal_mine.fixed_recipe = "coal_mining"

data:extend(
    {
        iron_mine,
        copper_mine,
        coal_mine,
        {
            type = "resource-category",
            name = "anno_iron"
        },
        {
            type = "resource-category",
            name = "anno_copper"
        },
        {
            type = "resource-category",
            name = "anno_coal"
        },
        --  mine dummy
        {
            type = "item",
            name = "mine_dummy",
            icon = "__Annotorio__/graphics/icons/mine_icon.png",
            icon_size = 64,
            subgroup = "basic",
            order = "b[building]-r[mine]",
            place_result = "mine_dummy",
            stack_size = 25
        },
        --  Mine dummy
        {
            type = "recipe",
            name = "mine_dummy",
            ingredients = {
                {"wood", 14},
                {"anno_tool", 4}
            },
            result = "mine_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --coal mining
        {
            type = "recipe",
            name = "coal_mining",
            enabled = true,
            hidden = false,
            energy_required = 0.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "coal"
        }, --iron mining
        {
            type = "recipe",
            name = "iron_mining",
            enabled = true,
            hidden = false,
            energy_required = 3.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "iron-ore"
        },
        --copper mining
        {
            type = "recipe",
            name = "copper_mining",
            enabled = true,
            hidden = false,
            energy_required = 3.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "copper-ore"
        },
        {
            type = "mining-drill",
            name = "mine_dummy",
            icon = "__base__/graphics/icons/electric-mining-drill.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            selection_priority = 51,
            minable = {mining_time = 0.3, result = "unobtainable_dummy"},
            max_health = 300,
            resource_categories = {"anno_iron", "anno_copper", "anno_coal"},
            corpse = "medium-remnants",
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            working_sound = {
                sound = {
                    filename = "__base__/sound/electric-mining-drill.ogg",
                    volume = 0.75
                },
                apparent_volume = 1.5
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
            animations = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/mine.png",
                        priority = "extra-high",
                        width = 200,
                        height = 148,
                        scale = 0.5,
                        shift = util.by_pixel(10, 6)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/mine_s.png",
                        priority = "extra-high",
                        width = 200,
                        height = 148,
                        scale = 0.5,
                        draw_as_shadow = true,
                        shift = util.by_pixel(10, 6)
                    }
                }
            },
            mining_speed = 1,
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 8,
                drain = "6.666666kW"
            },
            energy_usage = "13.333333kW",
            resource_searching_radius = 1.49,
            vector_to_place_result = {0, -1.85},
            radius_visualisation_picture = {
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
                width = 10,
                height = 10
            },
            monitor_visualization_tint = {r = 78, g = 173, b = 255},
            circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
            circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
            circuit_wire_max_distance = default_circuit_wire_max_distance
        }
    }
)
