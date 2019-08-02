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
