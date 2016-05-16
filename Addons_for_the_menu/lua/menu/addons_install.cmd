@echo off
copy menu.lua menu.original.lua
copy menu.lua menu.addons.lua

echo.>> menu.addons.lua
echo for _,luafile in pairs( file.Find( "lua/menu/menu_addons/*.lua", "MOD" ) ) do>> menu.addons.lua
echo 	include( "menu_addons/"..luafile )>> menu.addons.lua
echo end>> menu.addons.lua

echo Installed menu addons!
pause
