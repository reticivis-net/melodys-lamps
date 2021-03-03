local validEntityName = {"cool-lamp"}
--lifted straight from nixie source lol!
local filters = {}
local names = {}
for name in pairs(validEntityName) do
    filters[#filters + 1] = {filter = "name", name = name}
    filters[#filters + 1] = {filter = "ghost_name", name = name}
    names[#names + 1] = name
end

script.on_event(defines.events.on_built_entity,
                function(event) onPlaceEntity(event.created_entity) end, filters)
script.on_event(defines.events.on_robot_built_entity,
                function(event) onPlaceEntity(event.created_entity) end, filters)
script.on_event(defines.events.script_raised_built,
                function(event) onPlaceEntity(event.entity) end)
script.on_event(defines.events.script_raised_revive,
                function(event) onPlaceEntity(event.entity) end)
script.on_event(defines.events.on_entity_cloned,
                function(event) onPlaceEntity(event.destination) end)

script.on_event(defines.events.on_pre_player_mined_item,
                function(event) onRemoveEntity(event.entity) end, filters)
script.on_event(defines.events.on_robot_pre_mined,
                function(event) onRemoveEntity(event.entity) end, filters)
script.on_event(defines.events.on_entity_died,
                function(event) onRemoveEntity(event.entity) end, filters)
script.on_event(defines.events.script_raised_destroy,
                function(event) onRemoveEntity(event.entity) end)
