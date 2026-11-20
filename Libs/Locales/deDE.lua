local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'deDE'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Klick'
L['Alt+Click'] = 'Alt+Klick'
L['Collapse all objectives'] = 'Alle Ziele einklappen'
L['Expand all objectives'] = 'Alle Ziele ausklappen'
L['Collapse every tracker too'] = 'Auch alle Tracker einklappen'
L['Expand every tracker too'] = 'Auch alle Tracker ausklappen'
L['Collapse this tracker'] = 'Diesen Tracker einklappen'
L['Expand this tracker'] = 'Diesen Tracker ausklappen'
L['Stays collapsed after reload'] = 'Bleibt nach dem Neuladen eingeklappt'
L['Stays expanded after reload'] = 'Bleibt nach dem Neuladen ausgeklappt'

-- Help tour
L['AllObjectives::HelpTip'] =
  'Eingeklappte Tracker bleiben eingeklappt, auch nach dem Neuladen. Alt+Klick hier klappt alle Tracker ein oder aus.'
L['Tracker::HelpTip'] = 'Auch jeder einzelne Tracker merkt sich, ob er eingeklappt ist.'
