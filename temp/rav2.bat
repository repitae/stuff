@echo on
setlocal EnableDelayedExpansion

for /f "tokens=5,6" %%a in ('netsh interface ipv4 show route ^| findstr "0.0.0.0/1"') do (
set IFI=%%a
set GWI=%%b
)

if [%IFI%]==[] ( goto :Disconnected ) else ( 
if [%GWI%]==[] ( goto :Disconnected )
)

route add 10.128.0.0 mask 255.128.0.0 %GWI% metric 5 if %IFI% > NUL
route delete 0.0.0.0/1
route delete 128.0.0.0/1

for /f "tokens=2 delims=." %%a in ("%GWI%") do (
set OCT=%%a
)

if [%OCT%]==[] ( goto :Disconnected ) else ( 
route add 10.%OCT%.0.0 mask 255.255.0.0 %GWI% metric 5 if %IFI% > NUL
)

rem pause
exit /b

:Disconnected
echo "Disconnected"
exit /b