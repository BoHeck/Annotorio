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

        ----------------------- Item Recipes -------------------------
        -- Recipe category for most buildings that can only produce one thing
        {
            type = "recipe-category",
            name = "predetermined"
        },
        {
            type = "recipe",
            name = "anno_repair_kit",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "repair-pack",
            ingredients = {
                {"wood", 1},
                {"ceramics", 1},
                {"anno_tool", 1}
            }
        },
        {
            type = "recipe",
            name = "powder_keg",
            enabled = true,
            hidden = false,
            --category = "blacksmith",
            energy_required = 4,
            result = "powder_keg",
            ingredients = {
                {"gun_powder", 10},
                {"wood_barrel", 1}
            }
        },
        

        ------------- Weapons ----------------

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
        {
            type = "recipe",
            name = "buy_anno_arrow",
            subgroup = "trade_buy",
            enabled = true,
            hidden = false,
            energy_required = 12,
            category = "trade",
            result = "anno_arrow",
            ingredients = {}
        },
        {
            type = "recipe",
            name = "buy_bow",
            subgroup = "trade_buy",
            enabled = true,
            hidden = false,
            energy_required = 9,
            category = "trade",
            result = "bow",
            ingredients = {}
        },
        {
            type = "recipe",
            name = "buy_gun_powder",
            subgroup = "trade_buy",
            enabled = true,
            hidden = false,
            energy_required = 14,
            category = "trade",
            result = "gun_powder",
            ingredients = {}
        },
        


        ------------- Special -------------
        --Category for the various citizen needs
        {
            type = "recipe-category",
            name = "people_needs"
        },
        {
            type = "recipe-category",
            name = "people_needs2"
        },
        {
            type = "recipe-category",
            name = "people_needs3"
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
            category = "people_needs2",
            ingredients = {
                {"anno_fish", 1},
                {"cloth", 1},
                {"cider", 1},
                {"copperwares", 1},
                {"bacon_omelet", 1},
                {"barreled_rum", 1},
                {"preventingCraftToGoForwardDummy", 1}
            },
            result = "settler_information",
            energy_required = 1,
            enabled = true,
            hidden = false,
            allow_as_intermediate = false
        },
        --citizen_needs
        {
            type = "recipe",
            name = "citizen_needs",
            subgroup = "people_needs",
            category = "people_needs3",
            ingredients = {
                {"anno_fish", 1},
                {"cloth", 1},
                {"cider", 1},
                {"copperwares", 1},
                {"bacon_omelet", 1},
                {"barreled_rum", 1},
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
