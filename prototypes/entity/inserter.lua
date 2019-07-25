local filter_inserter = table.deepcopy(data.raw.inserter["filter-inserter"])
filter_inserter.name = "anno_filter_inserter"
filter_inserter.minable = {mining_time = 0.1, result = "anno_filter_inserter"}
filter_inserter.energy_per_movement = "0.707547kJ"
filter_inserter.energy_per_rotation = "0.707547kJ"
filter_inserter.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 0,
    buffer_capacity = "1kJ",
    drain = "0kW"
}

local anno_long_inserter = table.deepcopy(data.raw.inserter["long-handed-inserter"])
anno_long_inserter.name = "anno_long_inserter"
anno_long_inserter.minable = {mining_time = 0.1, result = "anno_long_inserter"}
anno_long_inserter.energy_per_movement = "0.707547kJ"
anno_long_inserter.energy_per_rotation = "0.707547kJ"
anno_long_inserter.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 0,
    buffer_capacity = "1kJ",
    drain = "0kW"
}

local inserter = table.deepcopy(data.raw.inserter["inserter"])
inserter.name = "anno_inserter"
inserter.minable = {mining_time = 0.1, result = "anno_inserter"}
inserter.energy_per_movement = "0.707547kJ"
inserter.energy_per_rotation = "0.707547kJ"
inserter.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 0,
    buffer_capacity = "1kJ",
    drain = "0kW"
}
---Values of original inserter
--extension_speed = 0.03
--rotation_speed = 0.014
---Values of original filter nserter
--extension_speed = 0.07
--rotation_speed = 0.04

inserter.rotation_speed = 0.035
inserter.extension_speed = 0.02

filter_inserter.extension_speed = inserter.extension_speed
filter_inserter.rotation_speed = inserter.rotation_speed

data:extend(
    {
        anno_long_inserter,
        filter_inserter,
        inserter,
        --inserter
        {
            type = "item",
            name = "anno_inserter",
            icon = "__base__/graphics/icons/inserter.png",
            icon_size = 32,
            subgroup = "inserter",
            order = "b[building]-h[anno_inserter]",
            place_result = "anno_inserter",
            stack_size = 50
        },
        --filter inserter
        {
            type = "item",
            name = "anno_filter_inserter",
            icon = "__base__/graphics/icons/filter-inserter.png",
            icon_size = 32,
            subgroup = "inserter",
            order = "b[building]-h[anno_filter_inserter]",
            place_result = "anno_filter_inserter",
            stack_size = 50
        },
        --long inserter
        {
            type = "item",
            name = "anno_long_inserter",
            icon = "__base__/graphics/icons/long-handed-inserter.png",
            icon_size = 32,
            subgroup = "inserter",
            order = "b[building]-h[anno_filter_inserter]",
            place_result = "anno_long_inserter",
            stack_size = 50
        },
        -- inserter
        {
            type = "recipe",
            name = "anno_inserter",
            ingredients = {
                {"wood", 4}
                -- {"anno_tool", 1}
            },
            result = "anno_inserter",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- long inserter
        {
            type = "recipe",
            name = "anno_long_inserter",
            ingredients = {
                {"wood", 8}
                -- {"anno_tool", 1}
            },
            result = "anno_long_inserter",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- filter inserter
        {
            type = "recipe",
            name = "anno_filter_inserter",
            ingredients = {
                {"wood", 6}
                -- {"anno_tool", 1}
            },
            result = "anno_filter_inserter",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
