include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
end

function ENT:Think()
end