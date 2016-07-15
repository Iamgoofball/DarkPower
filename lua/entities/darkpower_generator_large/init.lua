AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- /8==============================D~~~\
-- |DONT TOUCH ANYTHING BELOW THIS LINE|
-- \8==============================D~~~/
function ENT:Initialize()
    self:SetModel("models/props/de_nuke/PowerPlantTank.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()
	self:SetMaxPowered(self.maxpowered)
	self:SetPowerRadius(self.power_radius)
	self:SetXOffset(self.xoffset)
	self:SetYOffset(self.yoffset)
	self:StartSound()
	self:SetUseType( SIMPLE_USE )
	self:SetOn(true)
end