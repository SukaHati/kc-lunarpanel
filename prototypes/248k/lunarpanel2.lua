local copieditem = "el_solar"
local lunarpanelitem = "item"
local lunarpanelentity = "entity"
local lunarpanelrecipe = "recipe"

if mods["248k-Redux"] <= "0.1.32" then
  copiedversion_item = copieditem.."_item"
  copiedversion_entity = copieditem.."_entity"
  copiedversion_recipe = copieditem.."_recipe"
else
  copiedversion_item = copieditem
  copiedversion_entity = copieditem
  copiedversion_recipe = copieditem
end

local lunarpanelitem = table.deepcopy(data.raw.item[copiedversion_item])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"][copiedversion_entity])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe[copiedversion_recipe])

local lunarpaneltechnology = table.deepcopy(data.raw.technology[copieditem.."_tech"])

local newname = "kc-el_lunar"
local tint_value = {r = 255/255, g = 150/255, b = 140/255}

lunarpanelitem.name = newname
lunarpanelitem.localised_name = {"item-name.kc-el_lunar"}
lunarpanelitem.icons = {{icon = lunarpanelitem.icon, tint = tint_value}}
lunarpanelitem.icon = nil
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item[copiedversion_item].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.localised_name = {"item-name.kc-el_lunar"}
lunarpanelentity.icons = lunarpanelitem.icons
lunarpanelentity.icon = nil
lunarpanelentity.picture.tint = tint_value
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname

lunarpanelrecipe.name = newname
lunarpanelrecipe.localised_name = {"item-name.kc-el_lunar"}
lunarpanelrecipe.icons = lunarpanelitem.icons
lunarpanelrecipe.icon = nil
for ai in pairs(lunarpanelrecipe.ingredients) do
  if lunarpanelrecipe.ingredients[ai].name == "solar-panel" then lunarpanelrecipe.ingredients[ai].name = "kc-lunar-panel" end
end
if lunarpanelrecipe.main_product ~= nil then lunarpanelrecipe.main_product = newname end
for k,v in pairs(lunarpanelrecipe.results) do
  if v.name == copiedversion_item then
    v.name = newname
  end
end

lunarpaneltechnology.name = newname
lunarpaneltechnology.localised_name = {"item-name.kc-el_lunar"}
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
  if lunarpaneltechnology.prerequisites[ai] == "solar-energy" then lunarpaneltechnology.prerequisites[ai] = "kc-lunar-energy" end
end

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
  lunarpaneltechnology,
})

::skip::