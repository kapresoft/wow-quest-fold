--- @meta _
-- Type definitions for EmmyLua; not loaded by the TOC.

--[[-----------------------------------------------------------------------------
Blizzard objective tracker
-------------------------------------------------------------------------------]]

--- @class QuestFold_Header : Frame
--- @field MinimizeButton Button
--- @field SetCollapsed fun(self: QuestFold_Header, collapsed: boolean) @Sets the button icon only

--- @class QuestFold_Tracker : Frame
--- @field Header QuestFold_Header
--- @field ForceExpand fun(self: QuestFold_Tracker)

--- @class QuestFold_Module : QuestFold_Tracker
--- @field ContentsFrame Frame
--- @field IsDisplayable fun(self: QuestFold_Module): boolean
--- @field UpdateHeight fun(self: QuestFold_Module)

--- @class QuestFold_Container : QuestFold_Tracker
--- @field AddModule fun(self: QuestFold_Container, module: QuestFold_Module)
--- @field ForEachModule fun(self: QuestFold_Container, callback: fun(module: QuestFold_Module))

--[[-----------------------------------------------------------------------------
Globals
-------------------------------------------------------------------------------]]

--- The "All Objectives" container
--- @type QuestFold_Container
ObjectiveTrackerFrame = {}

--- @type QuestFold_DB
QUEST_FOLD_DB = {}