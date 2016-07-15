ENT.Type = "anim"
ENT.Base = "darkpower_powered_base"
ENT.PrintName = "User"
ENT.Spawnable = true
ENT.power_usage = 2
ENT.xoffset = -100
ENT.yoffset = -125
ENT.set_name = "User"
ENT.Category = "Darkpower"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Powered")
	self:NetworkVar("Int", 0, "PowerUsage")
	self:NetworkVar("Int", 1, "XOffset")
	self:NetworkVar("Int", 2, "YOffset")
	self:NetworkVar("Entity", 0, "Generator")
	self:NetworkVar("Entity", 1, "Owner")
	self:NetworkVar("String", 0, "Names")
end
