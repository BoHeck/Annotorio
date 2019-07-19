require("util")

---------include these in the event collection-----------
--function ifWoodcutterBuild()
--function ifWoodcutterRemoved()
--script.on_nth_tick(ticksBetweenHarvest, HarvestOnEveryXTicks)
-------------------------------------------------------

--This script implements the behaviour of the Woodcutter building
--The Woodcutter  fells trees in its vicinity and adds a tree item into its input slot
--It then uses a recipe to convert the tree item into wood which can be taken from its output slot

if (global.woodcutters == nil) then
    global.woodcutters = {}
end

local ticksBetweenHarvest = 180
local harvestStackLimit = 4 --The maximum ammount ouf tree in the woodcutters input slot
local harvest_radius = 14
local treetype = "tree" --The type which entities should have if they are trees

--register the woodcutter in table woodcutters
function ifWoodcutterBuild(event,entity_name)
    local ent = event.created_entity
    if (entity_name == "woodcutter") then
        global.woodcutters[ent.unit_number] = ent
    end
end

--remove the woodcutter from table woodcutters
function ifWoodcutterRemoved(event,entity_name)
    local ent = event.entity

    if (entity_name == "woodcutter") then
        global.woodcutters[ent.unit_number] = nil
    end
end

function HarvestOnEveryXTicks()
    for i, cutter in pairs(global.woodcutters) do
        --if () then --could check for electricity... but its not needed
        --If the woodcutters has less than X trees stored
        if (cutter.get_inventory(defines.inventory.assembling_machine_input).get_item_count() < harvestStackLimit) then
            local tree =
                cutter.surface.find_entities_filtered {
                type = treetype,
                limit = 1,
                position = cutter.position,
                radius = harvest_radius
            }[1]
            --TODO remove limit and pick random tree
            if (tree ~= nil) then
                cutter.insert {name = "tree_trunk", count = 1}
                tree.die()
            else
                --TODO here can go code to warn the user that his woodcutter has run out of trees
            end
        end
        -- end
    end
end
