if mods["Krastorio2"] or mods["Krastorio2-spaced-out"] then
  data.raw.technology["kc-lunar-energy"].prerequisites = data.raw.technology["solar-energy"].prerequisites
  data.raw.recipe["kc-lunar-panel"].ingredients = data.raw.recipe["solar-panel"].ingredients
  data.raw["solar-panel"]["kc-lunar-panel"].production = data.raw["solar-panel"]["solar-panel"].production
end

if mods["space-exploration"] then
  if mods["Krastorio2"] then
    if data.raw["solar-panel"]["se-space-solar-panel"] ~= nil then
      for ai in pairs(data.raw.recipe["kc-flat-lunar-panel"].ingredients) do
        if data.raw.recipe["kc-flat-lunar-panel"].ingredients[ai].name == "kr-advanced-solar-panel" then data.raw.recipe["kc-flat-lunar-panel"].ingredients[ai].name = "kc-kr-advanced-lunar-panel" end
	  end
    end
  end
end

if mods["Bio_Industries_2"] then
end