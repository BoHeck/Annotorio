--This file modifies all land resources and needs to be loaded after all resources are present
require("prototypes.entity.fisher")
----------------

if (debug_on == false) then
    --Disable all existing recipes
    for i, v in pairs(data.raw.recipe) do
        v.hidden = false
        v.enabled = false
    end
end

data.raw.recipe["wood-wall"].enabled = false --TODO find out why this doesnt work
----------------
--All assemblers with a fixed recipe should have assembler.crafting_categories[1] == "predetermined"
--They then get a new generated category so that the UI knows that only this one entity can make the recipe.
local counter = 1
for i, assembler in pairs(data.raw["assembling-machine"]) do
    if (assembler.crafting_categories[1] == "predetermined") then
        assembler.crafting_categories = {"predetermined_" .. counter}
        data.raw.recipe[assembler.fixed_recipe].category = "predetermined_" .. counter

        data:extend(
            {
                {
                    type = "recipe-category",
                    name = "predetermined_" .. counter
                }
            }
        )

        counter = counter + 1
    end
end
-------
