@echo off
setlocal enabledelayedexpansion
title Check Apps Beta avaiable on Testflight
CD /D %~dp0

git pull origin master
set "Testflight_CheckStatus=Testflight_CheckStatus.py"
echo Run "%Testflight_CheckStatus%" script...
python "%Testflight_CheckStatus%"
if %errorlevel% neq 0 (
    goto :exit
)

echo:

goto :commitGITHUB

:commitGITHUB
	set "Result_BetaAppsAvailable=Result_BetaAppsAvailable.md"
	git add "%Result_BetaAppsAvailable%"
	git commit -m "Updated!"
	git push origin master
goto :exit
	
:exit
	exit /B