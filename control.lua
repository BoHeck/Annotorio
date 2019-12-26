--control.lua

require("scripts.house")
require("scripts.woodcutter")
require("scripts.kontor")
require("scripts.fisher")
require("scripts.tree_planter")
require("scripts.dummy_replacement_pair")
require("scripts.mine")
require("scripts.shared_inventory")
require("scripts.marketplace")
require("scripts.pipette")
require("scripts.day_night_cycle")
require("scripts.luxus_buildings")
require("scripts.ship_placement")
require("scripts.technology")
require("scripts.shore_placement")
require("scripts.castle")
require("scripts.towers")
require("scripts.range_overlay")
require("scripts.adventurers_guild")
require("scripts.fast_travel_gui")
----------------------------------------------
--require("prototypes.map.voroni_noise")
require("prototypes.map.hole_islands")
require("prototypes.map.island_naming")
----------------------------------------------
require("scripts.gui")

require("scripts.migrate_helper")

require("scripts.util")
--Provides debug_print

if (global.print_anno_intro == nil) then
   global.print_anno_intro = true
end

-------------------On Event Collections---------------------------------------------------------
--Here are all  functions that are named in the various files as
-- "include these in the event collection"
--They are grouped by event and then attached as handlers

function on_player_cursor_stack_changed_collection(event)
   dont_allow_inventory_placeholder_in_the_cursor(event)
end

function script_raised_built_collection(event)
   local ent = event.entity
   ifHouseBuild(ent, ent.name)
end

function on_built_entity_collection(event)
   local ent = event.created_entity
   local entity_name = event.created_entity.name

   if_luxus_build(event, entity_name)
   ifMarketBuild(event, entity_name)
   ifHouseBuild(ent, entity_name)
   ifWoodcutterBuild(event, entity_name)
   if_tree_planter_build(event, entity_name)
   if_shipyard_build(event, entity_name)
   if_kontor_build(event, entity_name)
   if_kontor_upgraded(event, entity_name)
   if_something_build(event, entity_name)
   if_mine_build(event, entity_name)
   if_ship_build(event, entity_name)
   if_castle_build(event, entity_name)
   if_tower_build(event, entity_name)
end

function on_entity_removed_collection(event)
   local entity_name = event.entity.name

   if_luxus_removed(event, entity_name)
   ifMarketRemoved(event, entity_name)
   ifKontorRemoved(event, entity_name)
   ifHouseRemoved(event, entity_name)
   ifWoodcutterRemoved(event, entity_name)
   if_tree_planter_removed(event, entity_name)
   if_ship_removed(event, entity_name)
   if_castle_removed(event, entity_name)
   if_tower_removed(event, entity_name)
end

function on_tick_collection()
   if (game.tick == 12) then
      script.on_event({defines.events.on_tick}, nil)
      catch_up_on_tick()
   end
end

function on_12_tick_Collection()
   search_in_storage_on_every_x_ticks()
   --search before refreshing gui
   refresh_gui_on_every_x_ticks()
end

function on_60_tick_Collection()
   houses_on_every_x_ticks()
   plant_on_every_x_ticks()
   grow_trees_on_every_x_ticks()
end

function on_180_tick_Collection()
   HarvestOnEveryXTicks()
   castle_on_every_x_ticks()
end

function on_chunk_generated_collection(event)
   generate_hole_islands_on_chunk(event)

   --Generate them on surface 1
   map_generation_fish_resource(event, 1)
end

function on_pre_player_crafted_item_collection()
end

function on_player_main_inventory_changed_collection(event)
   local player = game.players[event.player_index]
   inventory_changed_sync(player)
end

