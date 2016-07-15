-- /8=================================================================D~~~\
-- |COPY THE BELOW LINES TO ENTITIES.LUA IN YOUR DARKRP MODIFICATION ADDON|
-- \8=================================================================D~~~/

DarkRP.createEntity("Darkcoin Miner (Light)", {
	ent = "darkpower_powered_darkcoin_miner_light",
	model = "models/props_lab/reciever01b.mdl",
	price = 5000,
	max = 8,
	cmd = "buylightminer",
})

DarkRP.createEntity("Darkcoin Miner (Medium)", {
	ent = "darkpower_powered_darkcoin_miner_medium",
	model = "models/props_lab/servers.mdl",
	price = 10000,
	max = 5,
	cmd = "buymediumminer",
})

DarkRP.createEntity("Darkcoin Miner (Heavy)", {
	ent = "darkpower_powered_darkcoin_miner_heavy",
	model = "models/props_lab/workspace001.mdlz",
	price = 15000,
	max = 2,
	cmd = "buyheavyminer",
})

-- 8=======================================D~~~

DarkRP.createEntity("AYYMD 29000 CPU", {
	ent = "darkcoin_cpu_amd_t1",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 5000,
	max = 420,
	cmd = "buycpuamdt1",
})
DarkRP.createEntity("AYYMD Athlon X2 CPU", {
	ent = "darkcoin_cpu_amd_t2",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 10000,
	max = 420,
	cmd = "buycpuamdt2",
})
DarkRP.createEntity("AYYMD Jaguar CPU", {
	ent = "darkcoin_cpu_amd_t3",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 15000,
	max = 420,
	cmd = "buycpuamdt3",
})
DarkRP.createEntity("Intel 4004 CPU", {
	ent = "darkcoin_cpu_intel_t1",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 5000,
	max = 420,
	cmd = "buycpuintelt1",
})
DarkRP.createEntity("Intel Pentium II CPU", {
	ent = "darkcoin_cpu_intel_t2",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 10000,
	max = 420,
	cmd = "buycpuintelt2",
})
DarkRP.createEntity("Intel Ivy Bridge CPU", {
	ent = "darkcoin_cpu_intel_t3",
	model = "models/maxofs2d/hover_propeller.mdl",
	price = 15000,
	max = 420,
	cmd = "buycpuintelt3",
})

DarkRP.createEntity("AYYMD Radeon R100 GPU", {
	ent = "darkcoin_gpu_amd_t1",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 5000,
	max = 420,
	cmd = "buygpuamdt1",
})
DarkRP.createEntity("AYYMD Radeon HD 5970 GPU", {
	ent = "darkcoin_gpu_amd_t2",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 10000,
	max = 420,
	cmd = "buygpuamdt2",
})
DarkRP.createEntity("AYYMD Radeon RX 480 GPU", {
	ent = "darkcoin_gpu_amd_t3",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 15000,
	max = 420,
	cmd = "buygpuamdt3",
})
DarkRP.createEntity("NaNvidia GeForce 256 GPU", {
	ent = "darkcoin_gpu_nvidia_t1",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 5000,
	max = 420,
	cmd = "buygpunvidiat1",
})
DarkRP.createEntity("NaNvidia GeForce FX 5800 Ultra GPU", {
	ent = "darkcoin_gpu_nvidia_t2",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 10000,
	max = 420,
	cmd = "buygpunvidiat2",
})
DarkRP.createEntity("NaNvidia GeForce GTX 1080 GPU", {
	ent = "darkcoin_gpu_nvidia_t3",
	model = "models/maxofs2d/hover_rings.mdl",
	price = 15000,
	max = 420,
	cmd = "buygpunvidiat3",
})