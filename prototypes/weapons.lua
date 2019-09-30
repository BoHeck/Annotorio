require("prototypes.weapons.bow")
require("prototypes.weapons.musket")
require("prototypes.weapons.blunderbuss")
require("prototypes.weapons.armor")

data:extend(
    {
        {
            type = "ammo",
            name = "cannon_ball",
            icon = "__Annotorio__/graphics/icons/cannon_ball_icon.png",
            icon_size = 64,
            ammo_type = {
                category = "cannon-shell",
                target_type = "direction",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = "explosive-cannon-projectile",
                        starting_speed = 0.85,
                        direction_deviation = 0.15,
                        range_deviation = 0.2,
                        max_range = 36,
                        min_range = 5,
                        source_effects = {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        }
                    }
                }
            },
            subgroup = "ammo",
            order = "d[cannon-shell]-c[explosive]",
            stack_size = 200
        },
        {
            type = "recipe",
            name = "cannon_ball",
            enabled = true,
            hidden = false,
            category = "blacksmith",
            energy_required = 4,
            result = "cannon_ball",
            ingredients = {
                {"gun_powder", 1},
                {"iron-plate", 2}
            }
        }
    }
)
