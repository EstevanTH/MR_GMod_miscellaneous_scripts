local centerX,centerY = math.ceil( ScrW()/2 )-1,math.ceil( ScrH()/2 )-1
local white_128 = Color( 255,255,255,128 )
local black_64 = Color( 0,0,0,64 )
hook.Add("DrawOverlay", "mr_crosshair", function()
	surface.DrawCircle( centerX, centerY, 7, black_64 )
	surface.DrawCircle( centerX, centerY, 9, black_64 )
	surface.DrawCircle( centerX, centerY, 8, white_128 )
end )
