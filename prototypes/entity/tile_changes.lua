collision_maskForWaterTiles = {
    "water-tile",
    "item-layer",
    --"player-layer",
    "layer-15"
}

collision_maskForLandTiles = {
    "ground-tile",
    "layer-14"
}

collision_mask_for_land_resources = {
    "resource-layer",
    "layer-15"
}

--Change collision of water tiles
for i, v in pairs(data.raw.tile) do
    if (v.draw_in_water_layer) then --This should be the clear sign of a water tile
        v.collision_mask = collision_maskForWaterTiles
    else
        v.collision_mask = collision_maskForLandTiles
    end
end

--Change collision of Resources
for i, v in pairs(data.raw.resource) do
    v.collision_mask = collision_mask_for_land_resources
end

-------
--data.raw.tile["water-shallow"].map_color = {r = 0.257, g = 0.425, b = 0.472}
data.raw.tile["water-shallow"].map_color = {r = 0.212, g = 0.351, b = 0.390}
-------
--to counteract changed made by Noxys_Swimming_0.1.2
for i, water_tile in pairs({"water", "water-green", "deepwater", "deepwater-green"}) do
    data.raw.tile[water_tile].vehicle_friction_modifier = 1
    --todo what about shallow water?
end
-------

for i, v in pairs(data.raw["optimized-decorative"]) do
    if (v.collision_mask == nil) then
        v.collision_mask = {"layer-15", "colliding-with-tiles-only"}
    else
        table.insert(v.collision_mask, "layer-15")
        table.insert(v.collision_mask, "colliding-with-tiles-only")
    end
end

for i, v in pairs(data.raw.decorative) do
    if (v.collision_mask == nil) then
        v.collision_mask = {"layer-15", "colliding-with-tiles-only"}
    else
        table.insert(v.collision_mask, "layer-15")
        table.insert(v.collision_mask, "colliding-with-tiles-only")
    end
end
