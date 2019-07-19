if (global.dummy_replacement_pair == nil) then
    global.dummy_replacement_pair = {}
end

function add_dummy_replacement_pair(dummy, replacement)
    global.dummy_replacement_pair[dummy] = replacement
end

function if_something_build(event,entity_name)
    local ent = event.created_entity

    for dummy, replacement in pairs(global.dummy_replacement_pair) do
        if (entity_name == dummy) then
            ent.surface.create_entity {
                name = replacement,
                position = ent.position,
                force = game.players[event.player_index].force,
                fast_replace = false,
                player = game.players[event.player_index],
                spill = false,
                raise_built = false,
                create_build_effect_smoke = false
            }
            ent.destroy()
            break
        end
    end
end

add_dummy_replacement_pair("apple_orchard_dummy", "apple_orchard")
add_dummy_replacement_pair("clay_pit_dummy", "clay_pit")
