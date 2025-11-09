local copieditem = "se-space-solar-panel"
if data.raw["solar-panel"][copieditem] == nil then goto skip end
local lunarpanelitem = table.deepcopy(data.raw.item[copieditem])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"][copieditem])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe[copieditem])
local lunarpaneltechnology = table.deepcopy(data.raw.technology[copieditem])

local newname = "kc-flat-lunar-panel"
local tint_value = {r = 140/255, g = 1, b = 0}

lunarpanelitem.name = newname
lunarpanelitem.icons = {{icon = lunarpanelitem.icon, tint = tint_value}}
lunarpanelitem.icon = nil
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item[copieditem].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.icons = lunarpanelitem.icons
lunarpanelentity.icon = nil
lunarpanelentity.picture.layers[1].tint = tint_value
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname
lunarpanelentity.next_upgrade = "kc-flat-lunar-panel-2"

lunarpanelrecipe.name = newname
lunarpanelrecipe.icons = lunarpanelitem.icons
lunarpanelrecipe.icon = nil
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

lunarpaneltechnology.name = newname
lunarpaneltechnology.icons = {{icon = lunarpaneltechnology.icon, tint = tint_value, icon_size = lunarpaneltechnology.icon_size}}
lunarpaneltechnology.icon = nil
lunarpaneltechnology.icon_size = nil
lunarpaneltechnology.effects = {
  {
    recipe = newname,
    type = "unlock-recipe"
  }
}
for ai in pairs(lunarpaneltechnology.prerequisites) do
  if mods["Krastorio2"] then
    if lunarpaneltechnology.prerequisites[ai] == "kr-advanced-solar-panel" then lunarpaneltechnology.prerequisites[ai] = "kc-kr-advanced-lunar-panel" end
  else
    if lunarpaneltechnology.prerequisites[ai] == "solar-energy" then lunarpaneltechnology.prerequisites[ai] = "kc-lunar-energy" end
  end
end

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
  lunarpaneltechnology,
})

::skip::