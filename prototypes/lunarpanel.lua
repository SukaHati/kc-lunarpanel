local lunarpanelitem = table.deepcopy(data.raw.item["solar-panel"])
local lunarpanelentity = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
local lunarpanelrecipe = table.deepcopy(data.raw.recipe["solar-panel"])
local lunarpaneltechnology = table.deepcopy(data.raw.technology["solar-energy"])

local newname = "kc-lunar-panel"

lunarpanelitem.name = newname
lunarpanelitem.icon = "__kc-lunarpanel__/graphics/icons/kc-lunar-panel.png"
lunarpanelitem.place_result = newname
lunarpanelitem.order = data.raw.item["solar-panel"].order.."-z-2"

lunarpanelentity.name = newname
lunarpanelentity.icon = "__kc-lunarpanel__/graphics/icons/kc-lunar-panel.png"
lunarpanelentity.picture.layers[1].filename = "__kc-lunarpanel__/graphics/entities/kc-lunar-panel.png"
lunarpanelentity.performance_at_day = 0
lunarpanelentity.performance_at_night = 1
lunarpanelentity.minable.result = newname
if mods["Advanced-Electric-Revamped-v16"] then
  lunarpanelentity.next_upgrade = "kc-advanced-lunar-panel"
end

lunarpanelrecipe.name = newname
lunarpanelrecipe.results = {
  {
    amount = 1,
    name = newname,
    type = "item"
  }
}

lunarpaneltechnology.name = "kc-lunar-energy"
lunarpaneltechnology.icon = "__kc-lunarpanel__/graphics/technology/kc-lunar-energy.png"
lunarpaneltechnology.effects = {
  {
    recipe = newname,
    type = "unlock-recipe"
  }
}

data:extend
({
  lunarpanelitem,
  lunarpanelentity,
  lunarpanelrecipe,
  lunarpaneltechnology,
})