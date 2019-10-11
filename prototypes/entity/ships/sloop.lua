function sloop_stripes()
    local result = {}

    for index = 1, 9, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/ships/sloop/sloop" .. "000" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end

    for index = 10, 90, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/ships/sloop/sloop" .. "00" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end
    return result
end

function sloop_filename()
    local result = {}

    for index = 1, 9, 1 do
        table.insert(result, "__Annotorio__/graphics/entity/ships/sloop/sloop" .. "000" .. tostring(index) .. ".png")
    end

    for index = 10, 90, 1 do
        table.insert(result, "__Annotorio__/graphics/entity/ships/sloop/sloop" .. "00" .. tostring(index) .. ".png")
    end

    return result
end

local sloop = {
    type = "car",
    name = "sloop",
    icon = "__Annotorio__/graphics/icons/sloop_icon.png",
    icon_size = 64,
    flags = {"placeable-player", "placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.75, result = "sloop"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 800,
    guns = {"sloop_bow"},
    inventory_size = 3,
    rotation_speed = 0.0075,
    weight = 10000,
    effectivity = 1,
    braking_power = "200kW",
    consumption = "200kW",
    --measured speed 65.7 km/h
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
    collision_box = {{-0.75, -1.75}, {0.75, 1.75}},
    selection_box = {{-0.75, -1.75}, {0.75, 1.75}},
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
                direction_count = 90,
                width = 432,
                height = 483,
                frame_count = 1,
                shift = {0.65, -0.4},
                animation_speed = 8,
                max_advance = 1,
                scale = 0.5,
                stripes = sloop_stripes()
            }
        }
    },
    turret_rotation_speed = 0.5 / 60,
    sound_minimum_speed = 0.2,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {
            filename = "__Annotorio__/sound/Boat_Moving.ogg",
            volume = 1
        },
        match_speed_to_activity = true
    },
    tank_driving = true,
    open_sound = {filename = "__base__/sound/car-door-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/car-door-close.ogg", volume = 0.7}
}

-------------------------------------------------------------
-------------------------------------------------------------
local sloop_loc = table.deepcopy(data.raw["locomotive"]["locomotive"])
sloop_loc.name = "sloop_loc"

sloop_loc.flags = {"not-blueprintable", "placeable-neutral", "player-creation"}
sloop_loc.burner = nil
sloop_loc.energy_source = {
    type = "void"
}
sloop_loc.minable = nil

sloop_loc.max_speed = 1.2
sloop_loc.max_power = "200kW"
--sloop_loc.braking_power = "600kW"
sloop_loc.braking_force = 12
sloop_loc.reversing_power_modifier = 0.75
sloop_loc.weight = 10000
sloop_loc.friction_force = nil
sloop_loc.friction = 1e-3
sloop_loc.air_resistance = 0

sloop_loc.drawing_box = nil
sloop_loc.pictures = {
    priority = "very-low",
    width = 1,
    height = 1,
    direction_count = 1,
    filename = "__core__/graphics/empty.png",
    line_length = 1,
    lines_per_file = 1
}

sloop_loc.pictures = {
    priority = "very-low",
    width = 1,
    height = 1,
    direction_count = 1,
    filename = "__core__/graphics/empty.png",
    line_length = 1,
    lines_per_file = 1
}

sloop_loc.wheels = {
    priority = "very-low",
    width = 1,
    height = 1,
    direction_count = 1,
    filename = "__core__/graphics/empty.png",
    line_length = 1,
    lines_per_file = 1
}

sloop_loc.drive_over_tie_trigger = nil
sloop_loc.stop_trigger = nil
sloop_loc.working_sound = {
    sound = {
        filename = "__Annotorio__/sound/Boat_Moving.ogg",
        volume = 1
    }
}

sloop_loc.energy_per_hit_point = 1
sloop_loc.max_health = 800

sloop_loc.connection_distance = 1
sloop_loc.joint_distance = 0.6

