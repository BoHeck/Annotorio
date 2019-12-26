require("scripts.util")

local fast_travel_cooldown = 180 * 60

function create_fast_travel_gui(player_index, flow)
    if (global.fast_travel_last_used_on_tick == nil) then
        global.fast_travel_last_used_on_tick = {}
    end
    global.fast_travel_last_used_on_tick[player_index] = -fast_travel_cooldown

    flow.add {
        type = "sprite-button",
        name = "fast_travel_gui",
        direction = "horizontal",
        sprite = "fast_travel_icon",
        number = get_cooldown(player_index),
        tooltip = {"fast_travel_gui.fast_travel_gui"}
    }
end

function get_cooldown(player_index)
    if (global.fast_travel_last_used_on_tick[player_index]) then
        local cooldown = fast_travel_cooldown - (game.tick - global.fast_travel_last_used_on_tick[player_index])
        if (cooldown <= 0) then
            return nil
        else
            return math.floor(cooldown / 60)
        end
    else
        return nil
    end
end

function create_fast_travel_window(player_index)
    local player = game.players[player_index]

    if (player.opened and player.opened.name == "fast_travel_window") then
        player.opened.destroy()
    end

    local flow =
        player.gui.center.add {
        type = "frame",
        name = "fast_travel_window",
        caption = {"fast_travel_gui.fast_travel_window"},
        direction = "vertical"
    }

    flow.add {
        type = "label",
        name = "fast_travel_window_description1",
        caption = {"fast_travel_gui.description1"}
    }

    local list_box =
        flow.add {
        type = "scroll-pane",
        name = "fast_travel_window_list_box",
        direction = "vertical",
        vertical_scroll_policy = "always"
    }

    local destinations = get_destinations(player)

    for index, destination in pairs(destinations) do
        list_box.add {
            type = "button",
            name = "fast_travel_window_destination_" .. tostring(index),
            caption = destination
        }
    end

    player.opened = flow
end

function if_fast_travel_window_closed(event)
    local player = game.get_player(event.player_index)
    local frame = event.element
    if event.gui_type == defines.gui_type.custom and frame and frame.valid and frame.name == "fast_travel_window" then
        frame.destroy()
    end
end

function if_fast_travel_gui_clicked(event)
    local player = game.get_player(event.player_index)
    local button = event.element

    if (button and button.valid) then
        if (button.name == "fast_travel_gui") then
            if (get_cooldown(event.player_index) == nil) then
                create_fast_travel_window(event.player_index)
            end
        end

        if string.find(button.name, "fast_travel_window_destination_") then
            local index = tonumber(string.sub(button.name, 32))
            --Warning: adjust this if you change  "fast_travel_window_destination_"
            log(index)
            local a = global.kontors[index]
            local b = global.kontors[index].harbor_1

            global.fast_travel_last_used_on_tick[event.player_index] = game.tick
            player.teleport(global.kontors[index].harbor_1.position)

            if (player.vehicle) then
                player.vehicle.teleport(global.kontors[index].harbor_1.position)
            end
            
            player.opened.destroy()
        end
    end
end

function get_destinations(player)
    local result = {}
    for i, v in pairs(global.kontors) do
        log(i)
        --if (player.force == v.harbor_1.force) then
        result[i] = v.harbor_1.backer_name
        -- end
    end
    return result
end
