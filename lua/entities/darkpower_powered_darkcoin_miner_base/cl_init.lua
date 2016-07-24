include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:DrawPowerHUD()
	self:DrawMinerHUD()
end

function ENT:DrawMinerHUD()
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
		local coins = self:GetCoins()
		local timer = self:GetTimers()
		local interval = self:GetIntervals()
		local gpu = self:GetGraphicsCard()
		local cpu = self:GetCPU()
		local percent = math.Clamp((CurTime() - timer) / ((timer + interval) - timer), 0, 1)
		local width = percent * 220
		local x_offset = self:GetXOffset() - 0
		local y_offset = self:GetYOffset() - 125 
		draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, 220 * multiplier, 5 * multiplier, Color(0,0,0,125*mathmemes) )
		draw.SimpleTextOutlined("Darkcoin Miner", "Power3", x_offset * multiplier, multiplier * (-15 + y_offset), Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		local generator = self:GetGenerator()
		if IsValid(generator) then
			draw.RoundedBox( 0, x_offset * multiplier, y_offset * multiplier, (220 * percent) * multiplier, 5 * multiplier, Color(2241, 196, 15,alphacalc) )
			draw.SimpleTextOutlined("Darkcoins: " .. coins, "Power", x_offset * multiplier, (5 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		else
			draw.SimpleTextOutlined("Unpowered", "Power", x_offset * multiplier, 5 + y_offset * multiplier, Color(255,0,0,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		end
		draw.SimpleTextOutlined("Graphics Card: " .. gpu, "Power", x_offset * multiplier, (35 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
		draw.SimpleTextOutlined("CPU: " .. cpu, "Power", x_offset * multiplier, (65 + y_offset) * multiplier, Color(255,255,255,alphacalc),0,0, math.Clamp(3*mathmemes, -1, 3), Color(0,0,0,125*mathmemes))
	cam.End3D2D()
end

function ENT:Think()
end
