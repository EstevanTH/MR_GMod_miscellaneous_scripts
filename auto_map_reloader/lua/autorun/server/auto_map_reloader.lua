game.ConsoleCommand( "sv_hibernate_think 1\n" ) -- force the server to Think even when nobody is connected

local NextAutoReload
do
	local now = os.time()
	local nextreload = os.date( "*t" )
	nextreload.hour = 4
	nextreload.min = 30
	nextreload.sec = 0
	nextreload = os.time( nextreload )
	if nextreload <= now then
		nextreload = nextreload + 86400
	end
	NextAutoReload = nextreload
end

hook.Add( "Think", "auto_map_reloader", function()
	if os.time() > NextAutoReload and #player.GetAll() == 0 then
		ServerLog( "auto_map_reloader: Reloading the map right now.\n" )
		game.ConsoleCommand( "changelevel "..game.GetMap().."\n" ) -- reload the map
		hook.Remove( "Think", "auto_map_reloader" ) -- do not call changelevel more than once
	end
end )
