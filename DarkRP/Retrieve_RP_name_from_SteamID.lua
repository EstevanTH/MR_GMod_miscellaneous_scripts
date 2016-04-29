-- This scripts only works serverside, without using MySQL as the DarkRP database.
-- The formula of the uid is from garrysmod\lua\includes\extensions\util.lua.

function FindRPName( SteamID )
	return sql.QueryValue( "SELECT rpname FROM darkrp_player WHERE uid = "..util.CRC( "gm_"..SteamID.."_gm" ).." LIMIT 1;" )
end
