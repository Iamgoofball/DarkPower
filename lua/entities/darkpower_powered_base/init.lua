AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_wasteland/kitchen_stove001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

	self:SetNames(self.set_name)
	self:SetPowerUsage(self.power_usage)
	self:SetXOffset(self.xoffset)
	self:SetYOffset(self.yoffset)
end

function ENT:Think()
	if self:GetPowered() == true then
		self:PoweredThink()
	end
end

function ENT:PoweredThink()
end

function ENT:OnRemove()
	local generator = self:GetGenerator()
	if IsValid(generator) then
		generator:SetPowering(generator:GetPowering() - self:GetPowerUsage())
		self:SetPowered(false)
		self:SetGenerator(nil)
	end
end