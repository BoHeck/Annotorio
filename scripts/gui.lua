---------include these in the event collection-----------
--function refresh_gui_on_every_x_ticks()   script.on_nth_tick(everyXticks, refresh_gui_on_every_x_ticks)
-------------------------------------------------------

require("scripts.util")
require("scripts.shared_inventory")
require("scripts.fast_travel_gui")

local everyXticks = 12
local gold_count_text_color = {r = 255, g = 234, b = 79}

function create_gui_for_player(player)
    player.gui.left.clear()

    local flow =
        player.gui.left.add {
        type = "flow",
        name = "anno_gui",
        direction = "horizontal"
    }

    create_fast_travel_gui(player.index, flow)

    flow.add {
        type = "label",
        caption = "   ",
        name = "empty_gui_1",
        direction = "horizontal"
    }
    flow.add {
        type = "sprite",
        sprite = "gold_icon",
        name = "gold_sprite",
        direction = "horizontal"
    }
    flow.add {
        type = "label",
        caption = "Gold could not be read",
        name = "gold_count",
        direction = "horizontal"
    }
    flow.add {
        type = "sprite",
        sprite = "wood_icon",
        name = "wood_sprite",
        direction = "horizontal"
    }
    flow.add {
        type = "label",
        caption = "Wood could not be read",
        name = "wood_count",
        direction = "horizontal"
    }
    flow.add {
        type = "sprite",
        sprite = "tool_icon",
        name = "tool_sprite",
        direction = "horizontal"
    }
    flow.add {
        type = "label",
        caption = "tool could not be read",
        name = "tool_count",
        direction = "horizontal"
    }
    flow.add {
        type = "sprite",
        sprite = "burned_brick_icon",
        name = "brick_sprite",
        direction = "horizontal"
    }
    flow.add {
        type = "label",
        caption = "bricks could not be read",
        name = "brick_count",
        direction = "horizontal"
    }

    player.gui.left.anno_gui.gold_count.style.font_color = gold_count_text_color
    player.gui.left.anno_gui.wood_count.style.font_color = gold_count_text_color
    player.gui.left.anno_gui.tool_count.style.font_color = gold_count_text_color
    player.gui.left.anno_gui.brick_count.style.font_color = gold_count_text_color

    player.gui.left.anno_gui.gold_count.style.font = "default-large-bold"
    player.gui.left.anno_gui.wood_count.style.font = "default-large-bold"
    player.gui.left.anno_gui.tool_count.style.font = "default-large-bold"
    player.gui.left.anno_gui.brick_count.style.font = "default-large-bold"
end

function refresh_gui_on_every_x_ticks()
    local final_gold_count = math.floor(get_gold_count() / 1000)

    for _, player in pairs(game.players) do
        player.gui.left.anno_gui.fast_travel_gui.number = get_cooldown(player.index)

        player.gui.left.anno_gui.gold_count.caption = final_gold_count
        player.gui.left.anno_gui.wood_count.caption = global.banked_wood
        player.gui.left.anno_gui.tool_count.caption = global.banked_tool
        player.gui.left.anno_gui.brick_count.caption = global.banked_brick
    end
end

function print_intro_msg(player)
    if (global.print_anno_intro) then
        if game.is_multiplayer() then
            player.print("anno_intro")
            player.print("anno_intro2")
        else
            game.show_message_dialog {text = {"anno_intro"}}
            game.show_message_dialog {text = {"anno_intro2"}}
        end
    end
end
