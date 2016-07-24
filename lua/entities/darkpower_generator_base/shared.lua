ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Darkpower Generator Base"
ENT.Spawnable = true
ENT.maxpowered = 5
ENT.power_radius = 200
ENT.xoffset = -100
ENT.yoffset = -100
ENT.Category = "Darkpower"
ENT.isdarkgenerator = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "MaxPowered")
	self:NetworkVar("Int", 1, "Powering")
	self:NetworkVar("Int", 2, "PowerRadius")
	self:NetworkVar("Int", 3, "XOffset")
	self:NetworkVar("Int", 4, "YOffset")
	self:NetworkVar("Bool", 0, "On")
end
