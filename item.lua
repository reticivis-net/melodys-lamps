local coollamp = table.deepcopy(data.raw["lamp"]["small-lamp"]) 

coollamp.name = "cool-lamp"
coollamp.icons = {
    {icon = coollamp.icon, tint = {r = 0, g = 1, b = 0, a = 0.3}}
}
coollamp.minable.result = "cool-lamp"

local coollampitem = table.deepcopy(data.raw.item["small-lamp"])
coollampitem.name = "cool-lamp"
coollampitem.icons = {
    {icon = coollampitem.icon, tint = {r = 0, g = 1, b = 0, a = 0.3}}
}
coollampitem.place_result = "cool-lamp"

local recipe = table.deepcopy(data.raw["recipe"]["small-lamp"])
recipe.enabled = true
recipe.name = "cool-lamp"
recipe.result = "cool-lamp"

data:extend{coollamp, recipe, coollampitem}