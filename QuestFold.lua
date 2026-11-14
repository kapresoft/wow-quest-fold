--- @type string
local addonName = ...


C_Timer.After(1, function()
  print(addonName, 'Loaded...')
end)