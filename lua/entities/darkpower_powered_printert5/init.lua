AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/consolebox03a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

	self:SetNames(self.set_name)
	self:SetPowerUsage(self.power_usage)
	self:SetIntervals(self.interval)
	self:SetXOffset(self.xoffset)
	self:SetYOffset(self.yoffset)
	self:SetTimers(CurTime())
end