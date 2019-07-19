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

function on_built_entity_collection(event)
   local entity_name = event.created_entity.name

   ifMarketBuild(event, entity_name)
   ifKontorBuild(event, entity_name)
   ifHouseBuild(event, entity_name)
   ifWoodcutterBuild(event, entity_name)
   if_tree_planter_build(event, entity_name)
   if_something_build(event, entity_name)
   if_mine_build(event, entity_name)
end

function on_entity_removed_collection(event)
   local entity_name = event.entity.name

   ifMarketRemoved(event, entity_name)
   ifKontorRemoved(event, entity_name)
   ifHouseRemoved(event, entity_name)
   ifWoodcutterRemoved(event, entity_name)
   if_tree_planter_removed(event, entity_name)
end

function on_12_tick_Collection()
   search_in_kontor_on_every_x_ticks()
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
end

function on_chunk_generated_collection(event)
   map_generation_fish_resource(event, 1)
   --Generate them on surface 1
end

function on_pre_player_crafted_item_collection()
end

function on_player_main_inventory_changed_collection(event)
   local player = game.players[event.player_index]
   inventory_changed_sync(player)
end

function on_configuration_changed_collection(ConfigurationChangedData)
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

      log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
   end
   allways_try_these()
end

function on_player_created_collection(event)
   local player = game.players[event.player_index]

   give_player_starting_items(player)
   create_gui_for_player(player)
   --This should be run after give_player_starting_items()
   init_shared_resources(player)
end

function on_player_pipette_collection(event)
   produce_item_on_pipette(event)
end

function on_init_collection()
   setup_needs()
   pipette_init()
   day_night_cycle_init()
end

function on_runtime_mod_setting_changed_collection()
   day_night_cycle_init()
   setup_needs()
end

----------------------------------------------------------------------------------------------------
function give_player_starting_items(player)
   --game.player.force.technologies["atomic-bomb"].enabled = true
   --game.player.force.technologies["atomic-bomb"].researched = true
   --for i,player in pairs(game.players) do
   --player.force.technologies["atomic-bomb"].enabled = true
   --player.force.technologies["atomic-bomb"].researched = true

   player.force.recipes["pipe"].enabled = false
   player.force.recipes["steam-engine"].enabled = false
   player.force.recipes["burner-mining-drill"].enabled = false
   player.force.recipes["electric-mining-drill"].enabled = false
   player.force.recipes["iron-gear-wheel"].enabled = false
   player.force.recipes["electronic-circuit"].enabled = false

   give_player_starting_items_default(player)
   --give_player_starting_items_debug(player) --TODO switch to default start items
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
   player.insert {name = "seedling", count = 40}
end

----remove all items from player (mostly from factorio default scenario)
function clear_player(player)
   player.get_main_inventory().clear()
   player.get_inventory(defines.inventory.character_guns).clear()
   player.get_inventory(defines.inventory.character_ammo).clear()
end

function give_player_starting_items_debug(player)
   clear_player(player)

   player.insert {name = "bow", count = 1}
   player.insert {name = "anno_arrow", count = 3}

   player.insert {name = "anno_wooden_belt", count = 40}
   player.insert {name = "anno_tool", count = 40}
   player.insert {name = "wood", count = 80}
   player.insert {name = "apple", count = 40}
   player.insert {name = "kontor", count = 1}
   player.insert {name = "cloth", count = 40}
   player.insert {name = "young_tree", count = 40}
   player.insert {name = "ceramics", count = 40}
   player.insert {name = "clay", count = 40}
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

--script.on_event({defines.events.on_tick}, on_tick_Collection)
script.on_nth_tick(12, on_12_tick_Collection)
script.on_nth_tick(60, on_60_tick_Collection)
script.on_nth_tick(180, on_180_tick_Collection)

script.on_event({defines.events.on_built_entity}, on_built_entity_collection)

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

script.on_configuration_changed(on_configuration_changed_collection)
script.on_init(on_init_collection)
