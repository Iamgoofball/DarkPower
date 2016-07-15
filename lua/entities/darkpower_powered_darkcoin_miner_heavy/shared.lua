--Static Vars
ENT.Type = "anim"
ENT.Base = "darkpower_powered_darkcoin_miner_base"
ENT.PrintName = "Darkcoin Miner Heavy"
ENT.Spawnable = true;
ENT.AdminSpawnable = true;
ENT.interval = 8
ENT.sound_level = 100
ENT.power_usage = 5
ENT.xoffset = 50
ENT.yoffset = -225
ENT.set_name = "Heavy Miner"

function ENT:initVars()
    self.model = "models/props_lab/workspace001.mdl"
end