sloop_loc.collision_box = {{-0.6, -0.5}, {0.6, 0.5}}
sloop_loc.selection_box = {{-1.0, -1.0}, {1.0, 1.0}}

-------------------------------------------------------------
-------------------------------------------------------------
local sloop_cargo = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
sloop_cargo.name = "sloop_cargo"
sloop_cargo.icon = "__Annotorio__/graphics/icons/sloop_icon.png"
sloop_cargo.icon_size = 64
sloop_cargo.minable = {mining_time = 0.75, result = "sloop_cargo"}

sloop_cargo.max_health = 800
sloop_cargo.inventory_size = 3

sloop_cargo.max_speed = 1.2
sloop_cargo.air_resistance = 0
sloop_cargo.weight = 1

sloop_cargo.pictures = {
    direction_count = 90,
    lines_per_file = 1,
    line_length = 1,
    filenames = sloop_filename(),
    width = 432,
    height = 483,
    shift = {0.65, -0.4},
    scale = 0.5
}
sloop_cargo.wheels = {
    priority = "very-low",
    width = 1,
    height = 1,
    direction_count = 1,
    filename = "__core__/graphics/empty.png",
    line_length = 1,
    lines_per_file = 1
}

sloop_cargo.drive_over_tie_trigger = nil
sloop_cargo.stop_trigger = nil
sloop_cargo.working_sound = {
    sound = {
        filename = "__Annotorio__/sound/Boat_Moving.ogg",
        volume = 1
    }
}

sloop_cargo.vertical_doors = nil
sloop_cargo.horizontal_doors = nil
sloop_cargo.braking_force = 1
sloop_cargo.braking_power = nil
sloop_cargo.friction_force = nil
sloop_cargo.friction = 1e-5

sloop_cargo.connection_distance = 1
sloop_cargo.joint_distance = 4.40

sloop_cargo.collision_box = {{-0.6, -2.4}, {0.6, 2.4}}
sloop_cargo.selection_box = {{-1, -2.703125}, {1, 3.296875}}

-------------------------------------------------------------
-------------------------------------------------------------

data:extend(
    {
        -- sloop entity
        sloop,
        -- sloop item
        {
            type = "item",
            name = "sloop",
            icon = "__Annotorio__/graphics/icons/sloop_icon.png",
            icon_size = 64,
            subgroup = "ships",
            order = "a",
            place_result = "sloop",
            stack_size = 25
        },
        -- sloop recipe
        {
            type = "recipe",
            name = "sloop",
            ingredients = {
                {"wood", 18},
                {"anno_tool", 6},
                {"cloth", 12}
            },
            result = "sloop",
            category = "shipyard",
            energy_required = 180,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        sloop_cargo,
        sloop_loc,
        -- sloop_cargo item
        {
            type = "item",
            name = "sloop_cargo",
            icon = "__Annotorio__/graphics/icons/sloop_loc_icon.png",
            icon_size = 64,
            subgroup = "ships_to_loc",
            order = "a",
            place_result = "sloop_cargo",
            stack_size = 25
        },
        --this cant be obtained
        {
            type = "item",
            name = "sloop_loc",
            icon = "__Annotorio__/graphics/icons/sloop_loc_icon.png",
            icon_size = 64,
            subgroup = "ships_to_loc",
            order = "a",
            place_result = "sloop_loc",
            stack_size = 25
        },
        -- sloop to locomotive
        {
            type = "recipe",
            name = "sloop_to_loc",
            icon = "__Annotorio__/graphics/icons/sloop_convert_icon.png",
            icon_size = 64,
            ingredients = {
                {"sloop", 1}
            },
            result = "sloop_cargo",
            subgroup = "ships_to_loc",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        },
        -- locomotive to sloop
        {
            type = "recipe",
            name = "sloop_from_loc",
            icon = "__Annotorio__/graphics/icons/sloop_convert_icon.png",
            icon_size = 64,
            ingredients = {
                {"sloop_cargo", 1}
            },
            result = "sloop",
            subgroup = "ships_from_loc",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        }
    }
)
