ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Darkcoin Upgrade Base"
ENT.Spawnable = true
ENT.name = "Default GPU"
ENT.type = "Graphics Card"
ENT.speed = 1
ENT.value = 1
ENT.Category = "Darkcoin"


function ENT:initVars()
    self.model = "models/maxofs2d/hover_rings.mdl"
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Speed")
	self:NetworkVar("Int", 1, "Value")
    self:NetworkVar("String", 0, "Names")
    self:NetworkVar("String", 1, "Types")
end
