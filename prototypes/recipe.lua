-------List of all entries-------
--Apple Orchard
--Cotton Plantation
--Marketplace

data:extend(
    {
        --a category with no associated recipes
        {
            type = "recipe-category",
            name = "none"
        },
        -- a category for things that exist in code but are not implemented fully
        {
            type = "recipe-category",
            name = "not_in_build"
        },
        -------------------- Building Recipes ---------------------
        --  Mine dummy
        {
            type = "recipe",
            name = "mine_dummy",
            ingredients = {
                {"wood", 14},
                {"anno_tool", 4}
            },
            result = "mine_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- Clay Pit dummy
        {
            type = "recipe",
            name = "clay_pit_dummy",
            ingredients = {
                {"wood", 8},
                {"anno_tool", 2}
            },
            result = "clay_pit_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- fishing boat
        {
            type = "recipe",
            name = "fishing_boat",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2},
                {"cloth", 4}
            },
            result = "fishing_boat",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- fishing route aka fish pipe
        {
            type = "recipe",
            name = "fishing_route",
            ingredients = {},
            result = "fishing_route",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- fishers hut
        {
            type = "recipe",
            name = "fishers_hut",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "fishers_hut",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        -- sheep farm
        {
            type = "recipe",
            name = "sheep_farm",
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "sheep_farm",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --  wooden belt
        {
            type = "recipe",
            name = "anno_wooden_belt",
            ingredients = {
                {"wood", 1}
            },
            results = {
                {"anno_wooden_belt", 1}
            },
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --  anno wooden underground belt
        {
            type = "recipe",
            name = "anno_wooden_underground_belt",
            ingredients = {
                {"wood", 8},
                {"anno_tool", 2}
            },
            results = {
                {"anno_wooden_underground_belt", 2}
            },
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --  anno_wodden_splitter
        {
            type = "recipe",
            name = "anno_wodden_splitter",
            ingredients = {
                {"wood", 4},
                {"anno_tool", 2}
            },
            results = {
                {"anno_wodden_splitter", 1}
            },
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
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
        -- filter inserter
        {
            type = "recipe",
            name = "anno_filter_inserter",
            ingredients = {
                {"wood", 4}
                -- {"anno_tool", 1}
            },
            result = "anno_filter_inserter",
            energy_required = 0.1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --Marketplace
        {
            type = "recipe",
            name = "marketplace_dummy",
            ingredients = {
                {"wood", 5},
                {"anno_tool", 3}
            },
            result = "marketplace_dummy",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --House 1
        {
            type = "recipe",
            name = "house_pioneer",
            ingredients = {
                {"wood", 6}
            },
            result = "house_pioneer",
            energy_required = 0.1,
            --3
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --House 2
        {
            type = "recipe",
            name = "house_settler",
            ingredients = {
                {"wood", 3},
                {"anno_tool", 2},
                {"house_pioneer", 1}
            },
            result = "house_settler",
            category = "not_in_build",
            energy_required = 0.1,
            --3
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --House 3
        {
            type = "recipe",
            name = "house_citizen",
            ingredients = {
                {"ceramics", 8},
                {"anno_tool", 5},
                {"house_settler", 1}
            },
            result = "house_citizen",
            category = "not_in_build",
            energy_required = 0.1,
            --3
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --Woodcutter
        {
            type = "recipe",
            name = "woodcutter",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 3},
                {"anno_tool", 2}
            },
            result = "woodcutter"
        },
        --Weaver
        {
            type = "recipe",
            name = "weaver",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 12},
                {"anno_tool", 3}
            },
            result = "weaver"
        },
        --Distillery
        {
            type = "recipe",
            name = "distillery",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 12},
                {"anno_tool", 3}
            },
            result = "distillery"
        },
        --Blacksmith
        {
            type = "recipe",
            name = "blacksmith",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 6},
                {"ceramics", 9},
                {"anno_tool", 3}
            },
            result = "blacksmith"
        },
        --Apple orchard dummy
        {
            type = "recipe",
            name = "apple_orchard_dummy",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 6},
                {"anno_tool", 2}
            },
            result = "apple_orchard_dummy"
        },
        --tree planter
        {
            type = "recipe",
            name = "tree_planter",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 3},
                {"anno_tool", 1}
            },
            result = "tree_planter"
        },
        --Smelter
        {
            type = "recipe",
            name = "smelter",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"ceramics", 9}
            },
            result = "smelter"
        },
        --kiln
        {
            type = "recipe",
            name = "kiln",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"clay", 9}
            },
            result = "kiln"
        },
        ----------------------- Item Recipes -------------------------
        -- Recipe category for most buildings that can only produce one thing
        {
            type = "recipe-category",
            name = "predetermined"
        },
        --Wood
        {
            type = "recipe",
            name = "tree_trunk_to_wood",
            enabled = true,
            hidden = false,
            energy_required = 4,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {
                {
                    type = "item",
                    name = "tree_trunk",
                    amount = 1
                }
            },
            icon = "__Annotorio__/graphics/icons/wood_icon.png",
            icon_size = 64,
            subgroup = "anno_raw",
            results = {
                {
                    type = "item",
                    name = "wood",
                    amount = 4
                },
                {
                    type = "item",
                    name = "seedling",
                    amount = 1
                }
            }
        },
        --young tree
        {
            type = "recipe",
            name = "young_tree",
            enabled = true,
            hidden = false,
            energy_required = 1,
            subgroup = "misc",
            category = "predetermined",
            ingredients = {
                {"seedling", 1}
            },
            result = "young_tree"
        },
        {
            type = "recipe-category",
            name = "kiln"
        },
        -- ceramics 1
        {
            type = "recipe",
            name = "ceramics_1",
            enabled = true,
            energy_required = 24,
            category = "kiln",
            ingredients = {
                {"clay", 12},
                {"wood", 2}
            },
            results = {
                {"ceramics", 6}
            }
        },
        -- ceramics 2
        {
            type = "recipe",
            name = "ceramics_2",
            enabled = true,
            energy_required = 24,
            category = "kiln",
            ingredients = {
                {"clay", 12},
                {"coal", 2}
            },
            results = {
                {"ceramics", 6}
            }
        },
        --grow Aplles
        {
            type = "recipe",
            name = "grow_apples",
            enabled = true,
            hidden = false,
            energy_required = 2.5,
            category = "predetermined",
            ingredients = {},
            result = "apple"
        },
        --clay
        {
            type = "recipe",
            name = "clay",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "clay"
        },
        --iron mining
        {
            type = "recipe",
            name = "iron_mining",
            enabled = true,
            hidden = false,
            energy_required = 3.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "iron-ore"
        },
        --copper mining
        {
            type = "recipe",
            name = "copper_mining",
            enabled = true,
            hidden = false,
            energy_required = 3.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "copper-ore"
        },
        --copperwares
        {
            type = "recipe",
            name = "copperwares",
            enabled = true,
            energy_required = 6,
            subgroup = "blacksmith",
            category = "blacksmith",
            ingredients = {
                {"copper-plate", 2},
                {"anno_tool", 1}
            },
            results = {{"copperwares", 2}}
        },
        --coal mining
        {
            type = "recipe",
            name = "coal_mining",
            enabled = true,
            hidden = false,
            energy_required = 0.75,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "coal"
        },
        --Fish
        {
            type = "recipe",
            name = "fishing",
            enabled = true,
            hidden = false,
            energy_required = 4,
            category = "predetermined",
            ingredients = {
                {
                    type = "fluid",
                    name = "fish_fluid",
                    amount = 80
                }
            },
            result = "anno_fish"
        },
        --Wool
        {
            type = "recipe",
            name = "sheep_wool",
            enabled = true,
            hidden = false,
            energy_required = 4,
            subgroup = "anno_raw",
            category = "predetermined",
            ingredients = {},
            result = "wool"
        },
        --weaving
        {
            type = "recipe",
            name = "weaving",
            enabled = true,
            hidden = false,
            energy_required = 2,
            category = "predetermined",
            ingredients = {{"wool", 3}},
            result = "cloth"
        },
        --Tools
        {
            type = "recipe",
            name = "anno_tool",
            ingredients = {
                {"wood", 1},
                {"iron-plate", 1}
            },
            result = "anno_tool",
            energy_required = 2,
            subgroup = "blacksmith",
            category = "blacksmith",
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        {
            type = "recipe-category",
            name = "distillery"
        },
        --Cider pressing
        {
            type = "recipe",
            name = "barrel_cider",
            enabled = true,
            hidden = false,
            energy_required = 4,
            category = "distillery",
            ingredients = {
                {"apple", 4},
                {"ceramics", 1}
            },
            result = "cider"
        },
        {
            type = "recipe-category",
            name = "blacksmith"
        },
        --wood barrel
        {
            type = "recipe",
            name = "wood_barrel",
            enabled = true,
            hidden = false,
            energy_required = 2,
            subgroup = "blacksmith",
            category = "blacksmith",
            ingredients = {
                {"wood", 2},
                {"iron-plate", 1}
            },
            result = "wood_barrel",
            allow_as_intermediate = true
        },
        {
            type = "recipe-category",
            name = "smelter"
        },
        -- iron-plate 1
        {
            type = "recipe",
            name = "anno_iron_1",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"wood", 1},
                {"iron-ore", 2}
            },
            result = "iron-plate",
            allow_as_intermediate = true
        },
        -- iron-plate 2
        {
            type = "recipe",
            name = "anno_iron_2",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"coal", 1},
                {"iron-ore", 2}
            },
            result = "iron-plate",
            allow_as_intermediate = true
        },
        -- copper-plate 1
        {
            type = "recipe",
            name = "anno_copper_1",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"wood", 1},
                {"copper-ore", 2}
            },
            result = "copper-plate",
            allow_as_intermediate = true
        },
        -- copper-plate 2
        {
            type = "recipe",
            name = "anno_copper_2",
            enabled = true,
            hidden = false,
            energy_required = 3,
            subgroup = "smelter",
            category = "smelter",
            ingredients = {
                {"coal", 1},
                {"copper-ore", 2}
            },
            result = "copper-plate",
            allow_as_intermediate = true
        },
        ------------- Weapons ----------------
        -- anno_arrow
        {
            type = "recipe",
            name = "anno_arrow",
            enabled = true,
            energy_required = 3,
            category = "blacksmith",
            ingredients = {
                {"wood", 2},
                {"iron-plate", 1}
            },
            result = "anno_arrow",
            allow_as_intermediate = true
        },
        -- bow
        {
            type = "recipe",
            name = "bow",
            enabled = true,
            energy_required = 6,
            category = "blacksmith",
            ingredients = {
                {"wood", 1}
            },
            result = "bow",
            allow_as_intermediate = true
        },
        ------------- Trade --------------
        --Currently the Kontor uses 50g per sec. The time a product takes needs to be adjusted to create a fair price
        {
            type = "recipe-category",
            name = "trade"
        },
        {
            type = "recipe",
            name = "buy_anno_tool",
            subgroup = "trade_buy",
            enabled = true,
            hidden = false,
            energy_required = 8,
            category = "trade",
            result = "anno_tool",
            ingredients = {}
        },
        ------------- Special -------------
        --Category for the various citizen needs
        {
            type = "recipe-category",
            name = "people_needs"
        },
        --pioneer_needs
        {
            type = "recipe",
            name = "pioneer_needs",
            subgroup = "people_needs",
            category = "people_needs",
            ingredients = {
                {"cider", 1},
                {"cloth", 1},
                {"anno_fish", 1},
                {"preventingCraftToGoForwardDummy", 1}
            },
            result = "pioneer_information",
            energy_required = 1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        },
        --settler_needs
        {
            type = "recipe",
            name = "settler_needs",
            subgroup = "people_needs",
            category = "people_needs",
            ingredients = {
                {"anno_fish", 1},
                {"cloth", 1},
                {"cider", 1},
                {"preventingCraftToGoForwardDummy", 1}
            },
            result = "settler_information",
            energy_required = 1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        },
        --pioneer_needs
        {
            type = "recipe",
            name = "citizen_needs",
            subgroup = "people_needs",
            category = "people_needs",
            ingredients = {
                {"anno_fish", 1},
                {"cloth", 1},
                {"cider", 1},
                {"preventingCraftToGoForwardDummy", 1}
            },
            result = "citizen_information",
            energy_required = 1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        }
    }
)
