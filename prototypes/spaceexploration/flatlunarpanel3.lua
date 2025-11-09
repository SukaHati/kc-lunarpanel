local copieditem = "se-space-solar-panel-3"
local copieditemgraphics = "se-space-solar-panel"
if data.raw["solar-panel"][copieditem] == nil or data.raw["solar-panel"][copieditemgraphics] == nil then goto skip end
local lunarpanelitem = table.deepcopy(data.raw.item[copieditem])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"][copieditem])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe[copieditem])
local lunarpaneltechnology = table.deepcopy(data.raw.technology[copieditem])

local newname = "kc-flat-lunar-panel-3"
local tint_value = {r = 1, g = 0.5, b = 0}

lunarpanelitem.name = newname
lunarpanelitem.icons = {{icon = data.raw.item[copieditemgraphics].icon, tint = tint_value}}
lunarpanelitem.icon = nil
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item[copieditem].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.icons = lunarpanelitem.icons
lunarpanelentity.icon = nil
lunarpanelentity.picture = table.deepcopy(data.raw["solar-panel"][copieditemgraphics].picture)
lunarpanelentity.picture.layers[1].tint = tint_value
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname

lunarpanelrecipe.name = newname
lunarpanelrecipe.icons = lunarpanelitem.icons
lunarpanelrecipe.icon = nil
for ai in pairs(lunarpanelrecipe.ingredients) do
  if lunarpanelrecipe.ingredients[ai].name == "se-space-solar-panel-2" then lunarpanelrecipe.ingredients[ai].name = "kc-flat-lunar-panel-2" end
end
if lunarpanelrecipe.main_product ~= nil then lunarpanelrecipe.main_product = newname end
lunarpanelrecipe.results = {
  {
    amount = 1,
    name = newname,
    type = "item"
  }
}

lunarpaneltechnology.name = newname
lunarpaneltechnology.icons = {{icon = data.raw.technology[copieditemgraphics].icon, tint = tint_value, icon_size = data.raw.technology[copieditemgraphics].icon_size}}
lunarpaneltechnology.icon = nil
lunarpaneltechnology.icon_size = nil
lunarpaneltechnology.effects = {
  {
    recipe = newname,
    type = "unlock-recipe"
  }
}
for ai in pairs(lunarpaneltechnology.prerequisites) do
  if lunarpaneltechnology.prerequisites[ai] == "se-space-solar-panel-2" then lunarpaneltechnology.prerequisites[ai] = "kc-flat-lunar-panel-2" end
end

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
  lunarpaneltechnology,
})

::skip::