include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
end

function ENT:DrawPowerHUD()
	local final_angle = EyeAngles():Up():Angle()
	final_angle:RotateAroundAxis(EyeAngles():Up(), 360)
	final_angle:RotateAroundAxis(EyeAngles():Forward(), 90)
	local multiplier = 4
	local dist = self:GetPos():Distance(EyePos())
	local dist_calc = dist / 700
	local mathmemes = 1 - dist_calc
	local alphacalc = 255 * mathmemes

	cam.Start3D2D(self:GetPos(), final_angle, 0.075)
		local x_offset = self:GetXOffset()
		local y_offset = self:GetYOffset()
		local generator = self:GetGenerator()
		local powerused = self:GetPowerUsage()
		local name = self:GetNames()
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, 220 * multiplier, 5 * multiplier, Color(0,0,0,125*mathmemes) )
		draw.SimpleTextOutlined(name, "Power3", x_offset * multiplier, (-15 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125 * mathmemes))
		if IsValid(generator) then
			local gen_powermax = generator:GetMaxPowered()
			local gen_powerused = generator:GetPowering()
			local percent1 = gen_powerused / gen_powermax
			local percent2 = powerused / gen_powermax
			draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, (220 * percent1) * multiplier, 5 * multiplier, Color(241, 196, 15,alphacalc) )
			draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, (220 * percent2) * multiplier, 5 * multiplier, Color(52, 152, 219,alphacalc) )
			draw.SimpleTextOutlined(powerused .. "/" .. gen_powermax, "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1,3), Color(0,0,0,125 * mathmemes))
		else
			draw.SimpleTextOutlined("Unpowered", "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,0,0,alphacalc), 0, 0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes) )
		end
	cam.End3D2D()
end

function ENT:Think()
end