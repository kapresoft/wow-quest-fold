--- @class QuestFold_Developer
local o = {}; qf_dev = o

--- Shows the help tour again, as for a new user.
--- ### Example:
--- ```lua
--- qf_dev:ResetHelpTour()
--- ```
function o:ResetHelpTour()
  local global = QUEST_FOLD_DB['global']
  global.helpTipsDismissed = nil
  global.tourBaseline = nil
  ReloadUI()
end

--- Wipes all saved data, collapsed trackers included.
--- ### Example:
--- ```lua
--- qf_dev:ResetAll()
--- ```
function o:ResetAll()
  QUEST_FOLD_DB = nil
  ReloadUI()
end

--- Prints what the help tour sees; compare expanded vs collapsed.
--- ### Example:
--- ```lua
--- qf_dev:TourState()
--- ```
function o:TourState()
  local global = QUEST_FOLD_DB['global']
  local tracker = ObjectiveTrackerFrame
  local button = tracker.Header.MinimizeButton
  print('tracker shown/visible:', tracker:IsShown(), tracker:IsVisible())
  print('button visible:', button:IsVisible(), 'center:', button:GetCenter())
  print('baseline:', global.tourBaseline)
  for key in pairs(global.helpTipsDismissed or {}) do print('seen:', key) end
  tracker:ForEachModule(function(module)
    if module:IsVisible() then print('visible module:', module:GetName()) end
  end)
end
