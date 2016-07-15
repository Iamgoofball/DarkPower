include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
	self:DrawPrinterHUD()
end
function ENT:Think()
end
