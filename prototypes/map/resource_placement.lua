function reset_global_ores_and_soils()
    global.anno_ores = {"iron-ore", "copper-ore", "stone", "coal", "sulfur"}
    global.anno_soils = {}
    global.anno_soils["cold"] = {"apple_soil"}
    global.anno_soils["warm"] = {"sugar_cane_soil"}
end

reset_global_ores_and_soils()

local ore_patch_factor = 0.10
local soil_patch_factor = 0.20
local seperation_factor = 0.40

local function select_x(some_table, count)
    local shallow_copy = {}
    local result = {}

    for i, v in pairs(some_table) do
        table.insert(shallow_copy, v)
    end

    for var = 1, count do
        table.insert(result, table.remove(shallow_copy, math.random(1, #shallow_copy)))
    end

    return result
end

function roll_soils(count)
    if (math.random(0, 1) == 1) then
        return select_x(global.anno_soils["cold"], count)
    else
        return select_x(global.anno_soils["warm"], count)
    end
end

function roll_ores(count)
    return select_x(global.anno_ores, count)
end

sort_by_elev = function(a, b)
    return a.elev > b.elev
end

function place_resources(surface, island, soils, ores)
    local elevation = surface.calculate_tile_properties({"elevation"}, island)
    local ore_count = #elevation["elevation"] * ore_patch_factor
    local seperation_count = #elevation["elevation"] * (seperation_factor + ore_patch_factor)
    local soil_count = #elevation["elevation"] * soil_patch_factor
    soil_count = soil_count + seperation_count

    local position_elevation_pairs = {}

    --log(#elevation["elevation"])
    --log(ore_count)
    --log(seperation_count)
    --log(soil_count)

    for i, v in pairs(elevation["elevation"]) do
        table.insert(position_elevation_pairs, {elev = v, position = island[i]})
    end

    table.sort(position_elevation_pairs, sort_by_elev)

    --log(#position_elevation_pairs)

    for index = 1, ore_count do
        surface.create_entity {
            name = ores[1],
            position = position_elevation_pairs[index].position,
            amount = 1000
        }
    end

    for index = math.floor(seperation_count), soil_count do
        surface.create_entity {
            name = soils[1],
            position = position_elevation_pairs[index].position,
            amount = 1000
        }
    end
end
