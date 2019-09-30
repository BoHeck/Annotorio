data:extend(
    {
        {
            type = "armor",
            name = "gambeson",
            icon = "__Annotorio__/graphics/icons/gambeson_icon.png",
            icon_size = 64,
            resistances = {
                {
                    type = "physical",
                    decrease = 6,
                    percent = 30
                },
                {
                    type = "explosion",
                    decrease = 20,
                    percent = 30
                },
                {
                    type = "acid",
                    decrease = 0,
                    percent = 40
                },
                {
                    type = "fire",
                    decrease = 0,
                    percent = 30
                }
            },
            subgroup = "armor",
            order = "a[gambeson]",
            stack_size = 1,
            infinite = true,
            --equipment_grid = "small-equipment-grid",
            inventory_size_bonus = 5
        },
        {
            type = "recipe",
            name = "gambeson",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "gambeson",
            ingredients = {
                {"cloth", 5}
            }
        },
        {
            type = "armor",
            name = "chainmail",
            icon = "__Annotorio__/graphics/icons/chainmail_icon.png",
            icon_size = 64,
            resistances = {
                {
                    type = "physical",
                    decrease = 7,
                    percent = 35
                },
                {
                    type = "acid",
                    decrease = 0,
                    percent = 50
                },
                {
                    type = "explosion",
                    decrease = 30,
                    percent = 35
                },
                {
                    type = "fire",
                    decrease = 0,
                    percent = 40
                }
            },
            subgroup = "armor",
            order = "b[chainmail]",
            stack_size = 1,
            infinite = true,
            --equipment_grid = "small-equipment-grid",
            inventory_size_bonus = 10
        },
        {
            type = "recipe",
            name = "chainmail",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "chainmail",
            ingredients = {
                {"iron-plate", 8},
                {"anno_tool", 4},
                {"gambeson", 1}
            }
        },
        {
            type = "armor",
            name = "plate_armor",
            icon = "__Annotorio__/graphics/icons/plate_armor_icon.png",
            icon_size = 64,
            resistances = {
                {
                    type = "physical",
                    decrease = 8,
                    percent = 40
                  },
                  {
                    type = "acid",
                    decrease = 0,
                    percent = 60
                  },
                  {
                    type = "explosion",
                    decrease = 40,
                    percent = 40
                  },
                  {
                    type = "fire",
                    decrease = 0,
                    percent = 60
                  }
            },
            subgroup = "armor",
            order = "c[plate_armor]",
            stack_size = 1,
            infinite = true,
            --equipment_grid = "small-equipment-grid",
            inventory_size_bonus = 15
        },
        {
            type = "recipe",
            name = "plate_armor",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "plate_armor",
            ingredients = {
                {"steel-plate", 10},
                {"anno_tool", 5},
                {"chainmail", 1}
            }
        }
    }
)
