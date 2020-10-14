-- Aumenta o tamanho dos buffs
BuffFrame:SetScale(1.5)

-- Reseta a posição do player
PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("CENTER",UIParent,-300,-50)
PlayerFrame:SetUserPlaced(true)
PlayerFrame:SetScale(1.3)

-- Reseta a posição do target
TargetFrame:ClearAllPoints() 
TargetFrame:SetPoint("CENTER",UIParent,300,-50)
TargetFrame:SetUserPlaced(true)
TargetFrame:SetScale(1.3)

TargetFrameSpellBar:SetScale(1.50)

-- Reseta a posição do focus
FocusFrame:ClearAllPoints()
FocusFrame:SetPoint("CENTER",UIParent,300,90)
FocusFrame:SetUserPlaced(true)
FocusFrame:SetScale(1.5)

FocusFrameSpellBar:SetScale(1.50)

print('Carregado :)')