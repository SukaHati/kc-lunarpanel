local copieditem = "bi-bio-solar-farm"
if data.raw["solar-panel"][copieditem] == nil then goto skip end
local lunarpanelitem = table.deepcopy(data.raw.item[copieditem])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"][copieditem])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe[copieditem])

local newname = "kc-bi-bio-lunar-farm"
local tint_value = {r = 255/255, g = 150/255, b = 140/255}

log(serpent.block(lunarpanelitem))
lunarpanelitem.name = newname
lunarpanelitem.icons = {{icon = lunarpanelitem.icon, tint = tint_value}}
lunarpanelitem.icon = nil
lunarpanelitem.localised_description = nil
lunarpanelitem.localised_name = nil
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item[copieditem].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.icons = lunarpanelitem.icons
lunarpanelentity.icon = nil
lunarpanelentity.picture.layers[1].tint = tint_value
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname

lunarpanelrecipe.name = newname
lunarpanelrecipe.icons = lunarpanelitem.icons
lunarpanelrecipe.icon = nil
lunarpanelrecipe.localised_description = nil
lunarpanelrecipe.localised_name = nil
for ai in pairs(lunarpanelrecipe.ingredients) do
  if lunarpanelrecipe.ingredients[ai].name == "solar-panel" then lunarpanelrecipe.ingredients[ai].name = "kc-lunar-panel" end
end
if lunarpanelrecipe.main_product ~= nil then lunarpanelrecipe.main_product = newname end
lunarpanelrecipe.results = {
  {
    amount = 1,
    name = newname,
    type = "item"
  }
}

lunarpaneltechnology = data.raw.technology["kc-lunar-energy"]
local neweffects = {
  recipe = newname,
  type = "unlock-recipe"
}
table.insert(lunarpaneltechnology.effects, neweffects)

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
})

::skip::