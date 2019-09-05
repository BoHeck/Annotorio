require("prototypes.map.finish_island")
require("scripts.util")


local Area = require("__stdlib__/stdlib/area/area")
local Position = require("__stdlib__/stdlib/area/position")
local Chunk = require("__stdlib__/stdlib/area/chunk")

--local ground_collision_mask =   data.raw.tile["dirt-1"].collision_mask
local ground_collision_mask = {"ground-tile"}
--TODO do this dynamicly

--If a chunk is generated and it contains land then this script will force the game to generate all chunks connected to the land.
--This means if there is an island than all chunks containing the iland will be generated.
--There is a failsave if the map_gen is not set to anno_noise_expression

if (global.connected_to == nil) then
    global.connected_to = {}
end
if (global.chunks_for_later == nil) then
    global.chunks_for_later = {}
end

------------------------------------------------------
local offset = {}
local offset2 = {}
offset[1] = {}
offset[0] = {}
offset[-1] = {}
offset2[1] = {}
offset2[0] = {}
offset2[-1] = {}

offset[1][0] = Area.construct(31, 0, 0, 0)
offset2[1][0] = Area.construct(32, 0, 1, 0)

offset[-1][0] = Area.construct(0, 0, -31, 0)
offset2[-1][0] = Area.construct(-1, 0, -32, 0)

offset[0][1] = Area.construct(0, 31, 0, 0)
offset2[0][1] = Area.construct(0, 32, 0, 1)

offset[0][-1] = Area.construct(0, 0, 0, -31)
offset2[0][-1] = Area.construct(0, -1, 0, -32)
------------------------------------------------------

function keep_track(chunk_pos, index, flag)
    if (global.connected_to[chunk_pos.x] == nil) then
        global.connected_to[chunk_pos.x] = {}
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y] == nil) then
        global.connected_to[chunk_pos.x][chunk_pos.y] = {}
        global.connected_to[chunk_pos.x][chunk_pos.y][8] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][12] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][5] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][15] = false
    end

    global.connected_to[chunk_pos.x][chunk_pos.y][index] = flag
end

--Returns false if there is a connection to a chunk which is not generated
--Main function is to record connections between chunks
--Chunks are considered connected if there is at least one land tile on either side of the edge
--This might not find a connection if the other chunk has not been generated but it will request the generation of the chunk
-- x,y state the direction
-- area is the is the area of the chunk specified by chunk_pos
function check_in_direction(surface, chunk_pos, area, x, y)
    local own_edge =
        check_edge(
        surface,
        Area.construct(
            area.left_top.x + offset[x][y].left_top.x,
            area.left_top.y + offset[x][y].left_top.y,
            area.right_bottom.x + offset[x][y].right_bottom.x,
            area.right_bottom.y + offset[x][y].right_bottom.y
        )
    )

    if (own_edge) then
        keep_track(chunk_pos, 10 + x * 2 + 5 * y, true)
        keep_track(chunk_pos + Position.construct(x, y), 10 - x * 2 - 5 * y, true)

        if (not surface.is_chunk_generated(chunk_pos + Position.construct(x, y))) then
            surface.request_to_generate_chunks({area.left_top.x + x * 32, area.left_top.y + y * 32}, 0)
            chart_chunk(surface, area.left_top.x + x * 32, area.left_top.y + y * 32)

            return false
        else
            return true
        end
    end

    if (surface.is_chunk_generated(chunk_pos + Position.construct(x, y))) then
        if
            (check_edge(
                surface,
                Area.construct(
                    area.left_top.x + offset2[x][y].left_top.x,
                    area.left_top.y + offset2[x][y].left_top.y,
                    area.right_bottom.x + offset2[x][y].right_bottom.x,
                    area.right_bottom.y + offset2[x][y].right_bottom.y
                )
            ))
         then
            keep_track(chunk_pos, 10 + x * 2 + 5 * y, true)
            keep_track(chunk_pos + Position.construct(x, y), 10 - x * 2 - 5 * y, true)
        end
        return true
    else
        return true
    end
end

--This function is called on chunk generated event
-- a) It uses request_to_generate_chunks to all via land connected chunks
--This means an island will be generated completely (but not instantaneously)
-- b) It keeps track of land connections
-- c) It charts the requested chunks for all players
-- d) It checks when the island is ready  and calls finish_island_group(surface, chunk_pos)
function generate_hole_islands_on_chunk(event)
    local surface = event.surface
    local area = event.area

    generate_hole_islands_on_chunk2(surface, area)
end

function generate_hole_islands_on_chunk2(surface, area)
    local finish_ready = true

    if (surface.map_gen_settings.property_expression_names.elevation ~= "anno_noise_expression") then
        debug_print("Warning: You are not using the Annotorio Map Preset")
        return
    end

    local chunk_pos = Position.to_chunk_position(area.left_top)

    local right = check_in_direction(surface, chunk_pos, area, 1, 0)
    local left = check_in_direction(surface, chunk_pos, area, -1, 0)
    local up = check_in_direction(surface, chunk_pos, area, 0, 1)
    local down = check_in_direction(surface, chunk_pos, area, 0, -1)

    --log("left " .. tostring(left) .. " right " .. tostring(right) .. " up " .. tostring(up) .. " down " .. tostring(down))

    finish_ready = finish_ready and right
    finish_ready = finish_ready and left
    finish_ready = finish_ready and up
    finish_ready = finish_ready and down

    ----------------------------------------------------------------------------
    if (finish_ready) then
        local allready_checked = {}
        if (check_all_connected(surface, chunk_pos, allready_checked)) then
            if (game.tick > 10) then
                finish_island_group(surface, chunk_pos)
            else
                table.insert(global.chunks_for_later, {surface = surface, position = chunk_pos})
            end
        end
    end
end

--This function is supposed to be called only once.
--It calls finish_island_group for all the chunks which were generated in the first 10 ticks.
function catch_up_on_tick()
    for i, v in pairs(global.chunks_for_later) do
        generate_hole_islands_on_chunk2(v.surface, Chunk.to_area(v.position))
        --finish_island_group(v.surface, v.position)
    end
end

--Returns true if there is at least one land tile in the area
function check_edge(surface, edge_area)
    return 1 == surface.count_tiles_filtered {area = edge_area, limit = 1, collision_mask = ground_collision_mask}
end

--Returns true if all chunks reachable from given chunk over any number of connections are generated
function check_all_connected(surface, chunk_pos, allready_checked)
    if (allready_checked[chunk_pos.x] ~= nil and allready_checked[chunk_pos.x][chunk_pos.y] == true) then
        return true
    end

    if (not surface.is_chunk_generated(chunk_pos)) then
        return false
    end

    -----------------------------------------------
    if (allready_checked[chunk_pos.x] == nil) then
        allready_checked[chunk_pos.x] = {}
    end
    allready_checked[chunk_pos.x][chunk_pos.y] = true
    -----------------------------------------------

    if (global.connected_to[chunk_pos.x] == nil or global.connected_to[chunk_pos.x][chunk_pos.y] == nil) then
        return true
    end

    return ((not global.connected_to[chunk_pos.x][chunk_pos.y][15]) or
        check_all_connected(surface, chunk_pos + Position.construct(0, 1), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][5]) or
            check_all_connected(surface, chunk_pos + Position.construct(0, -1), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][12]) or
            check_all_connected(surface, chunk_pos + Position.construct(1, 0), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][8]) or
            check_all_connected(surface, chunk_pos + Position.construct(-1, 0), allready_checked))
end
