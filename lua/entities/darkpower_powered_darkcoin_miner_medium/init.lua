AddCSLuaFile( "cl_init.lua" );
AddCSLuaFile( "shared.lua" );
include( "shared.lua" );

function ENT:Initialize()
    self:initVars()
    self:SetModel(self.model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

    self.timer = CurTime()
	self:SetGraphicsCard("Stock GPU")
	self:SetCPU("Stock CPU")
	self:SetSpeed(1)
	self:SetValue(1)
	self:SetIntervals(self.interval)
	self:SetTimers(CurTime())
	self:SetNames(self.set_name)
	self:SetPowerUsage(self.power_usage)
	self:SetXOffset(self.xoffset)
	self:SetYOffset(self.yoffset)
	self:SetVectorOffsets(self.vector_offsets)
	self:SetAngleOffsets(self.angle_offsets)
    self:StartSound()
end