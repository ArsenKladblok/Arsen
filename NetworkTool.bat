@echo off
color 02
:beginning
echo Arsen's Networktool
echo.
echo.
echo.
ECHO 1.ShowIpv4Adress

ECHO 2.ShowRouterIpAdress

ECHO 3.ConnectedWifiPassFinder

ECHO 4.Clear

ECHO 5.Close
echo.
CHOICE /C 12345 /M "Enter your choice:"

IF ERRORLEVEL 5 GOTO Close
IF ERRORLEVEL 4 GOTO Clear
IF ERRORLEVEL 3 GOTO ConnectedWifiPassFinder
IF ERRORLEVEL 2 GOTO ShowRouterIpAdress
IF ERRORLEVEL 1 GOTO ShowIpv4Adress

:ShowIpv4Adress
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"') do set ip=%%b
set ip=%ip:~1%
echo.
echo.
echo Your Ipv4 Adress is: %ip%
echo.
echo.
GOTO beginning

:ShowRouterIpAdress
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "Default Gateway"') do set ip=%%b
set ip=%ip:~1%
echo.
echo.
echo Your Router IP Adress is: %ip%
echo.
echo.
GOTO beginning

:ConnectedWifiPassFinder
netsh wlan show profiles
set /p id=" Which networks password do you want to reveal?: "
netsh wlan show profile name=%id% key=clear
GOTO beginning

:Clear
cls
GOTO beginning

:close
Exit