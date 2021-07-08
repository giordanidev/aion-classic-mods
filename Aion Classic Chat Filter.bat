@echo off

CALL :check_Permissions

setlocal ENABLEEXTENSIONS
set KEY_NAME=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\NCWest\AION_CLASSIC
set VALUE_NAME=BaseDir
FOR /F "tokens=2*" %%A IN ('REG QUERY "%KEY_NAME%" /v %VALUE_NAME% 2^>nul') DO (
	set AIONDIR=%%B
)

ECHO Aion directory found: %AIONDIR%

xcopy "%~dp0L10N\enu\Data\Strings\aionfilterline.dat" "%AIONDIR%\L10N\enu\Data\Strings\"
if errorlevel 1 goto errorSD
echo "-------------- Aion Chat Filter Updated --------------"
endlocal
pause
exit

:errorSD
echo "-------------- ERROR 'CF1': Filter file aionfilterline.dat is being used. Close the client or restart your computer and try again. --------------"
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
