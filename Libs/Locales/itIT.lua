local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'itIT'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Clic'
L['Alt+Click'] = 'Alt+Clic'
L['Collapse all objectives'] = 'Comprimi tutti gli obiettivi'
L['Expand all objectives'] = 'Espandi tutti gli obiettivi'
L['Collapse every tracker too'] = 'Comprimi anche tutti i tracker'
L['Expand every tracker too'] = 'Espandi anche tutti i tracker'
L['Collapse this tracker'] = 'Comprimi questo tracker'
L['Expand this tracker'] = 'Espandi questo tracker'
L['Stays collapsed after reload'] = 'Resta compresso dopo il ricaricamento'
L['Stays expanded after reload'] = 'Resta espanso dopo il ricaricamento'

-- Help tour
L['AllObjectives::HelpTip'] =
  'I tracker compressi restano compressi, anche dopo il ricaricamento. Alt+Clic qui per comprimere o espandere tutti i tracker.'
L['Tracker::HelpTip'] = 'Anche ogni tracker ricorda il proprio stato.'
