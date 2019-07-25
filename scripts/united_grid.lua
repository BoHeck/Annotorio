--The purpose of this script is to unite the electric grid into one, regardless of distance
--This is done by creating connections via script
--The electric poles will create a chain which is saved in a table as a double linked list.

function add_to_the_grid(entity)
    --If this is the first time something is added then there can not be made a connection
    if (global.anno_grid_current_head == nil) then
        global.anno_grid = {}
        global.anno_grid[entity.unit_number] = {pole = entity, previous = nil, next = nil}
        global.anno_grid_current_head = entity.unit_number
        return
    end

    --Since there is a limit  to wire length we teleport the entity  forth and back which is an exploit
    local old_position = entity.position

    entity.teleport(global.anno_grid[global.anno_grid_current_head].pole.position)
    entity.connect_neighbour(global.anno_grid[global.anno_grid_current_head].pole)
    entity.teleport(old_position)

    --Add new element to the list
    global.anno_grid[entity.unit_number] = {pole = entity, previous = global.anno_grid_current_head, next = nil}
    --Link the last head of the list to the new element
    global.anno_grid[global.anno_grid_current_head].next = entity.unit_number
    --Set the new head
    global.anno_grid_current_head = entity.unit_number
end

function remove_from_grid(entity)
    if (global.anno_grid[entity.unit_number] ~= nil) then
        local elem = global.anno_grid[entity.unit_number]

        --Fix the list by linking the previous and next element
        if (elem.previous ~= nil) then
            global.anno_grid[elem.previous].next = elem.next
        end
        if (elem.next ~= nil) then
            global.anno_grid[elem.next].previous = elem.previous
        end

        --Fix grid by connection previous and next pole
        if (elem.previous ~= nil and elem.next ~= nil) then
            local prev = global.anno_grid[elem.previous].pole
            local next = global.anno_grid[elem.next].pole

            local old_position = next.position

            next.teleport(prev.position)
            next.connect_neighbour(prev)
            next.teleport(old_position)
        end

        --Fix current head
        if (global.anno_grid_current_head == entity.unit_number) then
            global.anno_grid_current_head= elem.previous
        end

        --Delete
        global.anno_grid[entity.unit_number] = nil
    end
end
