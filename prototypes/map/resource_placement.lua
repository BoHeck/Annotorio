if (global.anno_soils == nil) then
    global.anno_soils = {}
    global.anno_soils["cold"] = {"apple_soil"}
    global.anno_soils["warm"] = {"sugar_cane_soil"}
end
if (global.anno_ores == nil) then
    global.anno_ores = {"iron-ore", "copper-ore", "stone", "coal"}
end

local function select_x(some_table, count)
    return {some_table[1]} --todo this needs to change once more soils are added
end

function roll_soils()
    if (math.random(0, 1) == 1) then
        return select_x(global.anno_soils["cold"], 1)
    else
        return select_x(global.anno_soils["warm"], 1)
    end
end

function roll_ores()
    return select_x(global.anno_ores, 1)
end

function place_resources(surface, island, soils, ores)
    for i, tile_position in pairs(island) do
        surface.create_entity {
            name = ores[1],
            position = tile_position,
            amount = 1000
        }
    end
end
