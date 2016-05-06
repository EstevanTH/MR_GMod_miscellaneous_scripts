-- Updater
local cook_here = false
hook.Add( "Think", "darkrp_no_cook_no_hunger", function()
	cook_here = false
	for _,pl in pairs( player.GetAll() ) do
		if pl:Team() == TEAM_COOK then
			cook_here = true
			return
		end
	end
end )

-- Nowadays HungerMod
hook.Add( "hungerUpdate", "darkrp_no_cook_no_hunger", function()
	if !cook_here then
		return true
	end
end )

-- Old HungerMod
hook.Add( "PostGamemodeLoaded", "darkrp_no_cook_no_hunger", function()
	local HookTable = hook.GetTable()
	if  istable( HookTable )
	and istable( HookTable["Think"] )
	and isfunction( HookTable["Think"]["HMThink"] ) then
		local old_HMThink = HookTable["Think"]["HMThink"]
		hook.Add( "Think", "HMThink", function( ... )
			if cook_here then
				return old_HMThink( ... )
			end
		end )
	end
end )
