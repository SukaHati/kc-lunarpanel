local lunarpanelequipmentitem = table.deepcopy(data.raw.item["solar-panel-equipment"])
local lunarpanelequipment = table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
local lunarpanelequipmentrecipe = table.deepcopy(data.raw.recipe["solar-panel-equipment"])
local lunarpanelequipmenttechnology = table.deepcopy(data.raw.technology["solar-panel-equipment"])

local newname = "kc-lunar-panel-equipment"

lunarpanelequipmentitem.name = newname
lunarpanelequipmentitem.icon = "__kc-lunarpanel__/graphics/icons/kc-lunar-panel-equipment.png"
lunarpanelequipmentitem.place_as_equipment_result = newname
lunarpanelequipmentitem.order = data.raw.item["solar-panel-equipment"].order.."-z-2"

lunarpanelequipment.name = newname
lunarpanelequipment.sprite.filename = "__kc-lunarpanel__/graphics/equipment/kc-lunar-panel-equipment.png"
lunarpanelequipment.performance_at_day = 0
lunarpanelequipment.performance_at_night = 1

lunarpanelequipmentrecipe.name = newname
for ai in pairs(lunarpanelequipmentrecipe.ingredients) do
  if lunarpanelequipmentrecipe.ingredients[ai].name == "solar-panel" then lunarpanelequipmentrecipe.ingredients[ai].name = "kc-lunar-panel" end
end
lunarpanelequipmentrecipe.results = {
  {
    amount = 1,
    name = newname,
    type = "item"
  }
}

lunarpanelequipmenttechnology.name = "kc-lunar-panel-equipment"
lunarpanelequipmenttechnology.icons[1].icon = "__kc-lunarpanel__/graphics/technology/kc-lunar-panel-equipment.png"
lunarpanelequipmenttechnology.effects = {
  {
    recipe = newname,
    type = "unlock-recipe"
  }
}
for ai in pairs(lunarpanelequipmenttechnology.prerequisites) do
  if lunarpanelequipmenttechnology.prerequisites[ai] == "solar-energy" then lunarpanelequipmenttechnology.prerequisites[ai] = "kc-lunar-energy" end
end

data:extend
({
  lunarpanelequipmentitem,
  lunarpanelequipment,
  lunarpanelequipmentrecipe,
  lunarpanelequipmenttechnology,
})