data:extend(
    {
        {
            type = "technology",
            name = "settle_island",
            icon = "__Annotorio__/graphics/icons/kontor_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "house_pioneer"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fishers_hut"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fishing_boat"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fishing_route"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fishing"
                },
                {
                    type = "unlock-recipe",
                    recipe = "pioneer_needs"
                },
                {
                    type = "unlock-recipe",
                    recipe = "buy_anno_tool"
                }
            },
            unit = {
                count = 1,
                ingredients = {{"settle_island", 1}},
                time = 1
            },
            order = "0001"
        },
        {
            type = "technology",
            name = "feed_your_people",
            icon = "__Annotorio__/graphics/icons/anno_fish_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "anno_wooden_belt"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_inserter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_filter_inserter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "woodcutter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "tree_trunk_to_wood"
                },
                {
                    type = "unlock-recipe",
                    recipe = "tree_planter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "young_tree"
                }
            },
            unit = {
                count = 8,
                ingredients = {{"feed_your_people", 1}},
                time = 1
            },
            order = "0002"
        },
        {
            type = "technology",
            name = "grow_1",
            icon = "__Annotorio__/graphics/icons/house_pioneer_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "anno_wooden_underground_belt"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_wodden_splitter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "chapel"
                },
                {
                    type = "unlock-recipe",
                    recipe = "weaver"
                },
                {
                    type = "unlock-recipe",
                    recipe = "weaving"
                },
                {
                    type = "unlock-recipe",
                    recipe = "sheep_farm"
                },
                {
                    type = "unlock-recipe",
                    recipe = "sheep_wool"
                },
                {
                    type = "unlock-recipe",
                    recipe = "marketplace_dummy"
                }
            },
            unit = {
                count = 20,
                ingredients = {{"grow_1", 1}},
                time = 1
            },
            order = "0003"
        },
        {
            type = "technology",
            name = "dress_your_people_1",
            icon = "__Annotorio__/graphics/icons/cloth_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "clay_pit_dummy"
                },
                {
                    type = "unlock-recipe",
                    recipe = "clay"
                },
                {
                    type = "unlock-recipe",
                    recipe = "kiln"
                },
                {
                    type = "unlock-recipe",
                    recipe = "ceramics_1"
                }
            },
            unit = {
                count = 18,
                ingredients = {{"dress_your_people_1", 1}},
                time = 1
            },
            order = "0004"
        },
        {
            type = "technology",
            name = "upgrade_your_kontor_1",
            icon = "__Annotorio__/graphics/icons/kontor_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "house_settler"
                },
                {
                    type = "unlock-recipe",
                    recipe = "settler_needs"
                },
                {
                    type = "unlock-recipe",
                    recipe = "press"
                },
                {
                    type = "unlock-recipe",
                    recipe = "press_cider"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_long_inserter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "apple_orchard_dummy"
                },
                {
                    type = "unlock-recipe",
                    recipe = "grow_apples"
                },
                {
                    type = "unlock-recipe",
                    recipe = "tavern"
                }
            },
            unit = {
                count = 1,
                ingredients = {{"upgrade_your_kontor_1", 1}},
                time = 1
            },
            order = "0005"
        },
        {
            type = "technology",
            name = "drink_for_the_people_1",
            icon = "__Annotorio__/graphics/icons/cider_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "mine_dummy"
                },
                {
                    type = "unlock-recipe",
                    recipe = "coal_mining"
                },
                {
                    type = "unlock-recipe",
                    recipe = "iron_mining"
                },
                {
                    type = "unlock-recipe",
                    recipe = "copper_mining"
                },
                {
                    type = "unlock-recipe",
                    recipe = "ceramics_2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_iron_1"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_iron_2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_copper_1"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_copper_2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "copperwares"
                },
                {
                    type = "unlock-recipe",
                    recipe = "smelter"
                },
                {
                    type = "unlock-recipe",
                    recipe = "blacksmith"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_tool"
                },
                {
                    type = "unlock-recipe",
                    recipe = "bow"
                },
                {
                    type = "unlock-recipe",
                    recipe = "anno_arrow"
                }
            },
            unit = {
                count = 22,
                ingredients = {{"drink_for_the_people_1", 1}},
                time = 1
            },
            order = "0006"
        },
        {
            type = "technology",
            name = "provide_luxus_1",
            icon = "__Annotorio__/graphics/icons/copperwares_icon.png",
            icon_size = 64,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "kontor"
                },
                {
                    type = "unlock-recipe",
                    recipe = "distillery"
                },
                {
                    type = "unlock-recipe",
                    recipe = "distil_rum"
                },
                {
                    type = "unlock-recipe",
                    recipe = "sugar_cane_plantation_dummy"
                },
                {
                    type = "unlock-recipe",
                    recipe = "grow_sugar_cane"
                },
                {
                    type = "unlock-recipe",
                    recipe = "wood_barrel"
                },
                {
                    type = "unlock-recipe",
                    recipe = "press_sugar_cane"
                }
            },
            unit = {
                count = 26,
                ingredients = {{"provide_luxus_1", 1}},
                time = 1
            },
            order = "0007"
        }
    }
)
--[[
{
    --blacksmith,
    --wood_barrel,
    --anno_tool,
    --copperwares,
    --anno_arrow,
    --bow,
    ----------------------
    --weaver,
    --weaving,
    ---------------------
    --anno_wooden_belt,
    --anno_wooden_underground_belt,
    --anno_wodden_splitter,
    ---------------------
    --tavern,
    --chapel,
    ----------------
    --smelter,
    --anno_iron_1,
    --anno_iron_2,
    --anno_copper_1,
    --anno_copper_2,
    ------------------
    --sheep_farm,
    --sheep_wool,
    --------------------
    --apple_orchard_dummy,
    --grow_apples,
    --sugar_cane_plantation_dummy,
    --grow_sugar_cane,
    --------------------
    --mine_dummy,
    --coal_mining,
    --iron_mining,
    --copper_mining,
    ---------------------
    --marketplace_dummy,
    --kontor,
    -------------------------
    --kiln,
    --ceramics_1,
    --ceramics_2,
    --------------------------
    --clay_pit_dummy,
    --clay,
    --------------------
    -- anno_inserter,
    --anno_filter_inserter,
    --anno_long_inserter,
    --------------------------
    --house_pioneer,
    --house_settler,
    house_citizen,
    --pioneer_needs,
    --settler_needs,
    citizen_needs
    --------------------------------
    --distillery,
    --distil_rum
    ------------------------------
    --press_cider,
    -------------------------------
    --woodcutter,
    --tree_trunk_to_wood,
    ---------------------------
    -- tree_planter,
    --young_tree,
    -------------------------
    --fishers_hut,
    --fishing_boat,
    --fishing_route,
    --fishing,
    --------------------------
    --buy_anno_tool,
}
--]]
