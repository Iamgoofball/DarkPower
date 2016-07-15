AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props/cs_office/microwave.mdl")
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

function ENT:PoweredThink()
	if IsValid(self:GetOwner()) then
		local found_ents = ents.FindInSphere( self:GetPos(), 300 )
		for k, v in pairs(found_ents) do
			if IsValid(v) then
				if string.find(v:GetClass(), "darkpower_powered_") then
					v:Use(self, self:GetOwner(), CONTINUOUS_USE, 0)
				end
			end
		end
	end
end

function ENT:Use(act, call)
	self:SetOwner(call)
end