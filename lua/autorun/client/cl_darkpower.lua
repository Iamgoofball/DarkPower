surface.CreateFont( "Power2", {
	font = "Segoe UI Light",
	extended = false,
	size = 120,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Power", {
	font = "Segoe UI Light",
	extended = false,
	size = 96,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Power3", {
	font = "Segoe UI Light",
	extended = false,
	size = 48,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add( "PreDrawHalos", "hooksareshitandsoami", function()
	tr = LocalPlayer():GetEyeTrace()
	local ent = not tr.HitWorld and tr.Entity

	if IsValid(ent) then
		--[[if ent.isdarkgenerator then -- Its a generator
			local poweredents = {}
			for _,e in pairs(ents.FindInSphere(ent:GetPos(),ent.power_radius)) do
				if e.isdarkpowered and e:GetPowered() and e:GetGenerator()==ent then
					poweredents[#poweredents+1] = e
				end
			end
			halo.Add( poweredents, Color(0, 0, 0), 5, 5, 2, true, false )

		else]]if ent.isdarkpowered and ent:GetPowered() and ent:GetGenerator() then -- Its a powered thingy
			halo.Add( {ent:GetGenerator()}, Color(241, 196, 15), 5, 5, 2, true, false)
		end
	end

end )
