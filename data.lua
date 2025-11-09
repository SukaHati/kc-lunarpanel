require("prototypes.lunarpanel")
require("prototypes.lunarpanelequipment")

if mods["Advanced-Electric-Revamped-v16"] then
  require("prototypes.advancesolarhr.advancedlunarpanel")
  require("prototypes.advancesolarhr.elitelunarpanel")
  require("prototypes.advancesolarhr.ultimatelunarpanel")
end

if mods["space-exploration"] then
  require("prototypes.spaceexploration.flatlunarpanel")
  require("prototypes.spaceexploration.flatlunarpanel2")
  require("prototypes.spaceexploration.flatlunarpanel3")
end

if mods["Krastorio2"] then
  require("prototypes.krastorio2.advancedlunarpanel")
end