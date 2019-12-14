require("prototypes.map.resource_placement")

global.adventurers_guild_gui = {}
global.adventurers_guild_gui.fertility_frame = {}
global.adventurers_guild_gui.ore_frame = {}
global.adventurers_guild_gui.fluid_frame = {}
global.adventurers_guild_gui.alternative_frame = {}
global.adventurers_guild_gui.fertility_frame.dropdown_last_selected = 0
global.adventurers_guild_gui.ore_frame.dropdown_last_selected = 0
global.adventurers_guild_gui.fluid_frame.dropdown_last_selected = 0
global.adventurers_guild_gui.alternative_frame.dropdown_last_selected = 0
global.adventurers_guild_gui.send_explorers = false
global.adventurers_guild_gui.additional_frame_switch = "right"

ore_dropdown = {
    {"entity-name.iron-ore"},
    {"entity-name.copper-ore"},
    {"entity-name.coal"},
    {"entity-name.sulfur"}
}
soil_dropdown = {
    {"entity-name.apple_soil"},
    {"entity-name.sugar_cane_soil"}
}
fluid_dropdown = {
    {"entity-name.fresh_water"},
    {"entity-name.anno_oil"}
}
alternatives_dropdown = {
    {"entity-name.iron-ore"},
    {"entity-name.copper-ore"},
    {"entity-name.stone"},
    {"entity-name.coal"},
    {"entity-name.sulfur"}
}
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function adventurers_guild_gui_get_ores()
    if (global.adventurers_guild_gui.ore_frame.dropdown_last_selected == 0) then
        return roll_ores(1)
    else
        return {string.sub(ore_dropdown[global.adventurers_guild_gui.ore_frame.dropdown_last_selected][1], 13)}
    end
end

function adventurers_guild_gui_get_soils()
    if (global.adventurers_guild_gui.fertility_frame.dropdown_last_selected == 0) then
        return roll_soils(1)
    else
        return {string.sub(soil_dropdown[global.adventurers_guild_gui.fertility_frame.dropdown_last_selected][1], 13)}
    end
end

function adventurers_guild_gui_get_alternatives(exclude_1, exclude_2)
    if (global.adventurers_guild_gui.alternative_frame.dropdown_last_selected == 0) then
        return roll_alternatives(1, exclude_1, exclude_2)
    else
        return {
            string.sub(
                alternatives_dropdown[global.adventurers_guild_gui.alternative_frame.dropdown_last_selected][1],
                13
            )
        }
    end
end

function adventurers_guild_gui_get_fluids()
    if (global.adventurers_guild_gui.fluid_frame.dropdown_last_selected == 0) then
        return roll_fluids(1)
    else
        return {string.sub(fluid_dropdown[global.adventurers_guild_gui.fluid_frame.dropdown_last_selected][1], 13)}
    end
end
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function if_adventurers_guild_gui_opened(event, entity_name)
    if (entity_name ~= "adventurers_guild") then
        return
    end

    local player = game.players[event.player_index]

    player.opened = create_adventurers_guild_gui(entity, player)

    --if event.gui_type == defines.gui_type.entity and entity and entity.name == "magic-lamp" then
end

function if_adventurers_guild_gui_closed(event)
    local player = game.get_player(event.player_index)
    local frame = event.element
    if event.gui_type == defines.gui_type.custom and frame and frame.valid and frame.name == "adventurers_guild_gui" then
        adventurers_guild_gui_close(frame)
    end
end

function adventurers_guild_gui_close(gui)
    --save current settings into global
    global.adventurers_guild_gui.fertility_frame.dropdown_last_selected =
        gui.adventurers_guild_gui_fertility_frame.adventurers_guild_gui_fertility_dropdown.selected_index
    global.adventurers_guild_gui.ore_frame.dropdown_last_selected =
        gui.adventurers_guild_gui_ore_frame.adventurers_guild_gui_ore_dropdown.selected_index
    if (gui.adventurers_guild_gui_additional_frame.adventurers_guild_gui_fluid_frame) then
        global.adventurers_guild_gui.fluid_frame.dropdown_last_selected =
            gui.adventurers_guild_gui_additional_frame.adventurers_guild_gui_fluid_frame.adventurers_guild_gui_fluid_dropdown.selected_index
    end
    if (gui.adventurers_guild_gui_additional_frame.adventurers_guild_gui_alternative_frame) then
        global.adventurers_guild_gui.alternative_frame.dropdown_last_selected =
            gui.adventurers_guild_gui_additional_frame.adventurers_guild_gui_alternative_frame.adventurers_guild_gui_alternatives_dropdown.selected_index
    end

    global.adventurers_guild_gui.additional_frame_switch =
        gui.adventurers_guild_gui_additional_frame.adventurers_guild_gui_additional_switch.switch_state
    gui.destroy()
end
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function if_adventurers_guild_gui_clicked(event)
    --local player = game.get_player(event.player_index)
    local button = event.element

    if (button and button.valid) then
        if (button.name == "adventurers_guild_gui_send_explorers") then
            global.adventurers_guild_gui.send_explorers = true
            adventurers_guild_gui_close(button.parent.parent)
            return
        end

        if (button.name == "adventurers_guild_gui_recall") then
            global.adventurers_guild_gui.send_explorers = false
            adventurers_guild_gui_close(button.parent.parent)
            return
        end
    end
