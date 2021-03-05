local function multiplytable(table, factor)
    for i, item in pairs(table) do
        if type(item) == "table" then
            table[i] = multiplytable(item, factor)
        elseif type(item) == "number" then
            table[i] = item * factor
        end
    end
    return table
end
local function upscalesprite(sprite, scalefactor)
    if sprite["layers"] ~= nil then
        for key, value in pairs(sprite["layers"]) do
            sprite["layers"][key] = upscalesprite(value, scalefactor)
        end
        return sprite
    end
    if sprite["animation"] ~= nil then
        for key, value in pairs(sprite["animation"]) do
            sprite["animation"][key] = upscalesprite(value, scalefactor)
        end
        return sprite
    end
    if sprite["hr_version"] ~= nil then
        sprite["hr_version"] = upscalesprite(sprite["hr_version"], scalefactor)
    end
    if sprite["filename"] ~= nil then
        if sprite["scale"] == nil then sprite["scale"] = 1 end
        sprite["scale"] = sprite["scale"] * scalefactor
        if sprite["shift"] ~= nil then
            sprite["shift"] = multiplytable(sprite["shift"], scalefactor)
        end

    end
    return sprite
end
-- COOL LAMP
local coollamp = table.deepcopy(data.raw["lamp"]["small-lamp"])
coollamp.name = "cool-lamp"
coollamp.icon = "__melodys-lamps__/assets/cool-lamp.png"
coollamp.minable.result = "cool-lamp"
coollamp.always_on = true
-- behavior is manually overwritten using LuaRender
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
coollampitem.icon = "__melodys-lamps__/assets/cool-lamp.png"
coollampitem.place_result = "cool-lamp"

local coollamprecipe = table.deepcopy(data.raw["recipe"]["small-lamp"])
coollamprecipe.enabled = true
coollamprecipe.name = "cool-lamp"
coollamprecipe.result = "cool-lamp"
coollamprecipe.ingredients = {{"small-lamp", 3}, {"electronic-circuit", 1}}

local coollight = table.deepcopy(coollamp.picture_on)
coollight.name = "cool-light"
coollight.type = "sprite"

coollamp.picture_on = table.deepcopy(coollamp.picture_off) -- troll!

-- BIGLAMP
local biglamp = table.deepcopy(data.raw["lamp"]["small-lamp"])
biglamp.name = "big-lamp"
biglamp.icon = "__melodys-lamps__/assets/big-lamp/big-lamp.png"
biglamp.minable.result = "big-lamp"
local biglampsize = 150
biglamp.light = {type = "basic", intensity = 1, size = biglampsize}
biglamp.glow_size = biglampsize / 2
local scale = 2
biglamp.collision_box = multiplytable({{-0.4, -0.4}, {0.4, 0.4}}, scale)
biglamp.selection_box = multiplytable(biglamp.selection_box, scale)
-- biglamp.drawing_box = {{-biglampsize,-biglampsize}, {biglampsize,biglampsize}}
biglamp.energy_usage_per_tick = "25kW"
biglamp.circuit_wire_connection_point = multiplytable(
                                            biglamp.circuit_wire_connection_point,
                                            scale)
for i, spr in pairs(biglamp.circuit_connector_sprites) do
    biglamp.circuit_connector_sprites[i] = upscalesprite(spr, scale)
end
biglamp.max_health = biglamp.max_health * scale ^ 2
biglamp.picture_on = upscalesprite(table.deepcopy(biglamp.picture_on), scale)
biglamp.picture_off = upscalesprite(table.deepcopy(biglamp.picture_off), scale)
biglamp.picture_off.layers[1].filename =
    "__melodys-lamps__/assets/big-lamp/lamp.png"
biglamp.picture_off.layers[1].hr_version.filename =
    "__melodys-lamps__/assets/big-lamp/hr-lamp.png"
-- biglamp.picture_on.filename = "__melodys-lamps__/assets/big-lamp/lamp.png"
-- biglamp.picture_on.hr_version.filename = "__melodys-lamps__/assets/big-lamp/hr-lamp.png"

local biglampcorpse = table.deepcopy(data.raw.corpse["lamp-remnants"])
biglampcorpse.name = "big-lamp-corpse"
biglampcorpse.animation[1] = upscalesprite(biglampcorpse.animation[1], scale)
biglampcorpse.animation[1].filename =
    "__melodys-lamps__/assets/big-lamp/remnants/lamp-remnants.png"
biglampcorpse.animation[1].hr_version.filename =
    "__melodys-lamps__/assets/big-lamp/remnants/hr-lamp-remnants.png"
biglamp.corpse = "big-lamp-corpse"

