AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Change this value to change how much you make per coin by default.
local AmountPerCoin = 1000
-- /8==============================D~~~\
-- |DONT TOUCH ANYTHING BELOW THIS LINE|
-- \8==============================D~~~/

function ENT:StartSound()
    self.sound = CreateSound(self, Sound("ambient/machines/lab_loop1.wav"))
    self.sound:SetSoundLevel(self.sound_level)
    self.sound:PlayEx(1, 100)
end

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
	self:SetGenerator(nil)
end

function ENT:PoweredThink()
	if CurTime() > self:GetTimers() + self:GetIntervals() then
		self.timer = CurTime()
		self:SetTimers(self.timer)
		self:SetCoins(self:GetCoins() + 1)
	end
end

function ENT:OnRemove()
    if self.sound then
        self.sound:Stop()
    end
	local generator = self:GetGenerator()
	if IsValid(generator) then
		generator:SetPowering(generator:GetPowering() - self:GetPowerUsage())
		self:SetPowered(false)
		self:SetGenerator(nil)
	end
end

function ENT:Use(act, call)
	local coins = self:GetCoins()
	if coins > 0 then
		local money = (AmountPerCoin * coins) * self:GetValue()
		self:SetCoins(0)
		call:addMoney(money)
		DarkRP.notify( call, 0, 4, "You sell " .. coins .. " Darkcoin(s) for $" .. money )
	end
end

function ENT:StartTouch( hitEnt )
	if hitEnt:GetClass() == "darkcoin_upgrade_base" or hitEnt.Base == "darkcoin_upgrade_base" then
		local types = hitEnt:GetTypes()
		if self:GetGraphicsCard() == "Stock GPU" and types == "Graphics Card" then
			self:SetGraphicsCard(hitEnt:GetNames())
			self:SetValue(self:GetValue() + hitEnt:GetValue())
			self:SetIntervals(self:GetIntervals() - hitEnt:GetSpeed())
			hitEnt:Remove()
		elseif self:GetCPU() == "Stock CPU" and types == "CPU" then
			self:SetCPU(hitEnt:GetNames())
			self:SetValue(self:GetValue() + hitEnt:GetValue())
			self:SetIntervals(self:GetIntervals() - hitEnt:GetSpeed())
			hitEnt:Remove()
		end
	end
end