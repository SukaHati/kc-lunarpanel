kc_utility = {}

function kc_utility.get_machines_list_table()
  local machineListValue = settings.startup["machines-list"].value
  local machineListTable = {}
  if machineListValue ~= nil then
    for ai in string.gmatch(machineListValue, "[^;]+") do
      machineListTable[ai] = true
      --table.insert(machineListTable, ai)
    end
  else
    machineListTable = nil
  end
  return machineListTable
end

function kc_utility.copyandreplacerecipeingredients(copiedrecipe, replaceingredient, ingredient)
  local newrecipe_ingredients = table.deepcopy(data.raw.recipe[copiedrecipe].ingredients)
  for aik, aiv in pairs(newrecipe_ingredients) do
    if aiv.name == replaceingredient then aiv.name = ingredient end
  end
  log(serpent.block(newrecipe_ingredients))
  return newrecipe_ingredients
end

return kc_utility