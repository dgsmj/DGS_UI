-- Seta as cores das classes e troca o estilo da barra
local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_LOGIN") 
Frame:SetScript("OnEvent", function(...)

local function colour(statusbar, unit)
local _, class, c
	if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
		_, class = UnitClass(unit)
		c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		statusbar:SetStatusBarColor(c.r, c.g, c.b)
	end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
	colour(self, self.unit)
end)

local frame = CreateFrame("FRAME")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
	if UnitIsPlayer("target") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
		TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
	if UnitIsPlayer("focus") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
		FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
	if PlayerFrame:IsShown() and not PlayerFrame.bg then
		c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		bg=PlayerFrame:CreateTexture()
		bg:SetPoint("TOPLEFT",PlayerFrameBackground)
		bg:SetPoint("BOTTOMRIGHT",PlayerFrameBackground,0,22)
		bg:SetTexture(TargetFrameNameBackground:GetTexture())
		bg:SetVertexColor(c.r,c.g,c.b)
		PlayerFrame.bg=true
	end
end

frame:SetScript("OnEvent", eventHandler)

for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end

hooksecurefunc("PlayerFrame_UpdateStatus",function()
  -- make changes to PlayerFrame here
  PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-NoLevel")
  PlayerStatusTexture:Hide()
  PlayerRestIcon:Hide()
  PlayerAttackIcon:Hide()
  PlayerRestGlow:Hide()
  PlayerLevelText:Hide()
  PlayerAttackGlow:Hide()
  PlayerStatusGlow:Hide()
end)

local f=CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event,...)
  if event=="PLAYER_TARGET_CHANGED" then
    -- do TargetFrame changes here
    TargetFrameTextureFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-NoLevel")
    TargetFrameTextureFrameLevelText:Hide()
  elseif event=="PLAYER_FOCUS_CHANGED" then
    -- do FocusFrame changes here
    FocusFrameTextureFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-NoLevel")
    FocusFrameTextureFrameLevelText:Hide()
  end
end)
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("PLAYER_FOCUS_CHANGED")

end)