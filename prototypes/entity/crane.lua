local anno_crane = table.deepcopy(data.raw.inserter["long-handed-inserter"])
--This is the Kontor version which can not be placed directly and not removed
anno_crane.name = "anno_crane"
anno_crane.minable = nil
anno_crane.max_health = 999999
anno_crane.flags = {"placeable-off-grid", "not-blueprintable"}
anno_crane.placeable_by = {item = "kontor", count = 1}
---------------------------
anno_crane.energy_per_movement = "0.707547kJ"
anno_crane.energy_per_rotation = "0.707547kJ"
anno_crane.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 0,
    buffer_capacity = "1kJ",
    drain = "0kW"
}
---------------------------
anno_crane.stack = true
anno_crane.filter_count = 5
--anno_crane.rotation_speed
--------------------------
local empty = {
    filename = "__core__/graphics/empty.png",
    priority = "extra-high",
    width = 1,
    height = 1
}

anno_crane.hand_base_picture = empty
anno_crane.hand_base_shadow = empty
anno_crane.hand_closed_picture = empty
anno_crane.hand_closed_shadow = empty
anno_crane.hand_open_picture = empty
anno_crane.hand_open_shadow = empty
anno_crane.platform_picture = empty
--------------------------

anno_crane.collision_box = {{-0.5, -0.5}, {0.5, 0.5}}
anno_crane.selection_box = {{-1.25, -1.25}, {0, 1.25}}

anno_crane.pickup_position = {0, -3}
anno_crane.insert_position = {0, 3.2}

--------------------------

--This is a player placeable version of the crane
local anno_crane_2 = table.deepcopy(anno_crane)
anno_crane_2.name = "anno_crane_2"
anno_crane_2.minable = {mining_time = 0.1, result = "anno_crane_2"}
anno_crane_2.max_health = 500
anno_crane_2.flags = {"placeable-neutral", "placeable-player", "player-creation"}
anno_crane_2.placeable_by = nil

anno_crane_2.collision_box = {{-1.4, -1.4}, {1.4, 1.4}}
anno_crane_2.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
anno_crane_2.collision_mask = {}

anno_crane_2.platform_picture = {
    north = {
        filename = "__Annotorio__/graphics/entity/crane_south.png",
        priority = "extra-high",
        width = 354,
        height = 334,
        scale = 0.5,
        shift = util.by_pixel(0, -40)
    },
    south = {
        filename = "__Annotorio__/graphics/entity/crane_north.png",
        priority = "extra-high",
        width = 354,
        height = 334,
        scale = 0.5,
        shift = util.by_pixel(-1, -40)
    },
    east = {
        filename = "__Annotorio__/graphics/entity/crane_west.png",
        priority = "extra-high",
        width = 354,
        height = 334,
        scale = 0.5,
        shift = util.by_pixel(2, -40)
    },
    west = {
        filename = "__Annotorio__/graphics/entity/crane_east.png",
        priority = "extra-high",
        width = 354,
        height = 334,
        scale = 0.5,
        shift = util.by_pixel(-2, -40)
    }
}

data:extend(
    {
        anno_crane,
        anno_crane_2,
        --anno_crane item
        {
            type = "item",
            name = "anno_crane_2",
            icon = "__Annotorio__/graphics/icons/crane_icon.png",
            icon_size = 64,
            subgroup = "inserter",
            order = "b[building]-z[anno_crane]",
            place_result = "anno_crane_2",
            stack_size = 50
        },
        -- anno_crane recipe
        {
            type = "recipe",
            name = "anno_crane_2",
            ingredients = {
                {"wood", 40},
                {"anno_tool", 20}
            },
            result = "anno_crane_2",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
