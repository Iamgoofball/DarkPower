ENT.Type = "anim"
ENT.Base = "darkpower_powered_base"
ENT.PrintName = "Darkpower Printer Base"
ENT.Spawnable = true
ENT.interval = 25
ENT.xoffset = -100
ENT.yoffset = -100
ENT.set_name = "Printer Base"
ENT.Category = "Darkpower"

function ENT:initVars()
    self.model = "models/props_c17/consolebox03a.mdl"
end

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Powered")
	self:NetworkVar("Int", 0, "PowerUsage")
	self:NetworkVar("Entity", 0, "Generator")
	self:NetworkVar("String", 0, "Names")
    self:NetworkVar("Int", 1, "Money")
	self:NetworkVar("Int", 2, "Timers")
	self:NetworkVar("Int", 3, "Intervals")
	self:NetworkVar("Int", 4, "XOffset")
	self:NetworkVar("Int", 5, "YOffset")
end
