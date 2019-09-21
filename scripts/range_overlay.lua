function if_building_selected(event)
    local player = game.players[event.player_index]

    if (player.selected == nil) then
        return
    end

    for i, building in ipairs(global.buildings_with_overlay) do
        if (player.selected.name == building.name) then
            global.anno_selection_overlay[event.player_index] =
                rendering.draw_circle {
                color = {g = 0.1, a = 0.1},
                radius = building.range,
                filled = true,
                target = player.selected,
                surface = player.surface,
                players = {player}
            }
            return
        end
    end
end
