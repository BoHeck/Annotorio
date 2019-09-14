--------------------------------------------------------------
-----------Begin Water Rail Pictures from Cargo Ships by schnurrebutz permission granted by author
--------------------------------------------------------------
railpictures = function(invisible)
    return railpicturesinternal(
        {
            {"metals", "metals", mipmap = true},
            {"backplates", "backplates", mipmap = true},
            {"ties", "ties"},
            {"stone_path", "stone-path"},
            {"segment_visualisation_middle", "segment-visualisation-middle"},
            {"segment_visualisation_ending_front", "segment-visualisation-ending-1"},
            {"segment_visualisation_ending_back", "segment-visualisation-ending-2"},
            {"segment_visualisation_continuing_front", "segment-visualisation-continuing-1"},
            {"segment_visualisation_continuing_back", "segment-visualisation-continuing-2"}
        },
        invisible
    )
end

railpicturesinternal = function(elems, invisible)
    local railBlockKeys = {
        segment_visualisation_middle = true,
        segment_visualisation_ending_front = true,
        segment_visualisation_ending_back = true,
        segment_visualisation_continuing_front = true,
        segment_visualisation_continuing_back = true
    }

    local keys = {
        {"straight_rail", "horizontal", 64, 64, 0, 0},
        {"straight_rail", "vertical", 64, 64, 0, 0},
        {"straight_rail", "diagonal-left-top", 64, 64, 0, 0},
        {"straight_rail", "diagonal-right-top", 64, 64, 0, 0},
        {"straight_rail", "diagonal-right-bottom", 64, 64, 0, 0},
        {"straight_rail", "diagonal-left-bottom", 64, 64, 0, 0},
        {"curved_rail", "vertical-left-top", 128, 256, 0, 0},
        {"curved_rail", "vertical-right-top", 128, 256, 0, 0},
        {"curved_rail", "vertical-right-bottom", 128, 256, 0, 0},
        {"curved_rail", "vertical-left-bottom", 128, 256, 0, 0},
        {"curved_rail", "horizontal-left-top", 256, 128, 0, 0},
        {"curved_rail", "horizontal-right-top", 256, 128, 0, 0},
        {"curved_rail", "horizontal-right-bottom", 256, 128, 0, 0},
        {"curved_rail", "horizontal-left-bottom", 256, 128, 0, 0}
    }
    local res = {}

    postfix = ""
    --settings.startup["use_dark_blue_waterways"].value
    if false then
        postfix = "-dark"
    end

    for _, key in ipairs(keys) do
        part = {}
        dashkey = key[1]:gsub("_", "-")
        for _, elem in ipairs(elems) do
            if (elem[1] == "metals" and not invisible) then
                part[elem[1]] = {
                    sheet = {
                        filename = string.format(
                            "__Annotorio__/graphics/entity/%s%s/%s-%s-%s.png",
                            dashkey,
                            postfix,
                            dashkey,
                            key[2],
                            elem[2]
                        ),
                        priority = "extra-high",
                        flags = elem.mipmap and {"icon"},
                        width = key[3],
                        height = key[4],
                        shift = {key[5], key[6]},
                        variation_count = 1
                    }
                }
            elseif (railBlockKeys[elem[1]] ~= nil) then
                part[elem[1]] = {
                    filename = string.format(
                        "__Annotorio__/graphics/entity/%s/%s-%s-%s.png",
                        dashkey,
                        dashkey,
                        key[2],
                        elem[2]
                    ),
                    priority = "extra-high",
                    flags = elem.mipmap and {"icon"},
                    width = key[3],
                    height = key[4],
                    shift = {key[5], key[6]},
                    variation_count = 1
                }
            else
                part[elem[1]] = {
                    sheet = {
                        filename = string.format("__Annotorio__/graphics/blank.png", dashkey, dashkey, key[2], elem[2]),
                        priority = "extra-high",
                        flags = elem.mipmap and {"icon"},
                        width = 2,
                        height = 2,
                        shift = {0, 0},
                        variation_count = 1
                    }
                }
            end
        end

        dashkey2 = key[2]:gsub("-", "_")
        res[key[1] .. "_" .. dashkey2] = part
    end
    res["rail_endings"] = {
        sheets = {
            {
                filename = "__Annotorio__/graphics/blank.png",
                priority = "high",
                width = 4,
                height = 4
            },
            {
                filename = "__Annotorio__/graphics/blank.png",
                priority = "high",
                flags = {"icon"},
                width = 4,
                height = 4
            }
        }
    }
    return res
end

--------------------------------------------------------------
-----------End Water Rail Pictures ---------------------------
--------------------------------------------------------------

