local Position = require("__stdlib__/stdlib/area/position")

function reset_global_ores_and_soils()
    global.anno_ores = {"iron-ore", "copper-ore", "stone", "coal", "sulfur"}
    global.anno_soils = {}
    global.anno_soils["cold"] = {"apple_soil"}
    global.anno_soils["warm"] = {"sugar_cane_soil"}
    global.anno_liquids = {"fresh_water"}
    global.anno_alternatives = {"iron-ore", "copper-ore", "stone", "coal", "sulfur"}
    global.needs_water = {}
    --Use like this :  global.needs_water["some_soil"]=true
end

reset_global_ores_and_soils()

--Note: A Value of 0 is located in the center of the island. A Value of 1 is at the shore
--Note2: Start Values have to be smaller than end values
local ore_patch_start = 0.0
local ore_patch_end = 0.1

local soil_patch_start = 0.5
local soil_patch_end = 0.7

local fluids_patch_start = 0.25
local fluids_patch_end = 0.35
local fluid_spawn_count_ratio_to_land = 1 / 3000 -- For every X tiles there is 1 entity which a well or pumpjack can be build on.
local fluid_amount_ratio_to_land = 1 / 50 -- The added

--Select random elements of some_table. and returns them in a new table
local function select_x(some_table, count)
    local shallow_copy = {}
    local result = {}

    --savety check
    if (#some_table < count) then
        count = #some_table
    end

    for i, v in pairs(some_table) do
        table.insert(shallow_copy, v)
    end

    for var = 1, count do
        table.insert(result, table.remove(shallow_copy, math.random(1, #shallow_copy)))
    end

    return result
end

--Return a list of random soils/fertilities
--Islands have a climate and the returned soils are allways of the same group
function roll_soils(count)
    if (math.random(0, 1) == 1) then
        return select_x(global.anno_soils["cold"], count)
    else
        return select_x(global.anno_soils["warm"], count)
    end
end

--Returns a list of random ores
function roll_ores(count)
    return select_x(global.anno_ores, count)
end

--Returns a list of random fluids
function roll_fluids(count)
    return select_x(global.anno_liquids, count)
end

function contains(some_table, value)
    for i, v in pairs(some_table) do
        if (v == value) then
            return true
        end
    end

    return false
end

function roll_alternatives(count, exclude_1, exclude_2)
    local shallow_copy = {}

    for i, v in pairs(global.anno_alternatives) do
        if (contains(exclude_1, v) or contains(exclude_2, v)) then
        else
            table.insert(shallow_copy, v)
        end
    end

    return select_x(shallow_copy, count)
end

function needs_water(soils)
    for i, v in pairs(soils) do
        if (global.needs_water[v]) then
            return true
        end
    end
    return false
end

--Comparison function for elevation
local sort_by_elev = function(a, b)
    return a.elev > b.elev
end

--Places ores/fertilities on an Island
local function place_resource(surface, position_elevation_pairs, elevation_count, resources, start_factor, end_factor)
    local start_index = math.max(1, math.floor(start_factor * elevation_count))
    local end_index = math.floor(end_factor * elevation_count)
    local res_count = #resources

    --log("end_index " .. tostring(end_index))
    --log("elevation_count " .. tostring(elevation_count))
    --log("start_index " .. tostring(start_index))
    --log("end_index " .. tostring(end_index))

    for index = start_index, end_index do
        for res_index = 1, res_count do
            --log(index)
            surface.create_entity {
                name = resources[res_index],
                position = position_elevation_pairs[index].position,
                amount = 1000
            }
        end
    end
end

local function remove_overlapping(indexes, position_elevation_pairs, min_distance)
    local result = {}
    local bool = true
    local min_distance_sqrt = min_distance * min_distance

    --Note: there are a number of potential bugs here. Its assumed that there are more than 1 entry in indexes and that the table is numerated starting with 1,2,3...
    for i = 1, #indexes - 1 do
        bool = true
        for j = i + 1, #indexes do
            if
                (min_distance_sqrt >
                    Position.distance_squared(
                        position_elevation_pairs[indexes[i]].position,
                        position_elevation_pairs[indexes[j]].position
                    ))
             then
                bool = false
                break
            end
        end
        if (bool) then
            table.insert(result, indexes[i])
        end
    end

    table.insert(result, indexes[#indexes])
    return result
end

local function place_fluid(
    surface,
    position_elevation_pairs,
    elevation_count,
    fluids,
    fluids_patch_start,
    fluids_patch_end)
    local spawn_count = math.floor(fluid_spawn_count_ratio_to_land * elevation_count)
    local fluid_amount

    local start_index = math.max(1, math.floor(fluids_patch_start * elevation_count))
    local end_index = math.floor(fluids_patch_end * elevation_count)

    local indexes = {}

    for i = 1, spawn_count do
        table.insert(indexes, math.floor(math.random(start_index, end_index)))
    end

    indexes = remove_overlapping(indexes, position_elevation_pairs, 4)

    fluid_amount = math.floor(fluid_amount_ratio_to_land * elevation_count / #indexes)

    --note: this was seperarated from above loop, to make it easier to replace in the future

    for i, v in pairs(indexes) do
        for fluid_index = 1, #fluids do
            surface.create_entity {
                name = fluids[fluid_index],
                position = position_elevation_pairs[v].position,
                amount = fluid_amount
            }
        end
    end
end

--Places all ores/fertilities/fluids on an Island
function place_resources(surface, island, soils, ores, fluids, alternatives, place_fluid_flag)
    local elevation = surface.calculate_tile_properties({"elevation"}, island)
    local elevation_count = #elevation["elevation"]

    local position_elevation_pairs = {}

    for i, v in pairs(elevation["elevation"]) do
        table.insert(position_elevation_pairs, {elev = v, position = island[i]})
    end

    table.sort(position_elevation_pairs, sort_by_elev)

    place_resource(surface, position_elevation_pairs, elevation_count, ores, ore_patch_start, ore_patch_end)
    place_resource(surface, position_elevation_pairs, elevation_count, soils, soil_patch_start, soil_patch_end)

    if (place_fluid_flag) then
        place_fluid(surface, position_elevation_pairs, elevation_count, fluids, fluids_patch_start, fluids_patch_end)
    else
        place_resource(
            surface,
            position_elevation_pairs,
            elevation_count,
            alternatives,
            fluids_patch_start,
            fluids_patch_end
        )
    end
end
