local powder_keg = table.deepcopy(data.raw["capsule"]["cliff-explosives"])
powder_keg.icon = "__Annotorio__/graphics/icons/powder_keg_icon.png"
powder_keg.icon_size = 64
powder_keg.name = "powder_keg"
powder_keg.subgroup = "gun"

data:extend(
    {
        -------Buldings----------

        -------Ingredients--------
        powder_keg,
        -------Consumables--------

        -------Technology---------
        --technology_settle_island
        {
            type = "tool",
            name = "settle_island",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "001",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "feed_your_people",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "002",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "grow_1",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "003",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "dress_your_people_1",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "004",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "upgrade_your_kontor_1",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "005",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "drink_for_the_people_1",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "006",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "provide_luxus_1",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "007",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "drink_for_the_people_2",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "008",
            stack_size = 1,
            flags = {"hidden"}
        },
        {
            type = "tool",
            name = "feed_your_people_2",
            durability = 1,
            icon = "__Annotorio__/graphics/entity/empty.png",
            icon_size = 1,
            subgroup = "raw-resource",
            order = "009",
            stack_size = 1,
            flags = {"hidden"}
        },
        -----------Special-------------

        --inventory_placeholder
        {
            type = "item",
            name = "wood_placeholder",
            icon = "__core__/graphics/cancel.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 1,
            flags = {"hidden"}
        },
        --inventory_placeholder
        {
            type = "item",
            name = "anno_tool_placeholder",
            icon = "__core__/graphics/cancel.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 1,
            flags = {"hidden"}
        },
        --inventory_placeholder
        {
            type = "item",
            name = "ceramics_placeholder",
            icon = "__core__/graphics/cancel.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 1,
            flags = {"hidden"}
        },
        --preventingCraftToGoForwardDummy
        {
            type = "item",
            name = "preventingCraftToGoForwardDummy",
            icon = "__base__/graphics/icons/signal/signal_white.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "zzz",
            stack_size = 50,
            flags = {"hidden"}
        },
        --Pioneer Information
        {
            type = "item",
            name = "pioneer_information",
            icon = "__base__/graphics/icons/signal/signal_P.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "a1",
            stack_size = 50
        },
        --settler Information
        {
            type = "item",
            name = "settler_information",
            icon = "__base__/graphics/icons/signal/signal_S.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "a2",
            stack_size = 50
        },
        --Citizen Information
        {
            type = "item",
            name = "citizen_information",
            icon = "__base__/graphics/icons/signal/signal_C.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "a3",
            stack_size = 50
        },
        --unobtainable_dummy
        {
            type = "item",
            name = "unobtainable_dummy",
            icon = "__base__/graphics/icons/signal/signal_D.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 50,
            flags = {"hidden"}
        }
    }
)
