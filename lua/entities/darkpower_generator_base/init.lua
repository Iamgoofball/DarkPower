AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
resource.AddFile("resource/fonts/segoeuil.ttf")
-- /8==============================D~~~\
-- |DONT TOUCH ANYTHING BELOW THIS LINE|
-- \8==============================D~~~/

function ENT:StartSound()
    self.sound = CreateSound(self, Sound("ambient/machines/diesel_engine_idle1.wav"))
    self.sound:SetSoundLevel(75)
    self.sound:PlayEx(1, 100)
end

function ENT:Initialize()
    self:SetModel("models/props_c17/TrapPropeller_Engine.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()
	self:SetMaxPowered(self.maxpowered)
	self:SetPowerRadius(self.power_radius)
	self:SetXOffset(self.xoffset)
	self:SetYOffset(self.yoffset)
	self:SetOn(true)
	self:StartSound()
	self:SetUseType( SIMPLE_USE )
end

function ENT:Think()
	if self:GetOn() == true then
		local found_ents = ents.FindInSphere( self:GetPos(), self:GetPowerRadius() )
		for k, v in pairs(found_ents) do
			if string.find(v:GetClass(), "darkpower_powered") then
				if v:GetGenerator() != self and v:GetPowered() != true then
					local power_test = v:GetPowerUsage() + self:GetPowering()
					if power_test <= self:GetMaxPowered() then
						self:SetPowering(self:GetPowering() + v:GetPowerUsage())
						v:SetPowered(true)
						v:SetGenerator(self)
					end
				end
			end
		end
		for k, v in pairs(ents.FindByClass("darkpower_powered_*")) do
			if table.HasValue(found_ents, v) != true then
				if v:GetGenerator() == self and v:GetPowered() == true then
					self:SetPowering(self:GetPowering() - v:GetPowerUsage())
					v:SetPowered(false)
					v:SetGenerator(nil)
				end
			end
		end
	end
end

function ENT:OnRemove()
    if self.sound then
        self.sound:Stop()
    end
	self:DisablePower()
end

function ENT:DisablePower()
	for k, v in pairs(ents.FindByClass("darkpower_powered_*")) do
		if(IsValid(v)) then
			if v:GetGenerator() == self and v:GetPowered() == true then
				self:SetPowering(self:GetPowering() - v:GetPowerUsage())
				v:SetPowered(false)
				v:SetGenerator(nil)
			end
		end
	end
end

function ENT:Use(act, call)
	if self:GetOn() == true then
		if self.sound then
			self.sound:Stop()
		end
		self:DisablePower()
		self:SetOn(false)
	else
		self:StartSound()
		self:SetOn(true)
	end
end