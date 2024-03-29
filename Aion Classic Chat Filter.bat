@echo off

CALL :check_Permissions

setlocal ENABLEEXTENSIONS
set KEY_NAME=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\NCWest\AION_CLASSIC
set VALUE_NAME=BaseDir
FOR /F "tokens=2*" %%A IN ('REG QUERY "%KEY_NAME%" /v %VALUE_NAME% 2^>nul') DO (
	set AIONDIR=%%B
)

ECHO [%date% %time:~0,-3%] Aion directory found: %AIONDIR%

set oldFile=%AIONDIR%L10N\enu\Data\Strings\aionfilterline.dat
set filterFile=%AIONDIR%L10N\enu\Data\Strings\aionfilterline.pak

if exist "%oldFile%" (
	del '%oldFile%'
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	echo [%date% %time:~0,-3%] aionfilterline.dat file located and removed "(old format)".
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
)

if exist "%filterFile%" (
	echo [%date% %time:~0,-3%] aionfilterline.pak file located. Path: 
	echo [%date% %time:~0,-3%] "%filterFile%"
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	
	powershell attrib -r '%filterFile%'
	xcopy /Y "%~dp0L10N\enu\Data\Strings\aionfilterline.pak" "%AIONDIR%\L10N\enu\Data\Strings\"
	if errorlevel 1 goto errorSD
	powershell attrib +r '%filterFile%'
	
	echo [%date% %time:~0,-3%] --------------- Aion Chat Filter Updated and set to read only.
	endlocal
	color A0
	pause
	exit
) else (
	xcopy /Y "%~dp0L10N\enu\Data\Strings\aionfilterline.pak" "%AIONDIR%\L10N\enu\Data\Strings"
	if errorlevel 1 goto errorSD
	powershell attrib +r '%filterFile%'

	echo [%date% %time:~0,-3%] --------------- Aion Chat Filter Updated and set to read only.
	endlocal
	color A0
	pause
	exit
)

:errorSD
color 47
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
	color 47
	echo [%date% %time:~0,-3%] Failure: Current permissions inadequate. Run scritp 
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	echo [%date% %time:~0,-3%] as administrator: Right Click - Run as Admin
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	echo [%date% %time:~0,-3%] Exiting script.
	echo [%date% %time:~0,-3%] -------------------------------------------------------------
	pause
	exit
)
