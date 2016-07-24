ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Darkpower Powered Base"
ENT.Spawnable = true
ENT.power_usage = 1
ENT.xoffset = -100
ENT.yoffset = -200
ENT.set_name = "Ent Name"
ENT.Category = "Darkpower"
ENT.isdarkpowered = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Powered")
	self:NetworkVar("Int", 0, "PowerUsage")
	self:NetworkVar("Int", 1, "XOffset")
	self:NetworkVar("Int", 2, "YOffset")
	self:NetworkVar("Entity", 0, "Generator")
	self:NetworkVar("String", 0, "Names")
end