function on_configuration_changed_collection(ConfigurationChangedData)
   allways_try_these()
   setup_needs()

   if (ConfigurationChangedData.mod_changes["Annotorio"]) then
      log("XXXXXXXXXXXXXXXXXXX_Annotorio_XXXXXXXXXXXXXXXXXXXX")
      log("old_version" .. ConfigurationChangedData.mod_changes["Annotorio"].old_version)
      log("new_version" .. ConfigurationChangedData.mod_changes["Annotorio"].new_version)

      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.3.0") then
         migrate_0_3_0()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.3.1") then
         migrate_0_3_1()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.3.2") then
         migrate_0_3_2()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.3.3") then
         migrate_0_3_3()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.3.4") then
         migrate_0_3_4()
      end

      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.5.0") then
         migrate_0_5_0()
      end

      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.6.0") then
         migrate_0_6_0()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.6.1") then
         migrate_0_6_1()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.6.2") then
         migrate_0_6_2()
      end
      if (ConfigurationChangedData.mod_changes["Annotorio"].old_version == "0.6.3") then
         migrate_0_6_3()
      end
      log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
   end
end

function on_player_created_collection(event)
   local player = game.players[event.player_index]

   day_night_cycle_init()

   give_player_starting_items(player)
   create_gui_for_player(player)
   --This should be run after give_player_starting_items()
   init_shared_resources(player)
   start_player_in_ship(player)

   --set stack_inserter bonus --TODO remove this once the game allowes us to set this in another way
   player.force.stack_inserter_capacity_bonus = 200

   --[[
   for i, tile in pairs(game.tile_prototypes) do
      log(tile.name)
      for j, layer in pairs(tile.collision_mask) do
         log(j)
      end
   end]]
end

function start_player_in_ship(player)
   local ship =
      player.surface.create_entity {
      name = "sloop",
      position = player.position,
      force = player.force,
      fast_replace = false,
      player = player,
      spill = false,
      raise_built = false,
      create_build_effect_smoke = false
   }
   if (settings.startup["debug_mode"].value) then
      ship.insert {name = "anno_arrow", count = 200}
   else
      ship.insert {name = "anno_arrow", count = 20}
   end
   ship.set_driver(player)
end

function on_player_pipette_collection(event)
   produce_item_on_pipette(event)
end

function on_init_collection()
   setup_needs()
   pipette_init()
   if (remote.interfaces["freeplay"]) then
      remote.call("freeplay", "set_created_items", {})
      remote.call("freeplay", "set_respawn_items", {})
      remote.call("freeplay", "set_skip_intro", true)
   end
end

function on_runtime_mod_setting_changed_collection()
   day_night_cycle_init()
   setup_needs()
end

function on_selected_entity_changed_collection(event)
   local player = game.players[event.player_index]

   if
      (global.anno_selection_overlay[event.player_index] ~= nil and
         global.anno_selection_overlay[event.player_index] ~= -1)
    then
      rendering.destroy(global.anno_selection_overlay[event.player_index])
      global.anno_selection_overlay[event.player_index] = -1
   end

   if_luxus_select(event)
   if_building_selected(event)
end

function on_research_finished_collection(event)
   change_banked_count("anno_tool", "anno_tool_placeholder", "banked_tool", 12)

   for _, player in pairs(game.players) do
      if player.connected then
         player.print {"technology_finished_message", event.research.localised_name}
      end
   end

   queue_technology(event.research.force)
end

function on_force_created_collection(event)
   name_islands_on_force_created(event)
end

function on_gui_opened_collection(event)
   if (event.gui_type == defines.gui_type.entity and event.entity) then
      local entity_name = event.entity.name
      if_adventurers_guild_gui_opened(event, entity_name)
   end
end

function on_gui_closed_collection(event)
   if_adventurers_guild_gui_closed(event)
   if_fast_travel_window_closed(event)
end

function on_gui_click_collection(event)
   if_adventurers_guild_gui_clicked(event)
   if_fast_travel_gui_clicked(event)
end

function on_gui_switch_state_changed_collection(event)
   if_adventurers_guild_gui_state_changed(event)
end

----------------------------------------------------------------------------------------------------
function give_player_starting_items(player)
   player.force.research_queue_enabled = false
   queue_technology(player.force)

   if (settings.startup["debug_mode"].value) then
      give_player_starting_items_debug(player)
   else
      give_player_starting_items_default(player)
   end
   print_intro_msg(player)
