data:extend(
    {
        {
            type = "ammo-category",
            name = "blunderbuss"
        },
        {
            type = "gun",
            name = "blunderbuss",
            icon = "__Annotorio__/graphics/icons/blunderbuss_icon.png",
            icon_size = 64,
            subgroup = "gun",
            order = "b",
            attack_parameters = {
                type = "projectile",
                ammo_category = "blunderbuss",
                cooldown = 150,
                movement_slow_down_factor = 0.1,
                --  damage_modifier = 1.2,
                projectile_creation_distance = 0.825,
                range = 20,
                sound = {
                    {
                        filename = "__Annotorio__/sound/SE_Shot_Gun.wav",
                        volume = 0.5
                    }
                }
            },
            stack_size = 25
        },
        {
            type = "recipe",
            name = "blunderbuss",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "blunderbuss",
            ingredients = {
                {"musket", 1}
            }
        },
        {
            type = "recipe",
            name = "blunderbuss_shot",
            enabled = true,
            hidden = false,
            energy_required = 1,
            result = "blunderbuss_shot",
            ingredients = {
                {"musket_ball", 1}
            }
        },
        {
            type = "ammo",
            name = "blunderbuss_shot",
            icon = "__Annotorio__/graphics/icons/blunderbuss_shot_icon.png",
            icon_size = 64,
            ammo_type = {
                category = "blunderbuss",
                target_type = "direction",
                clamp_position = true,
                action = {
                    {
                        type = "direct",
                        action_delivery = {
                            type = "instant",
                            source_effects = {
                                {
                                    type = "create-explosion",
                                    entity_name = "explosion-gunshot"
                                }
                            }
                        }
                    },
                    {
                        type = "direct",
                        repeat_count = 24,
                        action_delivery = {
                            type = "projectile",
                            projectile = "blunderbuss_shot",
                            starting_speed = 1.1,
                            direction_deviation = 0.35,
                            range_deviation = 0.35,
                            max_range = 20
                        }
                    }
                }
            },
            magazine_size = 4,
            subgroup = "ammo",
            order = "b[ammo]-b[blunderbuss_shot]",
            stack_size = 200
        },
        {
            type = "projectile",
            name = "blunderbuss_shot",
            flags = {"not-on-map"},
            force_condition = "not-same",
            collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
            acceleration = 0,
            direction_only = true,
            action = {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        type = "damage",
                        damage = {amount = 10, type = "physical"}
                    }
                }
            },
            animation = {
                filename = "__base__/graphics/entity/bullet/bullet.png",
                frame_count = 1,
                width = 3,
                height = 50,
                priority = "high"
            }
        }
    }
)
