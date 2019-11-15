debug_on = settings.startup["debug_mode"].value

------------------------------------------------------
-------- Delete Unnessessary Base Game Entries -------
------------------------------------------------------
data.raw.technology = nil

for i, v in pairs(data.raw.shortcut) do
  v.technology_to_unlock = nil
end

-------------------------------
local recipe_wooden_chest = data.raw.recipe["wooden-chest"]
-------------------------------

data.raw.recipe = nil

data.raw["research-achievement"] = nil
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw["rocket-silo"]["rocket-silo"].minable = nil
data.raw["rocket-silo"]["rocket-silo"].flags = {}
data.raw["rocket-silo"]["rocket-silo"].order = "a"
data.raw.item["rocket-silo"] = nil

----------------------------------------
local speed_module = data.raw.module["speed-module"]
data.raw.module = {}
data.raw.module["speed-module"] = speed_module
----------------------------------------

data.raw.tutorial = nil

------------------------------------------------------
-------- Delete Unnessessary Base Game Entries -------
------------------------------------------------------

for i, v in pairs(data.raw.tree) do
  v.minable = {
    mining_particle = "wooden-particle",
    mining_time = 0.5,
    results = {
      {
        type = "item",
        name = "wood",
        amount = v.minable.count
      },
      {
        type = "item",
        name = "seedling",
        amount = 1
      }
    }
  }
end

require("prototypes.entity")
require("prototypes.item")
require("prototypes.weapons")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.gui")
require("prototypes.map")
require("prototypes.groups")
require("prototypes.utility_assets")
require("prototypes.music")

--Enabling the recipes we need
--data.raw.recipe["iron-plate"].enabled = true
--data.raw.recipe["iron-plate"].hidden = false
data.raw.recipe["kontor"].enabled = true
-------
data.raw.fish["fish"].minable = {mining_time = 0.4, result = "anno_fish", count = 5}
data.raw.fish["fish"].collision_mask = {"ground-tile", "colliding-with-tiles-only"}
-------
data.raw.item["wood"].icon = "__Annotorio__/graphics/icons/wood_icon.png"
data.raw.item["wood"].icon_size = 64
data.raw.item["wood"].stack_size = 500
-------
data.raw["simple-entity"]["rock-big"].minable.results = {{"clay", 8}}
data.raw["simple-entity"]["rock-huge"].minable.results = {{"clay", 16}}
data.raw["simple-entity"]["sand-rock-big"].minable.results = {{"clay", 10}}

data.raw.character.character.enter_vehicle_distance = 5
-------
data.raw.recipe["wooden-chest"] = recipe_wooden_chest
-------

--[[
if (debug_on == true) then
  --Disable all existing recipes
  for i, v in pairs(data.raw.recipe) do
    v.hidden = false
    v.enabled = false
  end
end
]]
