local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'ptBR'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Clique'
L['Alt+Click'] = 'Alt+Clique'
L['Collapse all objectives'] = 'Recolher todos os objetivos'
L['Expand all objectives'] = 'Expandir todos os objetivos'
L['Collapse every tracker too'] = 'Recolher também todos os rastreadores'
L['Expand every tracker too'] = 'Expandir também todos os rastreadores'
L['Collapse this tracker'] = 'Recolher este rastreador'
L['Expand this tracker'] = 'Expandir este rastreador'
L['Stays collapsed after reload'] = 'Continua recolhido após recarregar'
L['Stays expanded after reload'] = 'Continua expandido após recarregar'

-- Help tour
L['AllObjectives::HelpTip'] =
  'Rastreadores recolhidos continuam recolhidos, mesmo após recarregar. Alt+Clique aqui para recolher ou expandir todos os rastreadores.'
L['Tracker::HelpTip'] = 'Cada rastreador também lembra se está recolhido.'