local water_rail_straight = table.deepcopy(data.raw["straight-rail"]["straight-rail"])
local water_rail_curved = table.deepcopy(data.raw["curved-rail"]["curved-rail"])

water_rail_curved.name = "water_rail_curved"
water_rail_straight.name = "water_rail_straight"

water_rail_curved.collision_mask = {"layer-14", "doodad-layer"}
water_rail_straight.collision_mask = {"layer-14", "doodad-layer"}

water_rail_curved.minable.result = "water_rail_straight"
water_rail_straight.minable.result = "water_rail_straight"

water_rail_curved.placeable_by = {item = "water_rail_straight", count = 1}
water_rail_straight.placeable_by = {item = "water_rail_straight", count = 1}

water_rail_curved.selection_priority = 49
water_rail_straight.selection_priority = 49

water_rail_curved.pictures = railpictures()
water_rail_straight.pictures = railpictures()

function buoy_stripes()
    local result = {}

    for index = 30, 90, 1 do
        table.insert(
            result,
            {
                filename = "__Annotorio__/graphics/entity/buoy/" .. "00" .. tostring(index) .. ".png",
                width_in_frames = 1,
                height_in_frames = 1
            }
        )
    end
    return result
end

local buoy_anim = {
    frame_count = 61,
    stripes = buoy_stripes(),
    priority = "high",
    width = 81,
    height = 137,
    scale = 0.5,
    shift = util.by_pixel(-1, -8),
}

local harbor = table.deepcopy(data.raw["train-stop"]["train-stop"])
harbor.name = "anno_harbor"
harbor.flags = {"filter-directions"}
harbor.collision_mask = {}
harbor.minable = nil
harbor.animations = {
    north = buoy_anim,
    south = buoy_anim,
    east = buoy_anim,
    west = buoy_anim
}
harbor.animation_ticks_per_frame=2

harbor.rail_overlay_animations = nil
harbor.top_animations = nil
harbor.working_sound = nil
harbor.light1 = nil
harbor.light2 = nil

local rail_chain_signal = table.deepcopy(data.raw["rail-chain-signal"]["rail-chain-signal"])
rail_chain_signal.name = "rail_chain_signal"
rail_chain_signal.collision_mask = {"layer-14", "doodad-layer"}
rail_chain_signal.minable.result = "rail_chain_signal"

local rail_signal = table.deepcopy(data.raw["rail-signal"]["rail-signal"])
rail_signal.name = "rail_signal"
rail_signal.collision_mask = {"layer-14", "doodad-layer"}
rail_signal.minable.result = "rail_signal"

data:extend(
    {
        rail_chain_signal,
        rail_signal,
        harbor,
        water_rail_curved,
        water_rail_straight,
        {
            type = "item",
            name = "anno_harbor",
            icon = "__base__/graphics/icons/train-stop.png",
            icon_size = 32,
            subgroup = "ships_misc",
            order = "a[train-system]-c[train-stop]",
            place_result = "anno_harbor",
            stack_size = 10
        },
        {
            type = "item",
            name = "rail_signal",
            icon = "__base__/graphics/icons/rail-signal.png",
            icon_size = 32,
            subgroup = "ships_misc",
            order = "a[train-system]-d[rail-signal]",
            place_result = "rail_signal",
            stack_size = 50
        },
        {
            type = "item",
            name = "rail_chain_signal",
            icon = "__base__/graphics/icons/rail-chain-signal.png",
            icon_size = 32,
            subgroup = "ships_misc",
            order = "a[train-system]-e[rail-signal-chain]",
            place_result = "rail_chain_signal",
            stack_size = 50
        },
        --item
        {
            type = "rail-planner",
            name = "water_rail_straight",
            icon = "__Annotorio__/graphics/icons/water_rail_icon.png",
            icon_size = 64,
            localised_name = {"item-name.water_rail_straight"},
            subgroup = "ships_misc",
            order = "a",
            place_result = "water_rail_straight",
            stack_size = 200,
            straight_rail = "water_rail_straight",
            curved_rail = "water_rail_curved"
        },
        --recipe
        {
            type = "recipe",
            name = "water_rail_straight",
            ingredients = {},
            result = "water_rail_straight",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --recipe
        {
            type = "recipe",
            name = "rail_chain_signal",
            ingredients = {},
            result = "rail_chain_signal",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        },
        --recipe
        {
            type = "recipe",
            name = "rail_signal",
            ingredients = {},
            result = "rail_signal",
            energy_required = 0.1,
            --5
            enabled = true,
            hidden = false,
            allow_as_intermediate = true
        }
    }
)
