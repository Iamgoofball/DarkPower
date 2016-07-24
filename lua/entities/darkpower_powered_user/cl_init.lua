include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
	self:DrawUserHUD()
end

function ENT:DrawUserHUD()
	if halo.RenderedEntity()==self then return end
	local final_angle = EyeAngles():Up():Angle()
	final_angle:RotateAroundAxis(EyeAngles():Up(), 360)
	final_angle:RotateAroundAxis(EyeAngles():Forward(), 90)
	local multiplier = 4
	local dist = self:GetPos():Distance(EyePos())
	local dist_calc = dist / 700
	local mathmemes = 1 - dist_calc
	local alphacalc = 255 * mathmemes
	local owner = self:GetOwner()

	cam.Start3D2D(self:GetPos(), final_angle, 0.075)
		local x_offset = self:GetXOffset()
		local y_offset = self:GetYOffset() - 50
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, 220 * multiplier, 5 * multiplier, Color(211,211,211,125*mathmemes) )
		draw.SimpleTextOutlined("User", "Power3", x_offset * multiplier, (-15 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125 * mathmemes))
		if IsValid(owner) then
			draw.SimpleTextOutlined("Owner: " .. owner:GetName(), "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1,3), Color(0,0,0,125 * mathmemes))
		else
			draw.SimpleTextOutlined("No owner!", "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1,3), Color(0,0,0,125 * mathmemes))			
		end
	cam.End3D2D()
end