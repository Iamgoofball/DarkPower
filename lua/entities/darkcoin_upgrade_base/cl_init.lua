include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawUpgradeHUD()
end

function ENT:DrawUpgradeHUD()
	local final_angle = EyeAngles():Up():Angle()
	final_angle:RotateAroundAxis(EyeAngles():Up(), 360)
	final_angle:RotateAroundAxis(EyeAngles():Forward(), 90)

	cam.Start3D2D(self:GetPos(), final_angle, 0.075)
		local multiplier = 4
		local x_offset = -400
		local y_offset = -500
		local name = self:GetNames()
		local types = self:GetTypes()
		local dist = self:GetPos():Distance(EyePos())
		local dist_calc = dist / 700
		local mathmemes = 1 - dist_calc
		local alphacalc = 255 * mathmemes
		draw.RoundedBox( 0, x_offset, y_offset, 220 * multiplier, 5 * multiplier, Color(255,255,255,alphacalc) )
		draw.SimpleTextOutlined(types, "Power3", x_offset, (-15 * multiplier )+ y_offset, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0))
		draw.SimpleTextOutlined(name, "Power", x_offset, (5 * multiplier) + y_offset, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0))
	cam.End3D2D()
end

function ENT:Think()
end
