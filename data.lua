local coollamp = table.deepcopy(data.raw["lamp"]["small-lamp"])

coollamp.name = "cool-lamp"
coollamp.icon = "__melodys-lamps__/cool-lamp.png"
coollamp.minable.result = "cool-lamp"
coollamp.always_on = true
coollamp.light = {type = "basic", intensity = 0, size = 0, color = {0, 0, 0, 0}}
coollamp.light_when_colored = {
    type = "basic",
    intensity = 0,
    size = 0,
    color = {0, 0, 0, 0}
}
coollamp.signal_to_color_mapping = {}
local coollampitem = table.deepcopy(data.raw.item["small-lamp"])
coollampitem.name = "cool-lamp"
coollampitem.icon = "__melodys-lamps__/cool-lamp.png"
coollampitem.place_result = "cool-lamp"

local recipe = table.deepcopy(data.raw["recipe"]["small-lamp"])
recipe.enabled = true
recipe.name = "cool-lamp"
recipe.result = "cool-lamp"
recipe.ingredients = {{"small-lamp", 3}, {"electronic-circuit", 1}}

local coollight = table.deepcopy(coollamp.picture_on)
coollight.name = "cool-light"
coollight.type = "sprite"

coollamp.picture_on = table.deepcopy(coollamp.picture_off) -- troll!

local biglamp = table.deepcopy(data.raw["lamp"]["small-lamp"])

biglamp.name = "big-lamp"
biglamp.icon = "__melodys-lamps__/cool-lamp.png"
biglamp.minable.result = "big-lamp"
biglamp.always_on = true
biglamp.light = {type = "basic", intensity = 1, size = 500}
-- biglamp.light_when_colored = {type = "basic", intensity = 1, size = 30}
local function upscalesprite(sprite, scalefactor)
    if sprite["layers"] ~= nil then
        for key, value in pairs(sprite["layers"]) do
            sprite["layers"][key] = upscalesprite(value, scalefactor)
        end
        return sprite
    end
    if sprite["hr_version"] ~= nil then
        sprite["hr_version"] = upscalesprite(sprite["hr_version"], scalefactor)
    end
    if sprite["filename"] ~= nil then
        if sprite["scale"] == nil then
            sprite["scale"] = 1
        end
        sprite["scale"] = sprite["scale"] * scalefactor
    end
    return sprite
end
local scale = 2
biglamp.collision_box = {
    {
        biglamp.collision_box[1][1] * scale,
        biglamp.collision_box[1][2] * scale
    }, {
        biglamp.collision_box[2][1] * scale,
        biglamp.collision_box[2][2] * scale
    }
}

biglamp.picture_on = upscalesprite(table.deepcopy(biglamp.picture_on), scale)
biglamp.picture_off = upscalesprite(table.deepcopy(biglamp.picture_off), scale)
local biglampitem = table.deepcopy(data.raw.item["small-lamp"])
biglampitem.name = "big-lamp"
biglampitem.icon = "__melodys-lamps__/cool-lamp.png"
biglampitem.place_result = "big-lamp"
local biglamprecipie = table.deepcopy(data.raw["recipe"]["small-lamp"])
biglamprecipie.enabled = true
biglamprecipie.name = "big-lamp"
biglamprecipie.result = "big-lamp"
biglamprecipie.ingredients = {{"small-lamp", 4}, {"copper-cable", 1}}
data:extend{coollamp, recipe, coollampitem, coollight, biglamp, biglampitem, biglamprecipie}
-- require("computedcolors")
-- lamp = table.deepcopy(data.raw["lamp"]["small-lamp"])
-- lamp.signal_to_color_mapping = colormapping
-- data.raw["lamp"]["small-lamp"] = lamp
