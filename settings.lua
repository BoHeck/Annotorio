data:extend(
    {
        {
            type = "double-setting",
            name = "night_brightness_setting",
            setting_type = "runtime-global",
            default_value = 0.5,
            minimum_value = 0,
            maximum_value = 1
        },
        {
            type = "double-setting",
            name = "tax_multiplier",
            setting_type = "runtime-global",
            default_value = 2,
            minimum_value = 1
        },
        {
            type = "bool-setting",
            name = "debug_mode",
            setting_type = "startup",
            default_value = false
        },
        {
            type = "bool-setting",
            name = "kontors_function_like_markets",
            setting_type = "runtime-global",
            default_value = false
        },
        {
            type = "int-setting",
            name = "do_not_send_more_resources_after_limit",
            setting_type = "runtime-global",
            default_value = -1
        }
    }
)
