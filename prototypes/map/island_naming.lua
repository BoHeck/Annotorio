if (global.used_island_names == nil) then
    global.used_island_names = {}
end
--names from https://www.fantasynamegenerators.com/island-names.php
if (global.available_island_names == nil) then
    global.available_island_names = {
        "The Eroded Reef",
        "The Clownfish Key",
        "Atinach Enclave",
        "Leeport Island",
        "Boxsevain Holm",
        "Parrning Archipelago",
        "Oxduff Cay",
        "The Rippling Cay",
        "The Triumphant Holm",
        "The Western Islet",
        "Colborough Islet",
        "Brentbour Peninsula",
        "Miltawa Cay",
        "Colinia Isles",
        "Stetstable Key",
        "Nottingly Islet",
        "The Pufferfish Skerry",
        "Colants Isles",
        "Leocord Reef",
        "Neestead Archipelago",
        "Maidset Key",
        "Springmer Cay",
        "Westcaster Cay",
        "The Boiling Islet",
        "The Moonlit Ait",
        "Harjour Skerry",
        "Stockgamau Skerry",
        "Valver Isle",
        "Scarslow Holm",
        "Endare Atoll",
        "The Fiery Islands",
        "Falfair Skerry",
        "Warris Cay",
        "Smithsbridge Isle",
        "Innisvons Islands",
        "Framingmont Cay",
        "Chilborough Island",
        "The Southern Islet",
        "The Glassy Reef",
        "Wareswell Isle",
        "Sanddwell Islands",
        "Corquet Holm",
        "Norsard Skerry",
        "Scarsbalt Island",
        "Gamterre Ait",
        "The Gray Skerry",
        "The Virgin Archipelago",
        "The Quiet Cay",
        "The Volcanic Skerry",
        "Gravenberry Haven",
        "Conher Islands",
        "Vermore Enclave",
        "Birshire Isles",
        "Naider Ait",
        "Waterpar Haven",
        "The Penguin Islands",
        "The Fountain Isle",
        "The Lobster Skerry",
        "Clarencour Isle",
        "Ellisrane Islands",
        "Allermis Peninsula",
        "Shelgrave Isles"
    }
end

function island_center(island)
    local index = 0
    local x = 0
    local y = 0

    for i, tile_position in pairs(island) do
        if (i % 100 == 0) then
            x = x + tile_position.x
            y = y + tile_position.y
            index = index + 1
        end
    end

    if (index > 0) then
        return {x / index, y / index}
    end
    return {0, 0}
end

function name_island(surface, island)
    log("name_island")
    if (#global.available_island_names < 1) then
        return
    end

    local position = island_center(island)
    log(position[1] .. "|" .. position[2])

    local index = math.random(1, #global.available_island_names)

    --local text = table.remove(global.available_island_names, index)
    text = global.available_island_names[index]

    table.insert(global.used_island_names, {surface = surface, position = position, text = text})

    add_chart_tag_for_all_forces(surface, position, text)
end

function add_chart_tag_for_all_forces(surface, position, text)
    log("tag_all")
    for i, force in pairs(game.forces) do
        log("tag")
        log(force.name)
        log(text)
        force.chart(surface, {{position[1] - 16, position[2] - 16}, {position[1] + 16, position[2] + 16}})

        force.add_chart_tag(surface, {position = position, text = text})
    end
end

function name_islands_on_force_created(event)
    for i, v in pairs(global.used_island_names) do
        event.force.add_chart_tag(v.surface, {position = v.position, text = v.text})
    end
end
