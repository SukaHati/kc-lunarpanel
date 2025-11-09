if mods["space-exploration"] then 
  local basesolarsubgroup = data.raw.item["solar-panel"].subgroup
  data.raw.item["kc-lunar-panel"].subgroup = basesolarsubgroup
end