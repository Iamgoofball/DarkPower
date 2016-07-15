AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Change this value to change how much you make per print by default.
local AverageMoneyPerPrint = 250
-- /8==============================D~~~\
-- |DONT TOUCH ANYTHING BELOW THIS LINE|
-- \8==============================D~~~/

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

function ENT:PoweredThink()
	if CurTime() > self:GetTimers() + self:GetIntervals() then
		self.timer = CurTime()
		self:SetTimers(self.timer)
		self:SetMoney(self:GetMoney() + (AverageMoneyPerPrint * self:GetPowerUsage()))
	end
end

function ENT:Use(act, call)
	local dosh = self:GetMoney()
	if dosh > 0 then
		self:SetMoney(0)
		call:addMoney(dosh)
		DarkRP.notify( call, 0, 4, "You pick up $" .. dosh .. "." )
	end
end