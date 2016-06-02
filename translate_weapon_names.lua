-- Save this script as: garrysmod/addons/darkrpmodification/lua/autorun/translate_weapon_names.lua

hook.Add( "PreGamemodeLoaded", "translate_weapon_names", function()
	local hl=GetConVar( "gmod_language" ):GetString()
	local function TranslateWeaponName( class, PrintName )
		local SWEP = weapons.GetStored( class )
		if SWEP then
			SWEP.PrintName = PrintName
			weapons.Register( SWEP, class )
		else
			ErrorNoHalt( 'translate_weapon_names: Could not find weapon class "'..class..'"!\n' )
		end
	end
	
	-- BEGIN Configuration
	if hl=="fr" then
		TranslateWeaponName( "arrest_stick", "Bâton d'arrestation" ) -- DarkRP
		TranslateWeaponName( "door_ram", "Bélier" ) -- DarkRP
		TranslateWeaponName( "keys", "Clés" ) -- DarkRP
		TranslateWeaponName( "lockpick", "Crochet de serrurier" ) -- DarkRP
		TranslateWeaponName( "ls_sniper", "Sniper silencieux" ) -- DarkRP
		TranslateWeaponName( "med_kit", "Équipement médical" ) -- DarkRP
		TranslateWeaponName( "pocket", "Poche" ) -- DarkRP
		TranslateWeaponName( "stunstick", "Bâton étourdissant" ) -- DarkRP
		TranslateWeaponName( "unarrest_stick", "Bâton de libération" ) -- DarkRP
		TranslateWeaponName( "weapon_keypadchecker", "Contrôleur de Clavier d'Admin" ) -- DarkRP
		TranslateWeaponName( "weapon_pumpshotgun2", "Fusil à pompe" ) -- DarkRP
		TranslateWeaponName( "weaponchecker", "Contrôleur d'Armes" ) -- DarkRP
	end
	-- END Configuration
end )
