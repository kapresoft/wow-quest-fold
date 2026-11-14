--- @type string
local addonName = ...

--- @class QuestFold_DB
--- @field collapsed table<string, boolean> @Keyed by tracker frame name

--- @class QuestFold_Tracker : Frame
--- @field Header Frame
--- @field IsCollapsed fun(self: QuestFold_Tracker): boolean
--- @field SetCollapsed fun(self: QuestFold_Tracker, collapsed: boolean)

--- Matches the TOC SavedVariables definition
local DB_NAME = 'QUEST_FOLD_DB'

--- @type QuestFold_DB
local db

local eventFrame = CreateFrame('Frame')

--- @type table<QuestFold_Tracker, boolean>
local hookedTrackers = {}

--- @type table<QuestFold_Tracker, boolean>
local pendingRestores = {}

local function InitDB()
  _G[DB_NAME] = _G[DB_NAME] or {}
  db = _G[DB_NAME]
  db.collapsed = db.collapsed or {}
end

--- @param tracker QuestFold_Tracker
local function SaveState(tracker)
  db.collapsed[tracker:GetName()] = tracker:IsCollapsed()
end

--- @param tracker QuestFold_Tracker
local function DeferRestore(tracker)
  pendingRestores[tracker] = true
  eventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
end

--- @param tracker QuestFold_Tracker
local function RestoreState(tracker)
  if not db.collapsed[tracker:GetName()] then return end
  -- Tainted tracker updates can block secure item buttons
  if InCombatLockdown() then return DeferRestore(tracker) end
  tracker:SetCollapsed(true)
end

--- Folds every module to match All Objectives.
local function SyncModules()
  local collapsed = ObjectiveTrackerFrame:IsCollapsed()
  ObjectiveTrackerFrame:ForEachModule(function(module)
    module:SetCollapsed(collapsed)
    SaveState(module)
  end)
end

--- @param tracker QuestFold_Tracker
local function OnTrackerClick(tracker)
  SaveState(tracker)
  if tracker == ObjectiveTrackerFrame and IsAltKeyDown() then SyncModules() end
end

--- Only user clicks are saved, so ForceExpand stays temporary.
--- @param tracker QuestFold_Tracker
local function HookClicks(tracker)
  if hookedTrackers[tracker] then return end
  hookedTrackers[tracker] = true
  tracker.Header.MinimizeButton:HookScript('OnClick', function() OnTrackerClick(tracker) end)
end

--- @param tracker QuestFold_Tracker
local function MakeSticky(tracker)
  HookClicks(tracker)
  RestoreState(tracker)
end

local function OnPlayerLogin()
  InitDB()
  MakeSticky(ObjectiveTrackerFrame)
  -- Modules attach after login, in ObjectiveTrackerManager:Init
  hooksecurefunc(ObjectiveTrackerFrame, 'AddModule', function(_, module) MakeSticky(module) end)
end

local function OnRegenEnabled()
  eventFrame:UnregisterEvent('PLAYER_REGEN_ENABLED')
  local trackers = pendingRestores
  pendingRestores = {}
  for tracker in pairs(trackers) do RestoreState(tracker) end
end

local handlers = {
  PLAYER_LOGIN = OnPlayerLogin,
  PLAYER_REGEN_ENABLED = OnRegenEnabled,
}

eventFrame:SetScript('OnEvent', function(_, event) handlers[event]() end)
eventFrame:RegisterEvent('PLAYER_LOGIN')

C_Timer.After(1, function()
  print(addonName, 'Loaded...')
end)
