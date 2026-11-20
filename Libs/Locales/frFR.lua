local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'frFR'); if not L then return end

-- Min/max button tooltip
L['Click'] = 'Clic'
L['Alt+Click'] = 'Alt+Clic'
L['Collapse all objectives'] = 'Réduire tous les objectifs'
L['Expand all objectives'] = 'Développer tous les objectifs'
L['Collapse every tracker too'] = 'Réduire aussi tous les suivis'
L['Expand every tracker too'] = 'Développer aussi tous les suivis'
L['Collapse this tracker'] = 'Réduire ce suivi'
L['Expand this tracker'] = 'Développer ce suivi'
L['Stays collapsed after reload'] = 'Reste réduit après un rechargement'
L['Stays expanded after reload'] = 'Reste développé après un rechargement'

-- Help tour
L['AllObjectives::HelpTip'] =
  'Les suivis réduits le restent, même après un rechargement. Alt+Clic ici pour réduire ou développer tous les suivis.'
L['Tracker::HelpTip'] = 'Chaque suivi mémorise aussi son propre état.'
