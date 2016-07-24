include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
	self:DrawPrinterHUD()
end

function ENT:DrawPrinterHUD()
	if halo.RenderedEntity()==self then return end
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
		local y_offset = self:GetYOffset() - 50
		local generator = self:GetGenerator()
		local powerused = self:GetPowerUsage()
		local name = self:GetNames()
		local money = self:GetMoney()
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, 220 * multiplier, 5 * multiplier, Color(0,0,0,125*mathmemes) )
		draw.SimpleTextOutlined("Money", "Power3", x_offset * multiplier, (-15 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		draw.SimpleTextOutlined("$" .. money, "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		if IsValid(generator) then
			local timer = self:GetTimers()
			local interval = self:GetIntervals()
			local percent = math.Clamp((CurTime() - timer) / ((timer + interval) - timer), 0, 1)
			local width = percent * 220
			draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, width * multiplier, 5 * multiplier, Color(211,211,211,alphacalc) )
		end
	cam.End3D2D()
end

function ENT:Think()
end

