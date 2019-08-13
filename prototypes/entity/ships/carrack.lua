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
    braking_power = "200kW",
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
                width = 448,
                height = 600,
                frame_count = 1,
                direction_count = 72,
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

local carrack_cannon = table.deepcopy(data.raw.gun["tank-cannon"])
carrack_cannon.name = "carrack_cannon"
carrack_cannon.icon = "__Annotorio__/graphics/icons/cannon_icon.png"
carrack_cannon.icon_size = 64

data:extend(
    {
        carrack_cannon,
        carrack,
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
            type = "recipe-category",
            name = "shipyard"
        },
        -- fishing boat
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
            energy_required = 300,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
