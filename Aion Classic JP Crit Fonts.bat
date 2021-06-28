@echo off

CALL :check_Permissions

setlocal ENABLEEXTENSIONS
set KEY_NAME=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\NCWest\AION_CLASSIC
set VALUE_NAME=BaseDir
FOR /F "tokens=2*" %%A IN ('REG QUERY "%KEY_NAME%" /v %VALUE_NAME% 2^>nul') DO (
	set AIONDIR=%%B
)

ECHO Aion directory found: %AIONDIR%

if exist "%AIONDIR%\L10N\enu\textures\ui\hit_number.pak" (
	ren "%AIONDIR%\L10N\enu\textures\ui\hit_number.pak" hit_number.pak.JP
	if errorlevel 1 goto errorSD
	acho "-------------- JP crit/block/parry fonts REMOVED. --------------"
	endlocal
	pause
	exit
) else (
	if exist "%AIONDIR%\L10N\enu\textures\ui\hit_number.pak.JP" (
		ren "%AIONDIR%\L10N\enu\textures\ui\hit_number.pak.JP" hit_number.pak
		if errorlevel 1 goto errorSD
	) else (
		xcopy "%~dp0ui\hit_number.pak" "%AIONDIR%\L10N\enu\textures\ui\"
		if errorlevel 1 goto errorSD
	)
	echo "-------------- JP crit/block/parry fonts INSTALLED. --------------"
	endlocal
	pause
	exit
)

:errorSD
echo "-------------- ERROR 'CF1': Fonts file hit_number.pak is being used. Close the client or restart your computer and try again. --------------"
endlocal
pause
exit

:check_Permissions
echo [%date% %time:~0,-3%] ----------------------------------------------------
echo [%date% %time:~0,-3%] Administrative permissions required. Detecting permissions...
echo [%date% %time:~0,-3%] ----------------------------------------------------

net session >nul 2>&1
if %errorLevel% == 0 (
	echo [%date% %time:~0,-3%] Success: Administrative permissions confirmed.
	echo [%date% %time:~0,-3%] ----------------------------------------------------
) else (
	echo [%date% %time:~0,-3%] Failure: Current permissions inadequate.
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	echo [%date% %time:~0,-3%] Run scritp as administrator: Right Click > Run as Admin
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	echo [%date% %time:~0,-3%] Exiting script.
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	pause
	exit
)
