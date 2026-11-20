local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'enUS', true); if not L then return end

-- Min/max button tooltip
L['Click'] = true
L['Alt+Click'] = true
L['Collapse all objectives'] = true
L['Expand all objectives'] = true
L['Collapse every tracker too'] = true
L['Expand every tracker too'] = true
L['Collapse this tracker'] = true
L['Expand this tracker'] = true
L['Stays collapsed after reload'] = true
L['Stays expanded after reload'] = true

-- Help tour
L['AllObjectives::HelpTip'] =
  'Collapsed trackers stay collapsed, even after reload. Alt+Click here to collapse or expand every tracker.'
L['Tracker::HelpTip'] = 'Each tracker remembers its own collapsed state too.'
