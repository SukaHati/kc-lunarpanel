local kc_utility = require("kc_utility")

if mods["space-exploration"] then 
  local basesolarsubgroup = data.raw.item["solar-panel"].subgroup
  data.raw.item["kc-lunar-panel"].subgroup = basesolarsubgroup
end

if mods["Advanced-Electric-Revamped-v16"] then
  data.raw["solar-panel"]["kc-advanced-lunar-panel"].production = data.raw["solar-panel"]["advanced-solar"].production
  data.raw["solar-panel"]["kc-elite-lunar-panel"].production = data.raw["solar-panel"]["elite-solar"].production
  data.raw["solar-panel"]["kc-ultimate-lunar-panel"].production = data.raw["solar-panel"]["ultimate-solar"].production
end

if mods["248k-Redux"] then
  if mods["248k-Redux"] <= "0.1.32" then 
    data.raw.item["kc-lunar-panel"].subgroup = data.raw.item["el_solar_item"].subgroup
  else
    data.raw.item["kc-lunar-panel"].subgroup = data.raw.item["el_solar"].subgroup
  end
end

if mods["Krastorio2"] and mods["248k-Redux"] then
  if mods["248k-Redux"] <= "0.1.32" then
    data.raw.recipe["kc-kr-advanced-lunar-panel"].ingredients = kc_utility.copyandreplacerecipeingredients("kr-advanced-solar-panel", "el_solar_item", "kc-el_lunar")
  else
    data.raw.recipe["kc-kr-advanced-lunar-panel"].ingredients = kc_utility.copyandreplacerecipeingredients("kr-advanced-solar-panel", "el_solar", "kc-el_lunar")
  end
  data.raw["solar-panel"]["kc-kr-advanced-lunar-panel"].production = data.raw["solar-panel"]["kr-advanced-solar-panel"].production
end