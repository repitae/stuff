@ECHO on
SETLOCAL EnableDelayedExpansion

REM dns1=dns.ix.ru
REM dns2=dns.yandex.ru
REM dns3=a.res-nsdi.ru
SET dns1=62.76.76.62
SET dns2=77.88.8.8
SET dns3=195.208.4.1
SET ni4=netsh interface ipv4

IF %ERRORLEVEL% EQU 0 ( GOTO :RTE ) ELSE ( GOTO :FAIL)
IF %ERRORLEVEL% EQU 0 ( GOTO :DNS ) ELSE ( GOTO :FAIL)
IF %ERRORLEVEL% EQU 0 ( GOTO :PST ) ELSE ( GOTO :FAIL)
IF %ERRORLEVEL% EQU 0 ( GOTO :END ) ELSE ( GOTO :FAIL)
pause

:RTE
REM Get the IfIndex and Gateway for 0/1
FOR /f "tokens=5,6" %%a IN ('%ni4% show route ^| findstr "0.0.0.0/1"') DO (
  SET IF_0001=%%a
  SET GW_0001=%%b
)

REM Get the IfIndex and Gateway for 128/1
FOR /f "tokens=5,6" %%c IN ('%ni4% show route ^| findstr "128.0.0.0/1"') DO (
  SET IF_1281=%%c
  SET GW_1281=%%d
)

REM Get the IfIndex and Gateway for 10/9
FOR /f "tokens=5,6" %%e IN ('%ni4% show route ^| findstr "10.128.0.0/9"') DO (
  SET IF_1289=%%e
  SET GW_1289=%%f
)

REM Delete split routes
IF [%GW_0001%]==[] ( GOTO :OFF ) ELSE ( 
IF [%IF_0001%]==[] ( GOTO :OFF ) ELSE ( 
  route delete 0.0.0.0/1 > NUL
  route delete 128.0.0.0/1 > NUL
  )
) 

REM Add new split route
IF [%GW_1289%]==[] ELSE ( 
IF [%IF_1289%]==[] ( 
  route add 10.128.0.0 mask 255.128.0.0 %GW_0001% metric 30 if %IF_0001% > NUL
  )
)

:DNS
REM Get default IfIndex
FOR /f "tokens=5" %%g IN ('%ni4% show route ^| findstr "0.0.0.0/0"') DO (
  SET IF_ID_0000=%%g
)

REM Get default IfName
FOR /f "tokens=5" %%h IN ('%ni4% show interfaces ^| findstr %IF_ID_0000%') DO (
  SET IF_NM_0000=%%h
)

REM Get vpn IfIndex
FOR /f "tokens=5" %%i IN ('%ni4% show route ^| findstr "10.128.0.0/9"') DO (
  SET IF_ID_1000=%%i
)

REM Get vpn IfName
FOR /f "tokens=5" %%j IN ('%ni4% show interfaces ^| findstr %IF_ID_1000%') DO (
  SET IF_NM_1000=%%j
)

REM Change default DNS
IF [%IF_NM_0000%]==[] ( GOTO :OFF ) ELSE ( 
  %ni4% add dnsserver %IF_NM_0000% address=%dns1% index=1 > NUL
  %ni4% add dnsserver %IF_NM_0000% address=%dns2% index=2 > NUL
  %ni4% add dnsserver %IF_NM_0000% address=%dns3% index=3 > NUL
)

REM Change vpn DNS (optional)
IF [%IF_NM_1000%]==[] ( GOTO :OFF ) ELSE (
  rem netsh interface ip set dns %IF_NM_1000% dhcp > NUL
)

:PST
REM Check the routing table for 0/0
FOR /f "tokens=5,6" %%k IN ('%ni4% show route ^| findstr "0.0.0.0/0"') DO (
  SET IF_0000=%%k
  SET GW_0000=%%l
)

REM Check the routing table for 10/9
FOR /f "tokens=5,6" %%m IN ('%ni4% show route ^| findstr "10.128.0.0/9"') DO (
  SET IF_1000=%%m
  SET GW_1000=%%n
)

REM Make sure the routes are not overlapping
IF [%IF_0000%]==[%IF_1000%] ( GOTO :FAIL ) ELSE ( 
IF [%GW_0000%]==[%GW_1000%] ( GOTO :FAIL ) ELSE ( GOTO :END ) )

:END
ECHO "Success"
EXIT /b 0

:OFF
ECHO "Offline"
EXIT /b 1

:FAIL
ECHO "Failed"
EXIT /b 2
