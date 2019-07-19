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
        filter_inserter,
        inserter
    }
)
