data:extend(
    {
        {
            type = "ammo-category",
            name = "anno_arrow"
        },
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
        -- bow recipe
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
        -- sloop weapon
        {
            type = "gun",
            name = "sloop_bow",
            icon = "__Annotorio__/graphics/icons/bow_icon.png",
            icon_size = 64,
            subgroup = "gun",
            order = "a",
            attack_parameters = {
                type = "projectile",
                ammo_category = "anno_arrow",
                cooldown = 25,
                projectile_creation_distance = 0.825,
                range = 29.3,
                min_range = 1,
                sound = {
                    {
                        filename = "__Annotorio__/sound/fire_bow_sound-mike-koenig.wav",
                        volume = 0.5
                    }
                }
            },
            stack_size = 25
        },
        -- bow item
        {
            type = "gun",
            name = "bow",
            icon = "__Annotorio__/graphics/icons/bow_icon.png",
            icon_size = 64,
            subgroup = "gun",
            order = "a",
            attack_parameters = {
                type = "projectile",
                ammo_category = "anno_arrow",
                cooldown = 75,
                movement_slow_down_factor = 0.33,
                projectile_creation_distance = 0.825,
                range = 26.3,
                min_range = 1,
                sound = {
                    {
                        filename = "__Annotorio__/sound/fire_bow_sound-mike-koenig.wav",
                        volume = 0.5
                    }
                }
            },
            stack_size = 25
        },
        -- anno_arrow item
        {
            type = "ammo",
            name = "anno_arrow",
            icon = "__Annotorio__/graphics/icons/anno_arrow_icon.png",
            icon_size = 64,
            ammo_type = {
                category = "anno_arrow",
                target_type = "direction",
                clamp_position = true,
                action = {
                    {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "anno_arrow",
                            starting_speed = 0.75,
                            direction_deviation = 0.15,
                            range_deviation = 0.2,
                            max_range = 26.3
                        }
                    }
                }
            },
            magazine_size = 10,
            subgroup = "ammo",
            order = "b[ammo]-a[anno_arrow]",
            stack_size = 200
        },
        {
            type = "projectile",
            name = "anno_arrow",
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
                        damage = {amount = 50, type = "physical"}
                    }
                }
            },
            animation = {
                filename = "__Annotorio__/graphics/projectile/anno_arrow_projectile.png",
                frame_count = 1,
                width = 9,
                height = 64,
                priority = "high",
                scale = 0.5
            }
        }
    }
)
