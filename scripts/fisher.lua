require("scripts.util")

if (global.fish_jackpot == nil) then
    global.fish_jackpot = 0
end

local applicable_tiles = {"water", "water-green", "water-mud", "water-shallow"}
local fish_per_tile = 0.5
local spawn_probability_per_tile = 0.0075
local min_jackpot_size = 60
local generator

function map_generation_fish_resource(event, surface_index)
    local tiles = game.surfaces[surface_index].find_tiles_filtered {area = event.area, name = applicable_tiles}
    local size = table_size(tiles)
    local new_jackpot = global.fish_jackpot + size * fish_per_tile
    local area_seed = event.area.left_top.x * 65.536 + event.area.left_top.y
    local map_seed = game.surfaces[surface_index].map_gen_settings.seed

    --debug_print(new_jackpot)

    generator = game.create_random_generator()
    generator.re_seed(bit32.bxor(area_seed, map_seed))
    if
        (new_jackpot >= min_jackpot_size and new_jackpot >= min_jackpot_size and
            generator(0.00001, 1) > (1 - spawn_probability_per_tile * size))
     then
        place_fish_resource(tiles, size, new_jackpot, game.surfaces[surface_index])
    else
        global.fish_jackpot = new_jackpot
    end
end

function place_fish_resource(tiles, tiles_size, fish_amount, target_surface)
    --pick a random tile which is the position we spawn the fish at

    local tile = tiles[math.floor(generator(1, tiles_size))]

    local ent =
        target_surface.create_entity {
        name = "fish_fluid",
        position = tile.position,
        amount = fish_amount
    }

    if (ent == nil) then
        log("fish_fluid nil")
    end

    target_surface.create_entity {
        name = "fish_fluid_animation_overlay",
        position = tile.position
    }

    global.fish_jackpot = 0
end
