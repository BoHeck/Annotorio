require("prototypes.map.island_naming")
require("prototypes.map.resource_placement")

local Area = require("__stdlib__/stdlib/area/area")
local Position = require("__stdlib__/stdlib/area/position")
local Chunk = require("__stdlib__/stdlib/area/chunk")

local ground_collision_mask = {"ground-tile"}
local water_collision_mask = {"water-tile"}

local ground_tiles
local minimal_island_size = 4096

if (global.mapped_chunks == nil) then
    global.mapped_chunks = {}
end

function init_ground_tiles()
    if (ground_tiles == nil) then
        ground_tiles = {}
    else
        return
    end

    for i, tile in pairs(game.tile_prototypes) do
        if (tile.collision_mask["ground-tile"]) then
            table.insert(ground_tiles, tile.name)
        end
    end
end

local function remove_tiles(tiles, remove_these)
    local new_tiles = {}
    for i, tile in pairs(tiles) do
        if (remove_these[tile.position.x] == nil or remove_these[tile.position.x][tile.position.y] == nil) then
            table.insert(new_tiles, tile)
        end
    end
    return new_tiles
end

function convert(positions)
    local result = {}
    for i, position in pairs(positions) do
        if (result[position.x] == nil) then
            result[position.x] = {}
        end
        result[position.x][position.y] = true
    end
    return result
end

--a) This functions find all the islands in this and all connected chunks
local function divide_per_island(surface, tiles)
    local index = 1
    local islands = {}
    init_ground_tiles()

    ----log("BEGIN divide_per_island")

    while (#tiles > 0) do
        --log("tiles " .. #tiles)
        --buffer filled by flood_fill
        ----log("PRE flood_fill")
        local buffer = surface.get_connected_tiles(table.remove(tiles).position, ground_tiles)
        islands[index] = buffer
        --log("buffer " .. #buffer)
        buffer = convert(buffer)
        -- flood_fill(surface, table.remove(tiles).position, buffer, ground_tiles)

        tiles = remove_tiles(tiles, buffer)

        --  for i, tile in pairs(tiles) do
        --      --log(tile.position.x .. "|" .. tile.position.y)
        --   end
        --   --log("tiles " .. #tiles)

        index = index + 1
    end

    ----log("END divide_per_island")
    return islands
end

local function finish_island(surface, island)
    log("finish_island..size " .. #island)
    --------------------------------------
    --to small islands get destroyed
    if (#island < minimal_island_size) then
        tile_changes = {}

        for i, tile_position in pairs(island) do
            table.insert(tile_changes, {name = "water-shallow", position = tile_position})
        end

        surface.set_tiles(tile_changes)
        return
    end
    --------------------------------------
    --to small islands get destroyed

    tile_changes = {}

    for i, tile_position in pairs(island) do
        table.insert(tile_changes, {name = "concrete", position = tile_position})
    end

    surface.set_tiles(tile_changes)

    --------------------------------------
    name_island(surface, island)
    --------------------------------------
    local soils = roll_soils()
    local ores = roll_ores()
    --place_resources(surface, island, soils, ores)
end

--This function is mainly for debugging
--It writes tile changes into a table to be used in surface.set_tiles(tile_changes)
--Land tiles will be changed with concrete, water tiles with green water
--i,j are the chunk_position
--some_table is the table which will be filled
function debug_color_island_group(surface, some_table, i, j)
    local buffer =
        surface.find_tiles_filtered {
        area = Chunk.to_area(Position.construct(i, j)),
        collision_mask = ground_collision_mask
    }

    for k, tile in pairs(buffer) do
        table.insert(some_table, {name = "concrete", position = tile.position})
    end

    buffer =
        surface.find_tiles_filtered {
        area = Chunk.to_area(Position.construct(i, j)),
        collision_mask = water_collision_mask
    }

    for k, tile in pairs(buffer) do
        table.insert(some_table, {name = "water-green", position = tile.position})
    end
end

function finish_island_group(surface, chunk_pos)
    log("finish " .. chunk_pos.x .. "|" .. chunk_pos.y .. "---------------")
    --Last check if this has allready been generated
    if (global.mapped_chunks[chunk_pos.x] ~= nil and global.mapped_chunks[chunk_pos.x][chunk_pos.y]) then
        return
    end

    local chunks = get_connected_chunks(chunk_pos)
    local tiles = {}

    tile_changes = {}
    for i, v in pairs(chunks) do
        for j, w in pairs(chunks[i]) do
            --debug_color_island_group(surface, tile_changes, i, j)

            --------------------------------------
            --Record that this chunk has been mapped
            if (global.mapped_chunks[i] == nil) then
                global.mapped_chunks[i] = {}
            end
            global.mapped_chunks[i][j] = true
            log(i .. "|" .. j)
            --------------------------------------
            local buffer =
                surface.find_tiles_filtered {
                area = Chunk.to_area(Position.construct(i, j)),
                collision_mask = ground_collision_mask
            }
            --log(#buffer)
            for i, tile in pairs(buffer) do
                table.insert(tiles, tile)
            end
        end
    end
    --surface.set_tiles(tile_changes)

    local islands = divide_per_island(surface, tiles)

    for i, island in pairs(islands) do
        finish_island(surface, island)
    end
end

local function get_connected_chunks_helper(chunk_pos, chunks)
    -------------------------------
    --if the chunk has already been mapped (which can happen if a newly generated chunk connects to an already generated island group)
    if (global.mapped_chunks[chunk_pos.x] ~= nil and global.mapped_chunks[chunk_pos.x][chunk_pos.y]) then
        return
    end
    -------------------------------
    --initialize so we dont have any crashes
    if (chunks[chunk_pos.x] == nil) then
        chunks[chunk_pos.x] = {}
    end
    -------------------------------
    --if this has allready been visited then return
    if (chunks[chunk_pos.x][chunk_pos.y] == true) then
        return chunks
    end

    chunks[chunk_pos.x][chunk_pos.y] = true
    -------------------------------
    --return in case check these tables dont exist (Not sure if this can be removed in the current state)
    if (global.connected_to[chunk_pos.x] == nil) then
        return chunks
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y] == nil) then
        return chunks
    end
    -------------------------------
    if (global.connected_to[chunk_pos.x][chunk_pos.y][15]) then
        get_connected_chunks_helper(chunk_pos + Position.construct(0, 1), chunks)
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y][5]) then
        get_connected_chunks_helper(chunk_pos + Position.construct(0, -1), chunks)
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y][12]) then
        get_connected_chunks_helper(chunk_pos + Position.construct(1, 0), chunks)
    end
    if (global.connected_to[chunk_pos.x][chunk_pos.y][8]) then
        get_connected_chunks_helper(chunk_pos + Position.construct(-1, 0), chunks)
    end
    -------------------------------
    return chunks
end

--Returns a table of chunk positions which are supposed to be used with Chunk.to_area
--Note only save to call then once all connected chunks have been generated
function get_connected_chunks(chunk_pos)
    return get_connected_chunks_helper(chunk_pos, {})
end
