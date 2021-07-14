@echo off

CALL :check_Permissions

setlocal ENABLEEXTENSIONS
set KEY_NAME=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\NCWest\AION_CLASSIC
set VALUE_NAME=BaseDir
FOR /F "tokens=2*" %%A IN ('REG QUERY "%KEY_NAME%" /v %VALUE_NAME% 2^>nul') DO (
	set AIONDIR=%%B
)

ECHO [%date% %time:~0,-3%] Aion directory found: %AIONDIR%

set filterFile="%AIONDIR%L10N\enu\Data\Strings\aionfilterline.dat"

if exist %filterFile% (
	echo [%date% %time:~0,-3%] aionfilterline.dat file located. Path: 
	echo [%date% %time:~0,-3%] %filterFile%
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	
	powershell attrib -r %filterFile%
	xcopy /Y "%~dp0L10N\enu\Data\Strings\aionfilterline.dat" "%AIONDIR%\L10N\enu\Data\Strings\"
	if errorlevel 1 goto errorSD
	powershell attrib +r %filterFile%
	
	echo [%date% %time:~0,-3%] --------------- Aion Chat Filter Updated and set to read only.
	endlocal
	pause
	exit
) else (
	xcopy /Y "%~dp0L10N\enu\Data\Strings\aionfilterline.dat" "%AIONDIR%\L10N\enu\Data\Strings\"
	if errorlevel 1 goto errorSD
	powershell attrib +r %filterFile%

	echo [%date% %time:~0,-3%] --------------- Aion Chat Filter Updated and set to read only.
	endlocal
	pause
	exit
)

:errorSD
echo [%date% %time:~0,-3%] --------------- ERROR 'CF1': Filter file aionfilterline.dat is being used. Go to the chadacter selection screen or close the game client. If the error persists, restart your computer and try again.
endlocal
pause
exit

:check_Permissions
echo [%date% %time:~0,-3%] -------------------------------------------------------------
echo [%date% %time:~0,-3%] Administrative permissions required. Detecting permissions...
echo [%date% %time:~0,-3%] -------------------------------------------------------------

net session >nul 2>&1
if %errorLevel% == 0 (
	echo [%date% %time:~0,-3%] Success: Administrative permissions confirmed.
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
) else (
	echo [%date% %time:~0,-3%] Failure: Current permissions inadequate.
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	echo [%date% %time:~0,-3%] Run scritp as administrator: Right Click > Run as Admin
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	echo [%date% %time:~0,-3%] Exiting script.
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	pause
	exit
)
