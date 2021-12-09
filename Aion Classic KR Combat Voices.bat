@echo off

CALL :check_Permissions

setlocal ENABLEEXTENSIONS
set KEY_NAME=HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\NCWest\AION_CLASSIC
set VALUE_NAME=BaseDir
FOR /F "tokens=2*" %%A IN ('REG QUERY "%KEY_NAME%" /v %VALUE_NAME% 2^>nul') DO (
	set AIONDIR=%%B
)

ECHO Aion directory found: %AIONDIR%

if exist "%AIONDIR%\L10N\enu\Sounds\voice" (
	if exist "%AIONDIR%\L10N\enu\Sounds\voiceNA" (
		rmdir /S /Q "%AIONDIR%\L10N\enu\Sounds\voice"
		if errorlevel 1 goto errorSD
		echo "-------------- KOREAN COMBAT voices ACTIVATED. The client will now load the original KR COMBAT voices. --------------"
		endlocal
		color A0
		pause
		exit
	) else (
		ren "%AIONDIR%\L10N\enu\Sounds\voice" voiceNA
		if errorlevel 1 goto errorSD
		echo "-------------- KOREAN COMBAT voices ACTIVATED. The client will now load the original KR COMBAT voices. --------------"
		endlocal
		color A0
		pause
		exit
	)
) else (
	ren "%AIONDIR%\L10N\enu\Sounds\voiceNA" voice
	if errorlevel 1 goto errorSD
	echo "-------------- NA COMBAT voices RESTORED. The client will now load the NA COMBAT voices. --------------"
	endlocal
	color 47
	pause
	exit
)

:errorSD
color 47
echo "-------------- ERROR 'NAV1': Voices folder is being used. Close the client or restart your computer and try again. --------------"
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
	color 47
	echo [%date% %time:~0,-3%] Failure: Current permissions inadequate.
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	echo [%date% %time:~0,-3%] Run scritp as administrator: Right Click > Run as Admin
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	echo [%date% %time:~0,-3%] Exiting script.
	echo [%date% %time:~0,-3%] ----------------------------------------------------
	pause
	exit
)
