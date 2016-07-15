--Static Vars
ENT.Type = "anim"
ENT.Base = "darkpower_powered_darkcoin_miner_base"
ENT.PrintName = "Darkcoin Miner Light"
ENT.Spawnable = true;
ENT.AdminSpawnable = true;
ENT.interval = 25
ENT.sound_level = 52
ENT.power_usage = 1
ENT.xoffset = -100
ENT.yoffset = -75
ENT.set_name = "Light Miner"

function ENT:initVars()
    self.model = "models/props_lab/reciever01b.mdl"
end