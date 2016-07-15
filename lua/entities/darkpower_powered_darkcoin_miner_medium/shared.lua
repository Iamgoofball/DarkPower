--Static Vars
ENT.Type = "anim"
ENT.Base = "darkpower_powered_darkcoin_miner_base"
ENT.PrintName = "Darkcoin Miner Medium"
ENT.Spawnable = true;
ENT.AdminSpawnable = true;
ENT.interval = 15
ENT.sound_level = 75
ENT.power_usage = 3
ENT.xoffset = 170
ENT.yoffset = -150
ENT.set_name = "Medium Miner"

function ENT:initVars()
    self.model = "models/props_lab/servers.mdl"
end
