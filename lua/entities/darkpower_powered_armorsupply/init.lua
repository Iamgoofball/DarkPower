AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_combine/suit_charger001.mdl")
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
	local found_ents = ents.FindInSphere( self:GetPos(), 300 )
	for k, v in pairs(found_ents) do
		if IsValid(v) then
			if v:IsPlayer() then
				local fuck = v:Armor() + 1
				if fuck < 101 then
					v:SetArmor(fuck)
				end
			end
		end
	end
end