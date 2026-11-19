local AceDB = LibStub('AceDB-3.0')

local addonName = ...

--- @class QuestFold_GlobalDB
--- @field collapsed table<string, boolean> @Keyed by tracker frame name

--- @class QuestFold_DB
--- @field global QuestFold_GlobalDB @Account-wide

--- Matches the TOC SavedVariables definition
local DB_NAME = 'QUEST_FOLD_DB'

--- @type QuestFold_DB
local DB_DEFAULTS = { ['global'] = { collapsed = {} } }

--- Clipping needs a rect, so a hidden module keeps this much
local HIDDEN_HEIGHT = 1

--- Contents rect kept under a folded header, for clipping
local CLIP_HEIGHT = 1

--- @type QuestFold_DB
local db

local eventFrame = CreateFrame('Frame')

--- Fold state on screen; ForceExpand changes it unsaved
--- @type table<QuestFold_Tracker, boolean>
local folded = {}

local function InitDB()
  db = AceDB:New(DB_NAME, DB_DEFAULTS)
end

--- @param frame Frame
--- @return boolean
local function IsLocked(frame)
  return InCombatLockdown() and frame:IsProtected()
end

local function ApplyAfterCombat()
  eventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
end

--- @param module QuestFold_Module
--- @return number? @nil when the module keeps Blizzard's height
local function FoldedHeight(module)
  if folded[ObjectiveTrackerFrame] then return HIDDEN_HEIGHT end
  if folded[module] then return module.Header:GetHeight() + CLIP_HEIGHT end
end

--- Runs after UpdateHeight, which sets Blizzard's height.
--- @param module QuestFold_Module
local function Shrink(module)
  if IsLocked(module) then return ApplyAfterCombat() end
  module:SetClipsChildren(folded[ObjectiveTrackerFrame])
  module.ContentsFrame:SetClipsChildren(folded[module])
  local height = FoldedHeight(module)
  if height then module:SetHeight(height) end
end

--- Frame calls only: writing tracker fields would taint it.
--- @param module QuestFold_Module
local function ApplyModule(module)
  module:SetAlpha(folded[ObjectiveTrackerFrame] and 0 or 1)
  module.Header:SetCollapsed(folded[module])
  if FoldedHeight(module) then return Shrink(module) end
  if IsLocked(module) then return ApplyAfterCombat() end
  -- Blizzard's height; the hook then clears the clipping
  if module:IsDisplayable() then module:UpdateHeight() end
end

local function ApplyAll()
  ObjectiveTrackerFrame.Header:SetCollapsed(folded[ObjectiveTrackerFrame])
  ObjectiveTrackerFrame:ForEachModule(ApplyModule)
end

--- @param tracker QuestFold_Tracker
--- @param isFolded boolean
local function Remember(tracker, isFolded)
  folded[tracker] = isFolded
  db['global'].collapsed[tracker:GetName()] = isFolded
end

--- @param isFolded boolean
local function RememberModules(isFolded)
  ObjectiveTrackerFrame:ForEachModule(function(module) Remember(module, isFolded) end)
end

--- The default anchor owner is UIParent, so hover is tracked here
--- @type QuestFold_Tracker?
local hovered

local SEPARATOR_TEXTURE = 'Interface\\Common\\UI-TooltipDivider-Transparent'

--- Blizzard's SocialUIUtil.AddSeparatorToTooltip settings
local SEPARATOR_OPTIONS = {
  height = 10,
  anchor = Enum.TooltipTextureAnchor.All,
  margin = { left = 0, right = 0, top = -2, bottom = -2 },
}

--- The texture anchors to a full-width (wrapped) blank line
local function AddSeparator()
  GameTooltip:AddLine(' ', 0, 0, 0, true)
  GameTooltip:AddTexture(SEPARATOR_TEXTURE, SEPARATOR_OPTIONS)
end

--- @param tracker QuestFold_Tracker
local function ShowTooltip(tracker)
  hovered = tracker
  GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
  local isFolded = folded[tracker]
  local action = isFolded and 'Expand' or 'Collapse'
  GameTooltip:AddLine(addonName, 1, 1, 1)
  GameTooltip:AddLine(' ')
  if tracker == ObjectiveTrackerFrame then
    GameTooltip:AddDoubleLine('Click', ('%s all objectives'):format(action), 1, 0.82, 0, 1, 1, 1)
    GameTooltip:AddDoubleLine('Alt+Click', ('%s every tracker too'):format(action), 1, 0.82, 0, 1, 1, 1)
  else
    GameTooltip:AddDoubleLine('Click', ('%s this tracker'):format(action), 1, 0.82, 0, 1, 1, 1)
  end
  AddSeparator()
  local result = isFolded and 'Stays expanded after reload' or 'Stays collapsed after reload'
  GameTooltip:AddLine(result, 0.98, 1.00, 0.73, true)
  GameTooltip:Show()
end

local function HideTooltip()
  hovered = nil
  GameTooltip:Hide()
end

--- @param tracker QuestFold_Tracker
local function RefreshTooltip(tracker)
  if hovered == tracker then ShowTooltip(tracker) end
end

--- @param tracker QuestFold_Tracker
local function OnClick(tracker)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
  local isFolded = not folded[tracker]
  Remember(tracker, isFolded)
  if tracker == ObjectiveTrackerFrame and IsAltKeyDown() then RememberModules(isFolded) end
  ApplyAll()
  RefreshTooltip(tracker)
end

--- Blizzard asks for this to reveal new content; not saved.
--- @param tracker QuestFold_Tracker
local function Unfold(tracker)
  if not folded[tracker] then return end
  folded[tracker] = false
  ApplyAll()
end

--- @param tracker QuestFold_Tracker
local function MakeSticky(tracker)
  folded[tracker] = db['global'].collapsed[tracker:GetName()] == true
  -- Replaces Blizzard's toggle, so its own state stays expanded
  local button = tracker.Header.MinimizeButton
  button:SetScript('OnClick', function() OnClick(tracker) end)
  button:SetScript('OnEnter', function() ShowTooltip(tracker) end)
  button:SetScript('OnLeave', HideTooltip)
  hooksecurefunc(tracker, 'ForceExpand', Unfold)
end

--- @param module QuestFold_Module
local function OnModuleAdded(module)
  if folded[module] ~= nil then return end
  MakeSticky(module)
  hooksecurefunc(module, 'UpdateHeight', Shrink)
  ApplyModule(module)
end

local function OnPlayerLogin()
  InitDB()
  MakeSticky(ObjectiveTrackerFrame)
  ObjectiveTrackerFrame:ForEachModule(OnModuleAdded)
  -- Modules attach after login, in ObjectiveTrackerManager:Init
  hooksecurefunc(ObjectiveTrackerFrame, 'AddModule', function(_, module) OnModuleAdded(module) end)
  ApplyAll()
end

local function OnRegenEnabled()
  eventFrame:UnregisterEvent('PLAYER_REGEN_ENABLED')
  ApplyAll()
end

local handlers = {
  PLAYER_LOGIN = OnPlayerLogin,
  PLAYER_REGEN_ENABLED = OnRegenEnabled,
}

eventFrame:SetScript('OnEvent', function(_, event) handlers[event]() end)
eventFrame:RegisterEvent('PLAYER_LOGIN')
