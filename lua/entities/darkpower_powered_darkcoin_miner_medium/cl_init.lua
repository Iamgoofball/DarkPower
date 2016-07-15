include( "shared.lua" );

function ENT:Draw()
    self:DrawModel()
	local generator = self:GetGenerator()
	self:DrawPowerHUD()
	self:DrawMinerHUD()
end
