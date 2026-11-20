local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'ruRU'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Щелчок'
L['Alt+Click'] = 'Alt+щелчок'
L['Collapse all objectives'] = 'Свернуть все задачи'
L['Expand all objectives'] = 'Развернуть все задачи'
L['Collapse every tracker too'] = 'Также свернуть все трекеры'
L['Expand every tracker too'] = 'Также развернуть все трекеры'
L['Collapse this tracker'] = 'Свернуть этот трекер'
L['Expand this tracker'] = 'Развернуть этот трекер'
L['Stays collapsed after reload'] = 'Останется свернутым после перезагрузки'
L['Stays expanded after reload'] = 'Останется развернутым после перезагрузки'

-- Help tour
L['AllObjectives::HelpTip'] =
  'Свернутые трекеры остаются свернутыми даже после перезагрузки. Alt+щелчок здесь сворачивает или разворачивает все трекеры.'
L['Tracker::HelpTip'] = 'Каждый трекер также запоминает, свернут ли он.'
