-- This serverside script allows you to spawn seats as they were props, even when vehicle spawning is disabled.
-- Do not forget to install the must-have "Seats Network Optimizer" on your server: http://steamcommunity.com/sharedfiles/filedetails/?id=622814666
-- Save this file as garrysmod/lua/autorun/server/spawn_seats_as_props.lua

local AllowedModels = {
	["models/nova/chair_wood01.mdl"]=true, -- Wooden Chair
	["models/nova/chair_plastic01.mdl"]=true, -- Chair
	["models/nova/jeep_seat.mdl"]=true, -- Jeep Seat
	["models/nova/airboat_seat.mdl"]=true, -- Airboat Seat
	["models/nova/chair_office01.mdl"]=true, -- Office Chair
	["models/nova/chair_office02.mdl"]=true, -- Big Office Chair
	["models/nova/jalopy_seat.mdl"]=true, -- Jalopy Seat
	["models/props_phx/carseat2.mdl"]=true, -- Car Seat
	["models/props_phx/carseat3.mdl"]=true, -- Car Seat 2
	["models/props_phx/carseat2.mdl"]=true, -- Car Seat 3
}
hook.Add( "PlayerSpawnVehicle", "spawn_seats_as_props", function( ply, model, name, Table )
	if Table.Class == "prop_vehicle_prisoner_pod" and AllowedModels[model] then
		return hook.Call( "PlayerSpawnProp", GAMEMODE, ply, model )
	end
end )
hook.Add( "PlayerSpawnedVehicle", "spawn_seats_as_props", function( ply, ent )
	if ent:GetClass() == "prop_vehicle_prisoner_pod" then
		ent:setKeysNonOwnable( true )
	end
end )
