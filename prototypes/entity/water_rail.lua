local water_rail_straight = table.deepcopy(data.raw["straight-rail"]["straight-rail"])
local water_rail_curved = table.deepcopy(data.raw["curved-rail"]["curved-rail"])

water_rail_curved.name = "water_rail_curved"
water_rail_straight.name = "water_rail_straight"

water_rail_curved.collision_mask = {"layer-14", "doodad-layer"}
water_rail_straight.collision_mask = {"layer-14", "doodad-layer"}

water_rail_curved.minable.result = "water_rail_straight"
water_rail_straight.minable.result = "water_rail_straight"

water_rail_curved.placeable_by = {item = "water_rail_straight", count = 1}
water_rail_straight.placeable_by = {item = "water_rail_straight", count = 1}

water_rail_curved.selection_priority = 49
water_rail_straight.selection_priority = 49

local harbor = table.deepcopy(data.raw["train-stop"]["train-stop"])
harbor.name = "anno_harbor"
harbor.flags = {"filter-directions"}
harbor.collision_mask = {}
harbor.minable = nil

data:extend(
    {
        harbor,
        water_rail_curved,
        water_rail_straight,
        {
            type = "item",
            name = "anno_harbor",
            icon = "__base__/graphics/icons/train-stop.png",
            icon_size = 32,
            subgroup = "transport",
            order = "a[train-system]-c[train-stop]",
            place_result = "anno_harbor",
            stack_size = 10
        },
        --item
        {
            type = "rail-planner",
            name = "water_rail_straight",
            icon = "__Annotorio__/graphics/icons/water_rail_icon.png",
            icon_size = 64,
            localised_name = {"item-name.water_rail_straight"},
            subgroup = "ships_misc",
            order = "a",
            place_result = "water_rail_straight",
            stack_size = 200,
            straight_rail = "water_rail_straight",
            curved_rail = "water_rail_curved"
        },
        --recipe
        {
            type = "recipe",
            name = "water_rail_straight",
            ingredients = {},
            result = "water_rail_straight",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