end

function give_player_starting_items_default(player)
   clear_player(player)

   player.insert {name = "bow", count = 1}
   player.insert {name = "anno_arrow", count = 3}

   player.insert {name = "anno_wooden_belt", count = 40}
   player.insert {name = "anno_tool", count = 40}
   player.insert {name = "wood", count = 80}
   player.insert {name = "fishing_boat", count = 2}
   player.insert {name = "kontor", count = 1}
   player.insert {name = "marketplace_dummy", count = 2}
   player.insert {name = "seedling", count = 40}
end

----remove all items from player (mostly from factorio default scenario)
function clear_player(player)
   player.get_main_inventory().clear()
   if (player.get_inventory(defines.inventory.character_guns)) then
      player.get_inventory(defines.inventory.character_guns).clear()
      player.get_inventory(defines.inventory.character_ammo).clear()
   end
end

function give_player_starting_items_debug(player)
   clear_player(player)

   player.insert {name = "bow", count = 1}
   player.insert {name = "anno_arrow", count = 3}

   player.insert {name = "anno_fish", count = 200}
   player.insert {name = "cider", count = 200}
   player.insert {name = "cloth", count = 200}
   player.insert {name = "copperwares", count = 200}
   player.insert {name = "barreled_rum", count = 200}
   player.insert {name = "bacon_omelet", count = 200}

   player.insert {name = "anno_wooden_belt", count = 40}
   player.insert {name = "anno_tool", count = 1000}
   player.insert {name = "wood", count = 1000}
   player.insert {name = "kontor", count = 1}
   player.insert {name = "young_tree", count = 40}
   player.insert {name = "ceramics", count = 1000}
end

function chart(player)
   local radius = global.chart_distance or 192
   player.force.chart(
      player.surface,
      {
         {player.position.x - radius, player.position.y - radius},
         {player.position.x + radius, player.position.y + radius}
      }
   )
end

-----------Nuke the freeplay scenario ----------------
global.skip_intro = true
global.created_items = {}
global.respawn_items = {}
--------------------------------------------------

script.on_nth_tick(12, on_12_tick_Collection)
script.on_nth_tick(60, on_60_tick_Collection)
script.on_nth_tick(180, on_180_tick_Collection)
script.on_event({defines.events.on_tick}, on_tick_collection)

script.on_event({defines.events.on_built_entity}, on_built_entity_collection)
script.on_event({defines.events.script_raised_built}, script_raised_built_collection)

script.on_event({defines.events.on_entity_died}, on_entity_removed_collection)
script.on_event({defines.events.on_player_mined_entity}, on_entity_removed_collection)
script.on_event({defines.events.on_robot_mined_entity}, on_entity_removed_collection)

script.on_event(defines.events.on_chunk_generated, on_chunk_generated_collection)

script.on_event(defines.events.on_player_created, on_player_created_collection)
script.on_event(defines.events.on_player_main_inventory_changed, on_player_main_inventory_changed_collection)
script.on_event(defines.events.on_pre_player_crafted_item, on_pre_player_crafted_item_collection)
script.on_event(defines.events.on_player_cursor_stack_changed, on_player_cursor_stack_changed_collection)
script.on_event(defines.events.on_player_pipette, on_player_pipette_collection)
script.on_event(defines.events.on_runtime_mod_setting_changed, on_runtime_mod_setting_changed_collection)
script.on_event(defines.events.on_selected_entity_changed, on_selected_entity_changed_collection)
script.on_event(defines.events.on_research_finished, on_research_finished_collection)
script.on_event(defines.events.on_force_created, on_force_created_collection)

script.on_configuration_changed(on_configuration_changed_collection)
script.on_init(on_init_collection)

script.on_event(defines.events.on_gui_opened, on_gui_opened_collection)
script.on_event(defines.events.on_gui_closed, on_gui_closed_collection)
script.on_event(defines.events.on_gui_click, on_gui_click_collection)
script.on_event(defines.events.on_gui_switch_state_changed, on_gui_switch_state_changed_collection)
