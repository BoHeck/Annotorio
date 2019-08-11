require("prototypes.map.finish_island")

local Area = require("__stdlib__/stdlib/area/area")
local Position = require("__stdlib__/stdlib/area/position")
local Chunk = require("__stdlib__/stdlib/area/chunk")

--local ground_collision_mask =   data.raw.tile["dirt-1"].collision_mask
local ground_collision_mask = {"ground-tile"}
--TODO do this dynamicly

--If a chunk is generated and it contains land then this script will force the game to generate all chunks connected to the land.
--This means if there is an island than all chunks containing the iland will be generated.
--There is a failsave if the map_gen is not set to anno_noise_expression

--global.called_from = {}
global.connected_to = {}
global.allready_checked = {}

function chart_chunk(surface, pos_x, pos_y)
    local area = Area.construct(pos_x, pos_y, pos_x + 31, pos_y + 31)
    for i, player in pairs(game.players) do
        player.force.chart(surface, area)
    end
end

function keep_track(chunk_pos, index)
    if (global.connected_to[chunk_pos.x] == nil) then
        global.connected_to[chunk_pos.x] = {}
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y] == nil) then
        global.connected_to[chunk_pos.x][chunk_pos.y] = {}
        global.connected_to[chunk_pos.x][chunk_pos.y][1] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][2] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][3] = false
        global.connected_to[chunk_pos.x][chunk_pos.y][4] = false
    end

    global.connected_to[chunk_pos.x][chunk_pos.y][index] = true
end

--This function is called on chunk generated event
-- a) It uses request_to_generate_chunks to all via land connected chunks
--This means an island will be generated completely (but not instantaneously)
-- b) It keeps track of land connections
-- c) It charts the requested chunks for all players
-- d) It checks when the island is ready  and calls finish(surface, chunk_pos)
function generate_hole_islands_on_chunk(event)
    local surface = event.surface
    local area = event.area

    local finish_ready = true

    if (surface.map_gen_settings.property_expression_names.elevation ~= "kap-islands-world2") then
        return
    end

    local chunk_pos = Position.to_chunk_position(area.left_top)

    if
        (check_edge(
            surface,
            Area.construct(area.left_top.x, area.left_top.y + 31, area.right_bottom.x, area.right_bottom.y),
            Area.construct(area.left_top.x, area.left_top.y + 32, area.right_bottom.x, area.right_bottom.y + 1)
        ))
     then
        keep_track(chunk_pos, 1)
        if (not surface.is_chunk_generated(chunk_pos + Position.construct(0, 1))) then
            finish_ready = false
            surface.request_to_generate_chunks({area.left_top.x, area.left_top.y + 32}, 0)
            chart_chunk(surface, area.left_top.x, area.left_top.y + 32)
        end
    end

    if
        (check_edge(
            surface,
            Area.construct(area.left_top.x, area.left_top.y, area.right_bottom.x, area.right_bottom.y - 31),
            Area.construct(area.left_top.x, area.left_top.y - 1, area.right_bottom.x, area.right_bottom.y - 32)
        ))
     then
        keep_track(chunk_pos, 2)
        if (not surface.is_chunk_generated(chunk_pos + Position.construct(0, -1))) then
            finish_ready = false
            surface.request_to_generate_chunks({area.left_top.x, area.left_top.y - 32}, 0)
            chart_chunk(surface, area.left_top.x, area.left_top.y - 32)
        end
    end

    if
        (check_edge(
            surface,
            Area.construct(area.left_top.x + 31, area.left_top.y, area.right_bottom.x, area.right_bottom.y),
            Area.construct(area.left_top.x + 32, area.left_top.y, area.right_bottom.x + 1, area.right_bottom.y)
        ))
     then
        keep_track(chunk_pos, 3)
        if (not surface.is_chunk_generated(chunk_pos + Position.construct(1, 0))) then
            finish_ready = false
            surface.request_to_generate_chunks({area.left_top.x + 32, area.left_top.y}, 0)
            chart_chunk(surface, area.left_top.x + 32, area.left_top.y)
        end
    end

    if
        (check_edge(
            surface,
            Area.construct(area.left_top.x, area.left_top.y, area.right_bottom.x - 31, area.right_bottom.y),
            Area.construct(area.left_top.x - 1, area.left_top.y, area.right_bottom.x - 32, area.right_bottom.y)
        ))
     then
        keep_track(chunk_pos, 4)
        if (not surface.is_chunk_generated(chunk_pos + Position.construct(-1, 0))) then
            finish_ready = false
            surface.request_to_generate_chunks({area.left_top.x - 32, area.left_top.y}, 0)
            chart_chunk(surface, area.left_top.x - 32, area.left_top.y)
        end
    end

    ----------------------------------------------------------------------------
    if (finish_ready) then
        local allready_checked = {}
        if (check_all_connected(surface, chunk_pos, allready_checked)) then
            finish(surface, chunk_pos)
        end
    end
end
--For the sake of simplicity : 2 chunks are connected if there is at least 1 land tile on the edge area
function check_edge(surface, edge_area, edge_area2)
    return 1 == surface.count_tiles_filtered {area = edge_area, limit = 1, collision_mask = ground_collision_mask} and
        1 == surface.count_tiles_filtered {area = edge_area2, limit = 1, collision_mask = ground_collision_mask}
end

--returns true if all chunks reachable from given chunk over any number of connections are generated
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

    return ((not global.connected_to[chunk_pos.x][chunk_pos.y][1]) or
        check_all_connected(surface, chunk_pos + Position.construct(0, 1), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][2]) or
            check_all_connected(surface, chunk_pos + Position.construct(0, -1), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][3]) or
            check_all_connected(surface, chunk_pos + Position.construct(1, 0), allready_checked)) and
        ((not global.connected_to[chunk_pos.x][chunk_pos.y][4]) or
            check_all_connected(surface, chunk_pos + Position.construct(-1, 0), allready_checked))
end
