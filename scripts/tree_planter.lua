require("util")

---------include these in the event collection-----------
--function if_tree_planter_build()
--function if_tree_planter_removed()
--script.on_nth_tick(ticks_between_planting, plant_on_every_x_ticks)
--script.on_nth_tick(ticks_between_planting, grow_trees_on_every_x_ticks)
-------------------------------------------------------

--This script implements the behaviour of the Tree Planter building
--The Tree Planter produces young trees. These will then be planted nearby.
--The young trees later grow up into actual trees

if (global.tree_planters == nil) then
    global.tree_planters = {}
end

if (global.growing_trees == nil) then
    global.growing_trees = {}
    for i = 1, 90 do
        global.growing_trees[i] = {}
    end
end

if (global.growing_trees_index == nil) then
    global.growing_trees_index = 1
end

local ticks_between_planting = 60
local plant_radius = 24
local growth_time = 90 -- 90sec

--register the tree planter in table
function if_tree_planter_build(event, entity_name)
    local ent = event.created_entity
    if (entity_name == "tree_planter") then
        global.tree_planters[ent.unit_number] = ent
    end
    if (entity_name == "young_tree") then
        table.insert(global.growing_trees[global.growing_trees_index + 1], ent)
    end
end

--remove the tree planter from table
function if_tree_planter_removed(event, entity_name)
    local ent = event.entity

    if (entity_name == "tree_planter") then
        global.tree_planters[ent.unit_number] = nil
    end
    if (entity_name == "young_tree") then
        for i = 1, 90 do
            for index, tree in ipairs(global.growing_trees[i]) do
                if (tree == ent) then
                    global.growing_trees[i][index] = nil
                end
            end
        end
    end
end

function plant_on_every_x_ticks()
    for i, planter in pairs(global.tree_planters) do
        local stack = planter.get_output_inventory()[1]

        --If there are young trees in the output slot then remove one and plant it somewhere
        if (stack ~= nil and stack.valid and stack.valid_for_read) then
            if (stack.count > 0) then
                --find an empty position
                local good_position =
                    planter.surface.find_non_colliding_position("young_tree", planter.position, plant_radius, 1, true)
                if (good_position ~= nil) then
                    local new_tree =
                        planter.surface.create_entity {
                        name = "young_tree",
                        position = good_position,
                        raise_built = false
                    }

                    table.insert(global.growing_trees[global.growing_trees_index + 1], new_tree)

                    stack.count = stack.count - 1
                end
            end
        end
    end
end

function grow_trees_on_every_x_ticks()
    local index = (global.growing_trees_index + 1) % growth_time --this produces values from 0 to 89 but we need 1 to 90 which is why everywhere where this index is useed we add 1
    global.growing_trees_index = index

    for _, growing_tree in pairs(global.growing_trees[index + 1]) do
        growing_tree.surface.create_entity {
            name = "tree-01",
            position = growing_tree.position
        }

        growing_tree.destroy()
    end
    global.growing_trees[index + 1] = {}
end
