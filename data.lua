debug_on = settings.startup["debug_mode"].value

--Hiding all existing technologies
for i, v in pairs(data.raw.technology) do
  v.hidden = false
  v.enabled = false
end

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

data.raw.furnace["electric-furnace"].crafting_categories = {"none"}

if (debug_on == true) then
  --Disable all existing recipes
  for i, v in pairs(data.raw.recipe) do
    v.hidden = false
    v.enabled = false
  end
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
