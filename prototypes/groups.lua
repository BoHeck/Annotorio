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

local intermediate_subgroup_advanced_item = {
    type = "item-subgroup",
    name = "advanced_item",
    group = "intermediate-products",
    order = "ee"
}

local intermediate_subgroup_press = {
    type = "item-subgroup",
    name = "press",
    group = "intermediate-products",
    order = "ff"
}

local intermediate_subgroup_misc = {
    type = "item-subgroup",
    name = "misc",
    group = "intermediate-products",
    order = "gg"
}
local barreled_item = {
    type = "item-subgroup",
    name = "barreled_item",
    group = "intermediate-products",
    order = "z"
}
local luxus_building = {
    type = "item-subgroup",
    name = "luxus_building",
    group = "logistics",
    order = "zz"
}

local house = {
    type = "item-subgroup",
    name = "house",
    group = "logistics",
    order = "xx"
}

local administration = {
    type = "item-subgroup",
    name = "administration",
    group = "logistics",
    order = "ww"
}

local fishing = {
    type = "item-subgroup",
    name = "fishing",
    group = "production",
    order = "b"
}
local basic = {
    type = "item-subgroup",
    name = "basic",
    group = "production",
    order = "a"
}
local advanced = {
    type = "item-subgroup",
    name = "advanced",
    group = "production",
    order = "x"
}

local pasture = {
    type = "item-subgroup",
    name = "pasture",
    group = "production",
    order = "d"
}
local plantation = {
    type = "item-subgroup",
    name = "plantation",
    group = "production",
    order = "e"
}

data:extend(
    {
        trade_group,
        trade_subgroup_sell,
        trade_subgroup_buy,
        intermediate_subgroup_people_needs,
        intermediate_subgroup_advanced_item,
        intermediate_subgroup_blacksmith,
        intermediate_subgroup_smelter,
        intermediate_subgroup_anno_raw,
        intermediate_subgroup_misc,
        luxus_building,
        house,
        administration,
        fishing,
        basic,
        advanced,
        barreled_item,
        pasture,
        plantation
    }
)

data.raw["item-group"]["combat"].icon = "__Annotorio__/graphics/icons/weapon_category_icon.png"
data.raw["item-group"]["combat"].icon_size = 128

data.raw["item-group"]["production"].icon = "__Annotorio__/graphics/icons/production_category_icon.png"
data.raw["item-group"]["production"].icon_size = 128

data.raw["item-group"]["intermediate-products"].icon = "__Annotorio__/graphics/icons/intermediate_category_icon.png"
data.raw["item-group"]["intermediate-products"].icon_size = 128
