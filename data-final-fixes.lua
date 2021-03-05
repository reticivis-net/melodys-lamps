-- this fixes lamps not showing offscreen, might cause lag but troll!
-- its in this file so no other mod messes with it because it breaks the mod if its not big enoughj :/
local limit = 255
if data.raw["utility-constants"]["default"]["light_renderer_search_distance_limit"] and
    data.raw["utility-constants"]["default"]["light_renderer_search_distance_limit"] <
    limit then
    data.raw["utility-constants"]["default"]["light_renderer_search_distance_limit"] =
        limit
end
