local trade_group = {
    type = "item-group",
    name = "trade",
    order = "z_trade",
    inventory_order = "todo",
    icon = "__Annotorio__/graphics/icons/trade_category_icon.png",
    icon_size = 128
}
local trade_subgroup_sell = {
    type = "item-subgroup",
    name = "trade_sell",
    group = "trade",
    order = "a"
}
local trade_subgroup_buy = {
    type = "item-subgroup",
    name = "trade_buy",
    group = "trade",
    order = "b"
}

local intermediate_subgroup_people_needs = {
    type = "item-subgroup",
    name = "people_needs",
    group = "intermediate-products",
    order = "aa"
}
local intermediate_subgroup_anno_raw = {
    type = "item-subgroup",
    name = "anno_raw",
    group = "intermediate-products",
    order = "bb"
}
local intermediate_subgroup_smelter = {
    type = "item-subgroup",
    name = "smelter",
    group = "intermediate-products",
    order = "cc"
}
local intermediate_subgroup_blacksmith = {
    type = "item-subgroup",
    name = "blacksmith",
    group = "intermediate-products",
    order = "dd"
}
local intermediate_subgroup_misc = {
    type = "item-subgroup",
    name = "misc",
    group = "intermediate-products",
    order = "ff"
}



data:extend(
    {
        trade_group,
        trade_subgroup_sell,
        trade_subgroup_buy,
        intermediate_subgroup_people_needs,
        intermediate_subgroup_blacksmith,
        intermediate_subgroup_smelter,
        intermediate_subgroup_anno_raw,
        intermediate_subgroup_misc
    }
)

data.raw["item-group"]["combat"].icon = "__Annotorio__/graphics/icons/weapon_category_icon.png"
data.raw["item-group"]["combat"].icon_size = 128

data.raw["item-group"]["production"].icon = "__Annotorio__/graphics/icons/production_category_icon.png"
data.raw["item-group"]["production"].icon_size = 128

data.raw["item-group"]["intermediate-products"].icon = "__Annotorio__/graphics/icons/intermediate_category_icon.png"
data.raw["item-group"]["intermediate-products"].icon_size = 128
