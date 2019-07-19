-------List of all entries-------

-------Buldings----------
--Apple Orchard --TODO
--Cotton Plantation --TODO
--Marketplace
--House1
--House2
--House3

-------Ingredients--------
--Tool
--Bricks
--Apple

-------Consumables--------
--copperwares
--cider
--cloth

data:extend(
    {
        -------Buldings----------

        --Clay Pit
        {
            type = "item",
            name = "clay_pit_dummy",
            icon = "__Annotorio__/graphics/icons/clay_pit_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-f[clay_pit]",
            place_result = "clay_pit_dummy",
            stack_size = 25
        },
        --Fishing Boat (is a building)
        {
            type = "item",
            name = "fishing_boat",
            icon = "__Annotorio__/graphics/icons/fishing_boat_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-f[fishing_boat]",
            place_result = "fishing_boat",
            stack_size = 25
        },
        --Fishing Route aka fish pipe
        {
            type = "item",
            name = "fishing_route",
            icon = "__Annotorio__/graphics/icons/fishing_route_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-f[fishing_route]",
            place_result = "fishing_route",
            stack_size = 50
        },
        --fishers hut
        {
            type = "item",
            name = "fishers_hut",
            icon = "__Annotorio__/graphics/icons/fishers_hut_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-f[fishers_hut]",
            place_result = "fishers_hut",
            stack_size = 25
        },
        --Marketplace
        {
            type = "item",
            name = "marketplace_dummy",
            icon = "__Annotorio__/graphics/icons/marketplace_icon.png",
            icon_size = 64,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[marketplace]",
            place_result = "marketplace_dummy",
            stack_size = 25
        },
        --Kontor
        {
            type = "item",
            name = "kontor",
            icon = "__Annotorio__/graphics/icons/kontor_icon.png",
            icon_size = 64,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[kontor]",
            place_result = "kontor",
            stack_size = 25
        },
        --House1
        {
            type = "item",
            name = "house_pioneer",
            icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
            icon_size = 64,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[house1]",
            place_result = "house_pioneer",
            stack_size = 25
        },
        --House2
        {
            type = "item",
            name = "house_settler",
            icon = "__Annotorio__/graphics/icons/house_settler_icon.png",
            icon_size = 64,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[house2]",
            place_result = "house_settler",
            stack_size = 25
        },
        --House3
        {
            type = "item",
            name = "house_citizen",
            icon = "__Annotorio__/graphics/icons/house_citizen_icon.png",
            icon_size = 64,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[house3]",
            place_result = "house_citizen",
            stack_size = 25
        },
        --Woodcutter
        {
            type = "item",
            name = "woodcutter",
            icon = "__Annotorio__/graphics/icons/woodcutter_icon.png",
            icon_size = 64,
            order = "b[building]-r[woodcutter]",
            place_result = "woodcutter",
            stack_size = 25,
            subgroup = "extraction-machine"
        },
        --wooden belt
        {
            type = "item",
            name = "anno_wooden_belt",
            icon = "__base__/graphics/icons/transport-belt.png",
            icon_size = 32,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[anno_wooden_belt]",
            place_result = "anno_wooden_belt",
            stack_size = 100
        },
        --anno_wooden_underground_belt
        {
            type = "item",
            name = "anno_wooden_underground_belt",
            icon = "__base__/graphics/icons/underground-belt.png",
            icon_size = 32,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[anno_wooden_underground_belt]",
            place_result = "anno_wooden_underground_belt",
            stack_size = 100
        },
        --anno_wodden_splitter
        {
            type = "item",
            name = "anno_wodden_splitter",
            icon = "__base__/graphics/icons/splitter.png",
            icon_size = 32,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[anno_wodden_splitter]",
            place_result = "anno_wodden_splitter",
            stack_size = 100
        },
        --inserter
        {
            type = "item",
            name = "anno_inserter",
            icon = "__base__/graphics/icons/inserter.png",
            icon_size = 32,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[anno_inserter]",
            place_result = "anno_inserter",
            stack_size = 50
        },
        --inserter
        {
            type = "item",
            name = "anno_filter_inserter",
            icon = "__base__/graphics/icons/filter-inserter.png",
            icon_size = 32,
            subgroup = "energy-pipe-distribution",
            order = "b[building]-h[anno_filter_inserter]",
            place_result = "anno_filter_inserter",
            stack_size = 50
        },
        -- tree planter
        {
            type = "item",
            name = "tree_planter",
            icon = "__Annotorio__/graphics/icons/tree_planter_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[tree_planter]",
            place_result = "tree_planter",
            stack_size = 25
        },
        --young tree
        {
            type = "item",
            name = "young_tree",
            icon = "__Annotorio__/graphics/icons/young_tree_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "f[young_tree]",
            place_result = "young_tree",
            stack_size = 100
        },
        -- sheep farm
        {
            type = "item",
            name = "sheep_farm",
            icon = "__Annotorio__/graphics/icons/sheep_farm_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[sheep_farm]",
            place_result = "sheep_farm",
            stack_size = 25
        },
        --  weaver
        {
            type = "item",
            name = "weaver",
            icon = "__Annotorio__/graphics/icons/weaver_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[weaver]",
            place_result = "weaver",
            stack_size = 25
        },
        --  blacksmith
        {
            type = "item",
            name = "blacksmith",
            icon = "__Annotorio__/graphics/icons/blacksmith_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[blacksmith]",
            place_result = "blacksmith",
            stack_size = 25
        },
        --  distillery
        {
            type = "item",
            name = "distillery",
            icon = "__Annotorio__/graphics/icons/distillery_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[distillery]",
            place_result = "distillery",
            stack_size = 25
        },
        --  mine dummy
        {
            type = "item",
            name = "mine_dummy",
            icon = "__Annotorio__/graphics/icons/mine_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[mine]",
            place_result = "mine_dummy",
            stack_size = 25
        },
        --  apple_orchard_dummy
        {
            type = "item",
            name = "apple_orchard_dummy",
            icon = "__Annotorio__/graphics/icons/apple_orchard_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[apple_orchard]",
            place_result = "apple_orchard_dummy",
            stack_size = 25
        },
        --  apple_orchard_dummy
        {
            type = "item",
            name = "smelter",
            icon = "__Annotorio__/graphics/icons/smelter_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[smelter]",
            place_result = "smelter",
            stack_size = 25
        },
        --  distillery
        {
            type = "item",
            name = "kiln",
            icon = "__Annotorio__/graphics/icons/kiln_icon.png",
            icon_size = 64,
            subgroup = "extraction-machine",
            order = "b[building]-r[kiln]",
            place_result = "kiln",
            stack_size = 25
        },
        -------Ingredients--------
        -- seedling
        {
            type = "item",
            name = "seedling",
            icon = "__Annotorio__/graphics/icons/seedling_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "f[seedling]",
            stack_size = 50
        },
        --Tool
        {
            type = "item",
            name = "anno_tool",
            icon = "__Annotorio__/graphics/icons/anno_tool_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "a[anno_tool]",
            stack_size = 50
        },
        --clay
        {
            type = "item",
            name = "clay",
            icon = "__Annotorio__/graphics/icons/clay_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "f[clay]",
            stack_size = 50
        },
        --Bricks
        {
            type = "item",
            name = "ceramics",
            icon = "__Annotorio__/graphics/icons/ceramics_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "a[bricks]",
            stack_size = 50
        },
        --Apple
        {
            type = "item",
            name = "apple",
            icon = "__Annotorio__/graphics/icons/apple_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "f[apple]",
            stack_size = 50
        },
        --Tree Trunk
        {
            type = "item",
            name = "tree_trunk",
            icon = "__base__/graphics/icons/tree-03.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "f[tree_trunk]",
            stack_size = 50
        },
        --Wool
        {
            type = "item",
            name = "wool",
            icon = "__Annotorio__/graphics/icons/wool_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "f[wool]",
            stack_size = 50
        },
        --wood_barrel
        {
            type = "item",
            name = "wood_barrel",
            icon = "__Annotorio__/graphics/icons/wood_barrel_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "f[wood_barrel]",
            stack_size = 50
        },
        -------Consumables--------
        --copperwares
        {
            type = "tool",
            name = "copperwares",
            icon = "__Annotorio__/graphics/icons/copperwares_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "d[copperwares]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --cider
        {
            type = "tool",
            name = "cider",
            icon = "__Annotorio__/graphics/icons/cider_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "d[cider]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --cloth
        {
            type = "tool",
            name = "cloth",
            icon = "__Annotorio__/graphics/icons/cloth_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "d[cloth]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        --anno Fish
        {
            type = "tool",
            name = "anno_fish",
            icon = "__Annotorio__/graphics/icons/anno_fish_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "d[fish]",
            stack_size = 50,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        -----------Special-------------

        --inventory_placeholder
        {
            type = "item",
            name = "inventory_placeholder",
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
            order = "x",
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
            order = "x",
            stack_size = 50
        },
        --settler Information
        {
            type = "item",
            name = "settler_information",
            icon = "__base__/graphics/icons/signal/signal_S.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 50
        },
        --Citizen Information
        {
            type = "item",
            name = "citizen_information",
            icon = "__base__/graphics/icons/signal/signal_C.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 50
        },
        --cold_climate_fertile_soil
        {
            type = "item",
            name = "cold_climate_fertile_soil",
            icon = "__Annotorio__/graphics/icons/cold_climate_fertile_soil_icon.png",
            icon_size = 64,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 50
        },
        --warm_climate_fertile_soil
        {
            type = "item",
            name = "warm_climate_fertile_soil",
            icon = "__Annotorio__/graphics/icons/warm_climate_fertile_soil_icon.png",
            icon_size = 32,
            subgroup = "raw-resource",
            order = "x",
            stack_size = 64
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
