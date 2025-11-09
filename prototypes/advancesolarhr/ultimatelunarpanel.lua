local copieditem = "ultimate-solar"
if data.raw.item[copieditem] == nil and data.raw["solar-panel"][copieditem] == nil then goto getout end

local lunarpanelitem = table.deepcopy(data.raw.item[copieditem])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"][copieditem])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe[copieditem])
local lunarpaneltechnology = table.deepcopy(data.raw.technology[copieditem])

local newname = "kc-ultimate-lunar-panel"

lunarpanelitem.name = newname
lunarpanelitem.icon = "__kc-lunarpanel__/graphics/icons/"..newname..".png"
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item[copieditem].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.icon = "__kc-lunarpanel__/graphics/icons/"..newname..".png"
lunarpanelentity.picture.layers[1].filename = "__kc-lunarpanel__/graphics/entities/"..newname..".png"
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname

lunarpanelrecipe.name = newname
for ai in pairs(lunarpanelrecipe.ingredients) do
  if lunarpanelrecipe.ingredients[ai].name == "solar-panel" then lunarpanelrecipe.ingredients[ai].name = "kc-elite-lunar-panel" end
end
lunarpanelrecipe.results = {
  {
    amount = 1,
    name = newname,
    type = "item"
  }
}

lunarpaneltechnology.name = newname
lunarpaneltechnology.icon = "__kc-lunarpanel__/graphics/technology/"..newname..".png"
lunarpaneltechnology.effects = {
  {
    recipe = newname,
    type = "unlock-recipe"
  }
}
for ai in pairs(lunarpaneltechnology.prerequisites) do
  if lunarpaneltechnology.prerequisites[ai] == "elite-solar" then lunarpaneltechnology.prerequisites[ai] = "kc-elite-lunar-panel" end
end

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
  lunarpaneltechnology,
})

::getout::