end

function if_adventurers_guild_gui_state_changed(event)
    local switch = event.element

    if (switch and switch.valid) then
        if (switch.name == "adventurers_guild_gui_additional_switch") then
            adventurers_guild_gui_close(switch.parent.parent)
            local player = game.players[event.player_index]
            player.opened = create_adventurers_guild_gui(entity, player)
            return
        end
    end
end

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function create_adventurers_guild_gui(entity, player)
    -- local config = global.lamps[entity.unit_number].config

    local flow =
        player.gui.center.add {
        type = "frame",
        name = "adventurers_guild_gui",
        caption = {"entity-name.adventurers_guild"},
        direction = "vertical"
    }
    --------------------------------------------------------------------------
    flow.add {
        type = "label",
        name = "adventurers_guild_gui_description1",
        caption = {"adventurers_guild_gui.description1"}
    }
    flow.add {
        type = "label",
        name = "adventurers_guild_gui_description2",
        caption = {"adventurers_guild_gui.description2"}
    }
    --------------------------------------------------------------------------
    local fertility_frame =
        flow.add {
        type = "frame",
        name = "adventurers_guild_gui_fertility_frame",
        caption = {"adventurers_guild_gui.fertility_frame"},
        direction = "vertical"
    }

    fertility_frame.add {
        type = "drop-down",
        name = "adventurers_guild_gui_fertility_dropdown",
        items = soil_dropdown,
        selected_index = global.adventurers_guild_gui.fertility_frame.dropdown_last_selected
    }
    --------------------------------------------------------------------------
    local ore_frame =
        flow.add {
        type = "frame",
        name = "adventurers_guild_gui_ore_frame",
        caption = {"adventurers_guild_gui.ore_frame"},
        direction = "vertical"
    }

    ore_frame.add {
        type = "drop-down",
        name = "adventurers_guild_gui_ore_dropdown",
        items = ore_dropdown,
        selected_index = global.adventurers_guild_gui.ore_frame.dropdown_last_selected
    }
    --------------------------------------------------------------------------
    local additional_frame =
        flow.add {
        type = "frame",
        name = "adventurers_guild_gui_additional_frame",
        caption = {"adventurers_guild_gui.additional_frame"},
        direction = "vertical"
    }
    flow.add {
        type = "label",
        name = "adventurers_guild_gui_description3",
        caption = {"adventurers_guild_gui.description3"}
    }
    local additional_frame_switch =
        additional_frame.add {
        type = "switch",
        name = "adventurers_guild_gui_additional_switch",
        switch_state = global.adventurers_guild_gui.additional_frame_switch
    }

    if (global.adventurers_guild_gui.additional_frame_switch == "right") then
        local fluid_frame =
            additional_frame.add {
            type = "frame",
            name = "adventurers_guild_gui_fluid_frame",
            caption = {"adventurers_guild_gui.fluid_frame"},
            direction = "vertical"
        }

        fluid_frame.add {
            type = "drop-down",
            name = "adventurers_guild_gui_fluid_dropdown",
            items = fluid_dropdown,
            selected_index = global.adventurers_guild_gui.fluid_frame.dropdown_last_selected
        }
    else
        local alternative_frame =
            additional_frame.add {
            type = "frame",
            name = "adventurers_guild_gui_alternative_frame",
            caption = {"adventurers_guild_gui.alternative_frame"},
            direction = "vertical"
        }

        alternative_frame.add {
            type = "drop-down",
            name = "adventurers_guild_gui_alternatives_dropdown",
            items = alternatives_dropdown,
            selected_index = global.adventurers_guild_gui.alternative_frame.dropdown_last_selected
        }
    end

    --------------------------------------------------------------------------

    local button_frame =
        flow.add {
        type = "frame",
        name = "adventurers_guild_gui_button_frame",
        --caption = {"adventurers_guild_gui.button_frame"},
        direction = "horizontal"
    }

    local recall =
        button_frame.add {
        type = "button",
        name = "adventurers_guild_gui_recall",
        caption = {"adventurers_guild_gui.recall"}
    }
    local send_explorers =
        button_frame.add {
        type = "button",
        name = "adventurers_guild_gui_send_explorers",
        caption = {"adventurers_guild_gui.send_explorers"}
    }

    if (global.adventurers_guild_gui.send_explorers) then
        send_explorers.enabled = false
        send_explorers.style = "confirm_button"
        recall.style = "red_back_button"
    else
        recall.enabled = false
        send_explorers.style = "confirm_button"
        recall.style = "red_back_button"
    end

    --[[


    local mode =
        flow.add {
        type = "drop-down",
        name = "adventurers_guild.ores",
        items = {
            {"magic-lamp.mode-numeric"},
            {"magic-lamp.mode-iconstrip"}, -- bitmask icon strip
            {"magic-lamp.mode-string"} -- string mode, utf32 strings on signals in prototype order
        },
        selected_index = mode
    }
]]
    return flow
end
