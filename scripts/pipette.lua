require("scripts.util")

function pipette_init()
    if (global == nil) then
        global = {}
    end
    if (global.pipette_pair == nil) then
        global.pipette_pair = {}
    end

    for i, recipe in pairs(game.recipe_prototypes) do
        if (recipe.products[1] ~= nil) then
            if (recipe.name == recipe.products[1].name) then
                global.pipette_pair[recipe.products[1].name] = recipe --This might not seem usefull now but it enables us to later  add pairs by hand....
            end
        end
    end
end

----------------------------------------------------------------------------

function produce_item_on_pipette(event)
    local player = game.players[event.player_index]

    if (player.cursor_ghost ~= nil) then --The player does not have the needed item in his inventory  which is why he got a ghost
        local recipe = global.pipette_pair[player.cursor_ghost.name]

        if (recipe ~= nil) then --Is there a recipe that makes the item
            if (recipe.enabled and player.get_craftable_count(recipe.name) > 0) then --Item can be crafted
                for i, ingredient in pairs(recipe.ingredients) do
                    player.get_main_inventory().remove({name = ingredient.name, count = ingredient.amount})
                end

                player.cursor_stack.set_stack({name = player.cursor_ghost.name, count = 1})
            end
        end
    end
end