local biglampitem = table.deepcopy(data.raw.item["small-lamp"])
biglampitem.name = "big-lamp"
biglampitem.icon = "__melodys-lamps__/assets/big-lamp/big-lamp.png"
biglampitem.place_result = "big-lamp"

local biglamprecipie = table.deepcopy(data.raw["recipe"]["small-lamp"])
biglamprecipie.enabled = true
biglamprecipie.name = "big-lamp"
biglamprecipie.result = "big-lamp"
biglamprecipie.ingredients = {{"small-lamp", 4}, {"copper-cable", 1}}

-- SUNLAMP
local sunlamp = table.deepcopy(data.raw["lamp"]["small-lamp"])
sunlamp.name = "sun-lamp"
sunlamp.icon = "__melodys-lamps__/assets/sun-lamp/sun-lamp.png"
sunlamp.minable.result = "sun-lamp"
-- sunlamp.always_on = true
local sunlampsize = 1000
sunlamp.light = {type = "basic", intensity = 1, size = sunlampsize}
sunlamp.glow_size = sunlampsize / 2

sunlamp.dying_explosion = "nuclear-reactor-explosion"
sunlamp.damaged_trigger_effect = table.deepcopy(
                                     data.raw["reactor"]["nuclear-reactor"]
                                         .damaged_trigger_effect)
sunlamp.dying_trigger_effect = {type = "script", effect_id = "sun-lamp-death"}
local scale = 3
sunlamp.collision_box = multiplytable({{-0.4, -0.4}, {0.4, 0.4}}, scale)
sunlamp.selection_box = multiplytable(sunlamp.selection_box, scale)
-- sunlamp.drawing_box = {{-sunlampsize,-sunlampsize}, {sunlampsize,sunlampsize}}
sunlamp.energy_usage_per_tick = "15MW"
sunlamp.circuit_wire_connection_point = multiplytable(
                                            sunlamp.circuit_wire_connection_point,
                                            scale)
for i, spr in pairs(sunlamp.circuit_connector_sprites) do -- ing your mom
    sunlamp.circuit_connector_sprites[i] = upscalesprite(spr, scale)
end
sunlamp.picture_on = upscalesprite(table.deepcopy(sunlamp.picture_on), scale)
sunlamp.picture_off = upscalesprite(table.deepcopy(sunlamp.picture_off), scale)
sunlamp.max_health = sunlamp.max_health * scale ^ 2
sunlamp.picture_off.layers[1].filename =
    "__melodys-lamps__/assets/sun-lamp/lamp.png"
sunlamp.picture_off.layers[1].hr_version.filename =
    "__melodys-lamps__/assets/sun-lamp/hr-lamp.png"
-- sunlamp.picture_on.filename = "__melodys-lamps__/assets/sun-lamp/lamp.png"
-- sunlamp.picture_on.hr_version.filename = "__melodys-lamps__/assets/sun-lamp/hr-lamp.png"

local sunlampcorpse = table.deepcopy(data.raw.corpse["lamp-remnants"])
sunlampcorpse.name = "sun-lamp-corpse"
sunlampcorpse.animation[1] = upscalesprite(sunlampcorpse.animation[1], scale)
sunlampcorpse.animation[1].filename =
    "__melodys-lamps__/assets/sun-lamp/remnants/lamp-remnants.png"
sunlampcorpse.animation[1].hr_version.filename =
    "__melodys-lamps__/assets/sun-lamp/remnants/hr-lamp-remnants.png"
sunlamp.corpse = "sun-lamp-corpse"

local sunlampitem = table.deepcopy(data.raw.item["small-lamp"])
sunlampitem.name = "sun-lamp"
sunlampitem.icon = "__melodys-lamps__/assets/sun-lamp/sun-lamp.png"
sunlampitem.place_result = "sun-lamp"

local sunlamprecipie = table.deepcopy(data.raw["recipe"]["small-lamp"])
sunlamprecipie.enabled = true
sunlamprecipie.name = "sun-lamp"
sunlamprecipie.result = "sun-lamp"
sunlamprecipie.ingredients = {
    {"big-lamp", 100}, {"advanced-circuit", 50}, {"nuclear-fuel", 50}
}
data:extend{
    coollamp, coollamprecipe, coollampitem, coollight, biglampcorpse, biglamp,
    biglampitem, biglamprecipie, sunlampcorpse, sunlamp, sunlampitem,
    sunlamprecipie
}

-- require("computedcolors")
-- lamp = table.deepcopy(data.raw["lamp"]["small-lamp"])
-- lamp.signal_to_color_mapping = colormapping
-- data.raw["lamp"]["small-lamp"] = lamp
