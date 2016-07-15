include( "shared.lua" );

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
	self:DrawMinerHUD()
end
