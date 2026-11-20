local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'esES'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Clic'
L['Alt+Click'] = 'Alt+Clic'
L['Collapse all objectives'] = 'Contraer todos los objetivos'
L['Expand all objectives'] = 'Expandir todos los objetivos'
L['Collapse every tracker too'] = 'Contraer también todos los rastreadores'
L['Expand every tracker too'] = 'Expandir también todos los rastreadores'
L['Collapse this tracker'] = 'Contraer este rastreador'
L['Expand this tracker'] = 'Expandir este rastreador'
L['Stays collapsed after reload'] = 'Sigue contraído tras recargar'
L['Stays expanded after reload'] = 'Sigue expandido tras recargar'

-- Help tour
L['AllObjectives::HelpTip'] =
  'Los rastreadores contraídos siguen contraídos, incluso tras recargar. Alt+Clic aquí para contraer o expandir todos los rastreadores.'
L['Tracker::HelpTip'] = 'Cada rastreador también recuerda si está contraído.'
