data:extend(
    {
        --  adventurers_guild item
        {
            type = "item",
            name = "adventurers_guild",
            icon = "__Annotorio__/graphics/icons/adventurers_guild_icon.png",
            icon_size = 64,
            subgroup = "administration",
            order = "g",
            place_result = "adventurers_guild",
            stack_size = 25
        },
        -- adventurers_guild recipe
        {
            type = "recipe",
            name = "adventurers_guild",
            enabled = true,
            energy_required = 0.1,
            ingredients = {
                {"wood", 64},
                {"ceramics", 120},
                {"anno_tool", 36}
            },
            result = "adventurers_guild"
        },
        --adventurers_guild entity
        {
            type = "electric-energy-interface",
            name = "adventurers_guild",
            placeable_by = {item = "adventurers_guild", count = 1},
            icon = "__Annotorio__/graphics/icons/adventurers_guild_icon.png",
            icon_size = 64,
            flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
            minable = {mining_time = 0.2, result = "adventurers_guild"},
            max_health = 900,
            collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
            selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
            corpse = "big-remnants",
            dying_explosion = "massive-explosion",
            energy_source = {
                type = "electric",
                usage_priority = "primary-input",
                drain = "0kW",
                buffer_capacity = "1kJ",
                input_flow_limit = "1kJ"
            },
            pictures = {
                layers = {
                    {
                        filename = "__Annotorio__/graphics/entity/adventurers_guild.png",
                        priority = "extra-high",
                        width = 408,
                        height = 457,
                        scale = 0.5,
                        shift = util.by_pixel(6, -4)
                    },
                    {
                        filename = "__Annotorio__/graphics/entity/adventurers_guild_s.png",
                        priority = "extra-high",
                        width = 408,
                        height = 457,
                        scale = 0.5,
                        shift = util.by_pixel(6, -4),
                        draw_as_shadow = true
                    }
                }
            },
            vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.8},
            energy_usage = "0kW"
        }
    }
)
