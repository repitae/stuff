@ECHO on
SETLOCAL EnableDelayedExpansion

REM dns.ix.ru
REM dns.yandex.ru
REM a.res-nsdi.ru
SET dns1=62.76.76.62
SET dns2=77.88.8.8
SET dns3=195.208.4.1

CALL :RTE-Mod
IF ERRORLEVEL 0 CALL :DNS-Mod
IF ERRORLEVEL 0 CALL :Post-CH
GOTO :Exit

:RTE-Mod
REM Get the IfIndex and Gateway for 0/1
FOR /f "tokens=5,6" %%a IN ('netsh interface ipv4 show route ^| findstr "0.0.0.0/1"') DO (
  SET IF_001=%%a
  SET GW_001=%%b
)

REM Get the IfIndex and Gateway for 128/1
FOR /f "tokens=5,6" %%c IN ('netsh interface ipv4 show route ^| findstr "128.0.0.0/1"') DO (
  SET IF_128=%%c
  SET GW_128=%%d
)

REM Change the routing table
IF [%GW_001%]==[] ( GOTO :Offline ) ELSE ( 
IF [%IF_001%]==[] ( GOTO :Offline ) ELSE ( 
  route add 10.128.0.0 mask 255.128.0.0 %GW_001% metric 5 if %IF_001% > NUL
  route delete 0.0.0.0/1 > NUL
  route delete 128.0.0.0/1 > NUL
  )
) 

:DNS-Mod
REM Get default IfIndex
FOR /f "tokens=5" %%e IN ('netsh interface ipv4 show route ^| findstr "0.0.0.0/0"') DO (
  SET IF000_ID=%%e
)

REM Get default IfName
FOR /f "tokens=5" %%f IN ('netsh interface ipv4 show interfaces ^| findstr %IF000_ID%') DO (
  SET IF000_NM=%%f
)

REM Get vpn IfIndex
FOR /f "tokens=5" %%g IN ('netsh interface ipv4 show route ^| findstr "10.128.0.0/9"') DO (
  SET IF010_ID=%%g
)

REM Get vpn IfName
FOR /f "tokens=5" %%h IN ('netsh interface ipv4 show interfaces ^| findstr %IF010_ID%') DO (
  SET IF010_NM=%%h
)

REM Change default DNS
IF [%IF000_NM%]==[] ( GOTO :Offline ) ELSE ( 
  netsh interface ipv4 add dnsserver %IF000_NM% address=%dns1% Index=1 > NUL
  netsh interface ipv4 add dnsserver %IF000_NM% address=%dns2% Index=2 > NUL
  netsh interface ipv4 add dnsserver %IF000_NM% address=%dns3% Index=3 > NUL
)

REM Change vpn DNS (optional)
IF [%IF010_NM%]==[] ( GOTO :Offline ) ELSE (
  rem netsh interface ip set dns %IF010_NM% dhcp
)

:Post-CH
REM Check the routing table for 0/0
FOR /f "tokens=5,6" %%i IN ('netsh interface ipv4 show route ^| findstr "0.0.0.0/0"') DO (
  SET IF_00=%%i
  SET GW_00=%%j
)

REM Check the routing table for 10/9
FOR /f "tokens=5,6" %%k IN ('netsh interface ipv4 show route ^| findstr "10.128.0.0/9"') DO (
  SET IF_10=%%k
  SET GW_10=%%l
)

REM Make sure the routes are not overlapping
IF [%IF_00%]==[%IF_10%] ( GOTO :Fail ) ELSE ( 
  IF [%GW_00%]==[%GW_10%] ( GOTO :Fail ) ELSE (
    GOTO :End
)

:End
ECHO "Success"
GOTO :Exit

:Offline
ECHO "Offline"
GOTO :Exit

:Fail
ECHO "Failed"
GOTO :Exit

:Exit
PAUSE
EXIT /b 0