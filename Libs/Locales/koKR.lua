local addonName = ...

local L = LibStub('AceLocale-3.0'):NewLocale(addonName, 'koKR'); if not L then return end

-- Min/max button tooltip
L['Click'] = '클릭'
L['Alt+Click'] = 'Alt+클릭'
L['Collapse all objectives'] = '모든 목표 접기'
L['Expand all objectives'] = '모든 목표 펼치기'
L['Collapse every tracker too'] = '모든 추적기도 접기'
L['Expand every tracker too'] = '모든 추적기도 펼치기'
L['Collapse this tracker'] = '이 추적기 접기'
L['Expand this tracker'] = '이 추적기 펼치기'
L['Stays collapsed after reload'] = '리로드 후에도 접힌 상태 유지'
L['Stays expanded after reload'] = '리로드 후에도 펼친 상태 유지'

-- Help tour
L['AllObjectives::HelpTip'] = '접은 추적기는 리로드 후에도 접힌 상태로 유지됩니다. 여기를 Alt+클릭하면 모든 추적기를 접거나 펼칩니다.'
L['Tracker::HelpTip'] = '각 추적기도 접힌 상태를 따로 기억합니다.'
