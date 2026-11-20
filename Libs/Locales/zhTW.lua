local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'zhTW'); if not L then return end

-- Min/max button tooltip
L['Click'] = '點擊'
L['Alt+Click'] = 'Alt+點擊'
L['Collapse all objectives'] = '摺疊所有目標'
L['Expand all objectives'] = '展開所有目標'
L['Collapse every tracker too'] = '同時摺疊所有追蹤器'
L['Expand every tracker too'] = '同時展開所有追蹤器'
L['Collapse this tracker'] = '摺疊此追蹤器'
L['Expand this tracker'] = '展開此追蹤器'
L['Stays collapsed after reload'] = '重新載入後保持摺疊'
L['Stays expanded after reload'] = '重新載入後保持展開'

-- Help tour
L['AllObjectives::HelpTip'] = '摺疊的追蹤器會保持摺疊，重新載入介面後也是如此。Alt+點擊此處可摺疊或展開所有追蹤器。'
L['Tracker::HelpTip'] = '每個追蹤器也會記住自己的摺疊狀態。'
