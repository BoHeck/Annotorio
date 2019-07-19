---------include these in the event collection-----------
--function ifHouseBuild()
--function ifHouseRemoved()
--function houses_on_every_x_ticks()  //////    script.on_nth_tick(everyXticks, houses_on_every_x_ticks)
--local everyXticks=60
-------------------------------------------------------

--Take a look at the Anotorio spreadsheet on
-- https://docs.google.com/spreadsheets/d/12XpO3NGwNVHsxEYYcaBZuqqXzK2D3cf86Yt9lEuyxoo/edit?usp=sharing

require("scripts.util")

--Its fine to set these globals up on every load

function setup_needs()
    global.pioneer_needs = {}
    global.pioneer_needs["anno_fish"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 21.18,
        DurabilityLossPerTick = 0.02083333333
    }
    global.pioneer_needs["cloth"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 77.92,
        DurabilityLossPerTick = 0.025
    }
    global.pioneer_needs["cider"] = {
        SellValuePerTick = settings.global["tax_multiplier"]["value"] * 67.5,
        DurabilityLossPerTick = 0.01
    }
end
--called just in case
setup_needs()

if (global.houses_pioneers == nil) then
    global.houses_pioneers = {}
end
if (global.houses_settler == nil) then
    global.houses_settler = {}
end

if (global.houses_citizen == nil) then
    global.houses_citizen = {}
end

local every_x_ticks = 60

-------------------------------------------------------------------------
function ifHouseBuild(event, entity_name)
    local ent = event.created_entity

    if (entity_name == "house_pioneer") then
        global.houses_pioneers[ent.unit_number] = ent
    end

    if (entity_name == "house_settler") then
        global.houses_settler[ent.unit_number] = ent
    end

    if (entity_name == "house_citizen") then
        global.houses_citizen[ent.unit_number] = ent
    end
end

function ifHouseRemoved(event, entity_name)
    local ent = event.entity

    if (entity_name == "house_pioneer") then
        global.houses_pioneers[ent.unit_number] = nil
    end

    if (entity_name == "house_settler") then
        global.houses_settler[ent.unit_number] = nil
    end

    if (entity_name == "house_citizen") then
        global.houses_citizen[ent.unit_number] = nil
    end
end

function convert_goods_into_money(houses, needs, power_interface)
    local income = 0
    for _, house in pairs(houses) do
        local inv = house.get_inventory(defines.inventory.assembling_machine_input)
        for need, value in pairs(needs) do
            local stack = inv.find_item_stack(need)
            if (stack ~= nil) then
                stack.drain_durability(value.DurabilityLossPerTick)
                income = income + value.SellValuePerTick
            end
        end
    end
    power_interface.power_production = income
end

function houses_on_every_x_ticks()
    local index
    for i, kontor in pairs(global.kontors) do --TODO this needs to change once players can have more than one kontor
        index = i
    end

    if (index ~= nil) then
        convert_goods_into_money(
            global.houses_pioneers,
            global.pioneer_needs,
            global.kontors[index].generator_for_pioneers
        )
    end
end
