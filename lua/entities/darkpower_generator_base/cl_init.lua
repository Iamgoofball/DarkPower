include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	self:DrawGeneratorHUD()
end

function ENT:DrawGeneratorHUD()
	if halo.RenderedEntity()==self then return end
	local multiplier = 4
	local dist = self:GetPos():Distance(EyePos())
	local dist_calc = dist / 700
	local mathmemes = 1 - dist_calc
	local alphacalc = 255 * mathmemes
	local final_angle = EyeAngles():Up():Angle()
	final_angle:RotateAroundAxis(EyeAngles():Up(), 360)
	final_angle:RotateAroundAxis(EyeAngles():Forward(), 90)
	cam.Start3D2D(self:GetPos(), final_angle, 0.075)
		render.PushFilterMin(TEXFILTER.ANISOTROPIC)
		local x_offset = self:GetXOffset()
		local y_offset = self:GetYOffset()
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, 220 * multiplier, 5 * multiplier, Color(0, 0, 0, 125*mathmemes) )
		draw.SimpleTextOutlined("Generator", "Power3", x_offset * multiplier, (-15 * multiplier) + (y_offset * multiplier), Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0, 125 * mathmemes))
		local maxpowered = self:GetMaxPowered()
		local powering = self:GetPowering()
		local percent = powering / maxpowered
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, (220 * multiplier) * percent, 5 * multiplier, Color(241, 196, 15,alphacalc) )
		if self:GetOn() == true then
			draw.SimpleTextOutlined(powering .. "/" .. maxpowered, "Power", x_offset * multiplier, (5 * multiplier) + (y_offset * multiplier), Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0, 125 * mathmemes))
		else
			draw.SimpleTextOutlined("Offline", "Power", x_offset * multiplier, (5 * multiplier) + (y_offset * multiplier), Color(255,0,0,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0, 125 * mathmemes))			
		end
		render.PopFilterMin()
	cam.End3D2D()
end

function ENT:Think()
end