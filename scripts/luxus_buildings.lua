---------include these in the event collection-----------
--function if_luxus_build(event, entity_name)
--function if_luxus_removed(event, entity_name)
--function if_luxus_select(event)
-------------------------------------------------------

require("scripts.house")

if (global.anno_selection_overlay == nil) then
    global.anno_selection_overlay = {}
end

function if_luxus_build(event, entity_name)
    for i, luxus_building in ipairs(global.luxus_buildings) do
        if (entity_name == luxus_building.name) then
            register_onto_houses_in_range(
                event.created_entity,
                "house_pioneer",
                "houses_pioneers",
                luxus_building.name,
                luxus_building.range
            )
            register_onto_houses_in_range(
                event.created_entity,
                "house_settler",
                "houses_settlers",
                luxus_building.name,
                luxus_building.range
            )
            return
        end
    end
end

function if_luxus_removed(event, entity_name)
    for i, luxus_building in ipairs(global.luxus_buildings) do
        if (entity_name == luxus_building.name) then
            deregister_from_houses(event.entity, "houses_pioneers", luxus_building.name)
            deregister_from_houses(event.entity, "houses_settlers", luxus_building.name)
            return
        end
    end
end

function if_luxus_select(event)
    local player = game.players[event.player_index]

    if (player.selected == nil) then
        return
    end

    for i, luxus_building in ipairs(global.luxus_buildings) do
        if (player.selected.name == luxus_building.name) then
            global.anno_selection_overlay[event.player_index] =
                rendering.draw_circle {
                color = {g = 0.1, a = 0.1},
                radius = luxus_building.range,
                filled = true,
                target = player.selected,
                surface = player.surface,
                players = {player}
            }
            return
        end
    end
end
