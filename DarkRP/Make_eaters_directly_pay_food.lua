--[[
This DarkRP script makes the food to be directly paid by eaters instead of cooks.
This is very useful to prevent the food from being stolen.
Also the cost for cooks is 0 because they can spawn food for free.

Put the following code before food declaration in
garrysmod/addons/darkrpmodification/lua/darkrp_customthings/food.lua
]]

if SERVER then
	local old_createFood = DarkRP.createFood
	DarkRP.createFood = function( name, tbl, ... )
		tbl.clientprice = tbl.price -- Le consommateur paie.
		tbl.price = 0 -- Le restaurateur ne paie rien.
		return old_createFood( name, tbl, ... )
	end
	
	hook.Add( "playerBoughtFood", "custom food", function( ply, food, spawnedfood )
		spawnedfood:SetNWInt( "clientprice", food.clientprice or 0 )
	end )
	
	timer.Simple( 0, function()
		local spawned_food = scripted_ents.GetStored( "spawned_food" ).t
		if !spawned_food.UseEaterPay then
			spawned_food.UseEaterPay = spawned_food.Use
			function spawned_food:Use( activator, caller, ... )
				self:UseEaterPay( activator, caller, ... )
				local price = self:GetNWInt( "clientprice", 0 )
				caller:addMoney( -price )
				DarkRP.notify( caller, NOTIFY_GENERIC, 4, "Vous venez de payer "..price..GAMEMODE.Config.currency.." pour consommer ceci." )
			end
		end
	end )
end
