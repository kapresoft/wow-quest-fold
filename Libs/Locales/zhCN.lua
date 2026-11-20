local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'zhCN'); if not L then return end

-- Min/max button tooltip
L['Click'] = '点击'
L['Alt+Click'] = 'Alt+点击'
L['Collapse all objectives'] = '折叠所有目标'
L['Expand all objectives'] = '展开所有目标'
L['Collapse every tracker too'] = '同时折叠所有追踪器'
L['Expand every tracker too'] = '同时展开所有追踪器'
L['Collapse this tracker'] = '折叠此追踪器'
L['Expand this tracker'] = '展开此追踪器'
L['Stays collapsed after reload'] = '重载后保持折叠'
L['Stays expanded after reload'] = '重载后保持展开'

-- Help tour
L['AllObjectives::HelpTip'] = '折叠的追踪器会保持折叠，重载界面后也是如此。Alt+点击此处可折叠或展开所有追踪器。'
L['Tracker::HelpTip'] = '每个追踪器也会记住自己的折叠状态。'
