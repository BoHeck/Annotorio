function carrack_stripes()
    local result = {}

    for index = 54, 71, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/ships/carrack/" .. "00" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end

    for index = 0, 9, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/ships/carrack/" .. "000" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end

    for index = 10, 53, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/ships/carrack/" .. "00" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end

    return result
end

function carrack_filename()
    local result = {}

    for index = 54, 71, 1 do
        table.insert(result, "__Annotorio__/graphics/entity/ships/carrack/" .. "00" .. tostring(index) .. ".png")
    end

    for index = 0, 9, 1 do
        table.insert(result, "__Annotorio__/graphics/entity/ships/carrack/" .. "000" .. tostring(index) .. ".png")
    end

    for index = 10, 53, 1 do
        table.insert(result, "__Annotorio__/graphics/entity/ships/carrack/" .. "00" .. tostring(index) .. ".png")
    end

    return result
end

local carrack = {
    type = "car",
    name = "carrack",
    icon = "__Annotorio__/graphics/icons/carrack_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.75, result = "carrack"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 3000,
    guns = {"carrack_cannon"},
    inventory_size = 80,
    rotation_speed = 0.005,
    weight = 70000,
    effectivity = 1,
    braking_power = "400kW",
    consumption = "1000kW",
    friction = 1e-3,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    energy_per_hit_point = 1,
    crash_trigger = crash_trigger(),
    resistances = {
        {
            type = "fire",
            percent = 50
        },
        {
            type = "impact",
            percent = 30,
            decrease = 50
        },
        {
            type = "acid",
            percent = 20
        }
    },
    collision_mask = {"ground-tile", "object-layer"},
    collision_box = {{-1, -2.5}, {1, 2.5}},
    selection_box = {{-1, -2.5}, {1, 2.5}},
    energy_source = {
        type = "void"
    },
    light = {
        {
            type = "oriented",
            minimum_darkness = 0.3,
            picture = {
                filename = "__core__/graphics/light-cone.png",
                priority = "extra-high",
                flags = {"light"},
                scale = 2,
                width = 200,
                height = 200
            },
            shift = {-0.6, -14},
            size = 2,
            intensity = 0.6,
            color = {r = 0.92, g = 0.77, b = 0.3}
        },
        {
            type = "oriented",
            minimum_darkness = 0.3,
            picture = {
                filename = "__core__/graphics/light-cone.png",
                priority = "extra-high",
                flags = {"light"},
                scale = 2,
                width = 200,
                height = 200
            },
            shift = {0.6, -14},
            size = 2,
            intensity = 0.6,
            color = {r = 0.92, g = 0.77, b = 0.3}
        }
    },
    render_layer = "object",
    animation = {
        layers = {
            {
                direction_count = 72,
                width = 448,
                height = 600,
                frame_count = 1,
                shift = {0.2, 0},
                animation_speed = 8,
                max_advance = 1,
                scale = 0.5,
                stripes = carrack_stripes()
            }
        }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_minimum_speed = 0.2,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    --[[
    working_sound = {
        sound = {
            filename = "__base__/sound/car-engine.ogg",
            volume = 0.6
        },
        activate_sound = {
            filename = "__base__/sound/car-engine-start.ogg",
            volume = 0.6
        },
        deactivate_sound = {
            filename = "__base__/sound/car-engine-stop.ogg",
            volume = 0.6
        },
        match_speed_to_activity = true
    },]]
    tank_driving = true,
    open_sound = {filename = "__base__/sound/car-door-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/car-door-close.ogg", volume = 0.7}
}
-------------------------------------------------------------
local carrack_loc = table.deepcopy(data.raw["locomotive"]["locomotive"])
carrack_loc.name = "carrack_loc"
carrack_loc.flags = {"not-blueprintable", "placeable-neutral", "player-creation"}
carrack_loc.burner = nil
carrack_loc.energy_source = {
    type = "void"
}
carrack_loc.minable = {mining_time = 0.75, result = "carrack_loc"}
carrack_loc.max_speed = 1.2

carrack_loc.max_power = "1000kW"
--carrack_loc.braking_power = "600kW"
carrack_loc.braking_force = 40

carrack_loc.reversing_power_modifier = 0.75
carrack_loc.weight = 70000

carrack_loc.friction_force = nil
carrack_loc.friction = 1e-3
carrack_loc.air_resistance = 0

carrack_loc.drawing_box = nil
carrack_loc.pictures = {
    direction_count = 72,
    lines_per_file = 1,
    line_length = 1,
    filenames = carrack_filename(),
    width = 448,
    height = 600,
    shift = {0.2, -0.8},
    scale = 0.5
}
carrack_loc.wheels = {
    priority = "very-low",
    width = 1,
    height = 1,
    direction_count = 1,
    filename = "__core__/graphics/empty.png",
    line_length = 1,
    lines_per_file = 1
}

carrack_loc.working_sound=nil


carrack_loc.energy_per_hit_point = 1
carrack_loc.max_health = 3000
-----------------------------------------------




local carrack_cannon = table.deepcopy(data.raw.gun["tank-cannon"])
carrack_cannon.name = "carrack_cannon"
carrack_cannon.icon = "__Annotorio__/graphics/icons/cannon_icon.png"
carrack_cannon.icon_size = 64

data:extend(
    {
        carrack_cannon,
        carrack,
        carrack_loc,
        {
            type = "item",
            name = "carrack",
            icon = "__Annotorio__/graphics/icons/carrack_icon.png",
            icon_size = 64,
            subgroup = "ships",
            order = "b",
            place_result = "carrack",
            stack_size = 25
        },
        {
            type = "item",
            name = "carrack_loc",
            icon = "__Annotorio__/graphics/icons/carrack_loc_icon.png",
            icon_size = 64,
            subgroup = "ships_to_loc",
            order = "b",
            place_result = "carrack_loc",
            stack_size = 25
        },
        -- carrack
        {
            type = "recipe",
            name = "carrack",
            ingredients = {
                {"wood", 120},
                {"anno_tool", 40},
                {"cloth", 80}
            },
            result = "carrack",
            category = "shipyard",
            energy_required = 180,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- carrack to locomotive
        {
            type = "recipe",
            name = "carrack_to_loc",
            icon = "__Annotorio__/graphics/icons/carrack_convert_icon.png",
            icon_size = 64,
            ingredients = {
                {"carrack", 1}
            },
            result = "carrack_loc",
            subgroup = "ships_to_loc",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- locomotive to carrack
        {
            type = "recipe",
            name = "carrack_from_loc",
            icon = "__Annotorio__/graphics/icons/carrack_convert_icon.png",
            icon_size = 64,
            ingredients = {
                {"carrack_loc", 1}
            },
            result = "carrack",
            subgroup = "ships_from_loc",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
