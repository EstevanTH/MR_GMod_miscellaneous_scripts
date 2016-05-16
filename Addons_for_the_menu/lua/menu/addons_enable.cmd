@echo off
if not exist menu.original.lua goto missing
if not exist menu.addons.lua goto missing
del menu.lua
copy menu.addons.lua menu.lua
echo Enabled menu addons!
pause
goto end
:missing
echo Please install menu addons first!
pause
:end
