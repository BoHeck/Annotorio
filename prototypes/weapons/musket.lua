data:extend(
    {
        {
            type = "ammo-category",
            name = "musket_ball"
        },
        {
            type = "recipe",
            name = "musket",
            enabled = true,
            hidden = false,
            category = "blacksmith",
            energy_required = 9,
            result = "musket",
            ingredients = {
                {"steel-plate", 2},
                {"wood", 1},
                {"anno_tool", 1}
            }
        },
        {
            type = "recipe",
            name = "musket_ball",
            enabled = true,
            hidden = false,
            category = "blacksmith",
            energy_required = 4,
            result = "musket_ball",
            ingredients = {
                {"gun_powder", 1},
                {"iron-plate", 1}
            }
        },
        {
            type = "gun",
            name = "musket",
            icon = "__Annotorio__/graphics/icons/musket_icon.png",
            icon_size = 64,
            subgroup = "gun",
            order = "c",
            attack_parameters = {
                type = "projectile",
                ammo_category = "musket_ball",
                cooldown = 100,
                movement_slow_down_factor = 0.33,
                projectile_creation_distance = 0.825,
                range = 26.3,
                min_range = 1,
                sound = {
                    {
                        filename = "__Annotorio__/sound/44_Magnum.wav",
                        volume = 0.5
                    }
                }
            },
            stack_size = 25
        },
        {
            type = "ammo",
            name = "musket_ball",
            icon = "__Annotorio__/graphics/icons/musket_balls_icon.png",
            icon_size = 64,
            ammo_type = {
                category = "musket_ball",
                target_type = "direction",
                clamp_position = true,
                action = {
                    {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "musket_ball",
                            starting_speed = 1.5,
                            direction_deviation = 0.18,
                            range_deviation = 0.28,
                            max_range = 34
                        }
                    }
                }
            },
            magazine_size = 10,
            subgroup = "ammo",
            order = "b[ammo]-c[musket_ball]",
            stack_size = 200
        },
        {
            type = "projectile",
            name = "musket_ball",
            flags = {"not-on-map"},
            force_condition = "not-same",
            collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
            acceleration = 0,
            direction_only = true,
            piercing_damage = 249,
            action = {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        type = "damage",
                        damage = {amount = 250, type = "physical"}
                    }
                }
            },
            animation = {
                --filename = "__Annotorio__/graphics/projectile/musket_ball_projectile.png",

                filename = "__base__/graphics/entity/bullet/bullet.png",
                frame_count = 1,
                width = 3,
                height = 50,
                priority = "high"
            }
        }
    }
)
