-- The usage of this script is discouraged when you have many complex 3D models, because it can crash clients (too many models in cache).
-- The server's model cache is synchronized with clients. The model cache is only cleared when restarting the server / game.
-- Save this file as: garrysmod/addons/models_preloader/lua/autorun/server/models_preloader.lua

-- Preload all vehicle models:
for _,VehicleTable in pairs( list.GetForEdit( "Vehicles" ) ) do
	if isstring( VehicleTable.Model ) then
		util.PrecacheModel( VehicleTable.Model )
	end
end

-- Preload all scripted weapon models:
for _,EntityTable in pairs( scripted_ents.GetList() ) do
	if isstring( EntityTable.t.Model ) then -- may contain useful value
		util.PrecacheModel( EntityTable.t.Model )
	end
end

-- Preload all scripted entity models:
for _,WeaponTable in pairs( scripted_ents.GetList() ) do
	if isstring( WeaponTable.ViewModel ) then
		util.PrecacheModel( WeaponTable.ViewModel )
	end
	if isstring( WeaponTable.WorldModel ) then
		util.PrecacheModel( WeaponTable.WorldModel )
	end
	if isstring( WeaponTable.Model ) then -- might be useful
		util.PrecacheModel( WeaponTable.Model )
	end
end
