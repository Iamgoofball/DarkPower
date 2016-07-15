ENT.Type = "anim"
ENT.Base = "darkpower_powered_base"
ENT.PrintName = "Darkcoin Miner Base"
ENT.Spawnable = true
ENT.interval = 25
ENT.sound_level = 52
ENT.power_usage = 1
ENT.xoffset = -100
ENT.yoffset = -50
ENT.vector_offsets = Vector(0,0,0)
ENT.angle_offsets = Angle(0,90,90)
ENT.set_name = "Base Miner"
ENT.Category = "Darkcoin"

function ENT:initVars()
    self.model = "models/props_lab/reciever01b.mdl"
end

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "Generator")
    self:NetworkVar("Int", 0, "Coins")
	self:NetworkVar("Int", 1, "Timers")
	self:NetworkVar("Int", 2, "Intervals")
	self:NetworkVar("Int", 3, "Speed")
	self:NetworkVar("Int", 4, "Value")
	self:NetworkVar("Int", 5, "PowerUsage")
	self:NetworkVar("Int", 6, "XOffset")
	self:NetworkVar("Int", 7, "YOffset")
    self:NetworkVar("String", 0, "GraphicsCard")
    self:NetworkVar("String", 1, "CPU")
	self:NetworkVar("String", 2, "Names")
	self:NetworkVar("Bool", 0, "Powered")
	self:NetworkVar("Vector", 0, "VectorOffsets")
	self:NetworkVar("Angle", 0, "AngleOffsets")
end
