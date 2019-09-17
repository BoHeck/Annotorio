function queue_technology(force)
    if (force.add_research("settle_island")) then
        return
    end

    if (force.add_research("feed_your_people")) then
        return
    end

    if (force.add_research("grow_1")) then
        return
    end

    if (force.add_research("dress_your_people_1")) then
        return
    end

    if (force.add_research("upgrade_your_kontor_1")) then
        return
    end

    if (force.add_research("drink_for_the_people_1")) then
        return
    end

    if (force.add_research("provide_luxus_1")) then
        return
    end

    if (force.add_research("drink_for_the_people_2")) then
        return
    end
end

function set_progress(force, technology, progress)
    if (force.technologies[technology].researched == false) then
        force.add_research(technology)
        force.research_progress = math.min(progress, 1)
    end
end

if (global.anno_technology_requierements == nil) then
    global.anno_technology_requierements = {}

    global.anno_technology_requierements["feed_your_people"] = {amount = 8, different_goods = 1}
    global.anno_technology_requierements["grow_1"] = {amount = 20, different_goods = 1}
    global.anno_technology_requierements["dress_your_people_1"] = {amount = 18, different_goods = 2}
    global.anno_technology_requierements["drink_for_the_people_1"] = {amount = 22, different_goods = 3}
    global.anno_technology_requierements["provide_luxus_1"] = {amount = 26, different_goods = 4}
    global.anno_technology_requierements["drink_for_the_people_2"] = {amount = 38, different_goods = 5}
end

if (global.anno_technology_building_requierements == nil) then
    global.anno_technology_building_requierements = {}

    global.anno_technology_building_requierements["settle_island"] = {{amount = 1, name = "Kontor"}}
end

if (global.anno_technology_resource_requierements == nil) then
    global.anno_technology_resource_requierements = {}

    global.anno_technology_resource_requierements["upgrade_your_kontor_1"] = {
        {amount = 40, name = "ceramics"},
        {amount = 4, name = "anno_tool"},
        {amount = 24, name = "wood"}
    }
end
