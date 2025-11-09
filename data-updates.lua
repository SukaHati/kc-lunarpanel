if mods["Krastorio2"] then
  data.raw.technology["kc-lunar-energy"].prerequisites = data.raw.technology["solar-energy"].prerequisites
  data.raw.recipe["kc-lunar-panel"].ingredients = data.raw.recipe["solar-panel"].ingredients
  if mods["space-exploration"] then
    if data.raw["solar-panel"]["kc-lunar-energy"] == nil or data.raw["solar-panel"]["kc-lunar-energy-2"] or data.raw["solar-panel"]["kc-lunar-energy-3"] then goto there end
    for ai in pairs(data.raw.recipe["kc-flat-lunar-panel"].ingredients) do
      if data.raw.recipe["kc-flat-lunar-panel"].ingredients[ai].name == "kr-advanced-solar-panel" then data.raw.recipe["kc-flat-lunar-panel"].ingredients[ai].name = "kc-kr-advanced-lunar-panel" end
    end
  end
  ::there::
end