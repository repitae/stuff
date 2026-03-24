@echo off

:: Section 1: Public
route delete 0.0.0.0/5
route delete 8.0.0.0/7
route delete 11.0.0.0/8
route delete 12.0.0.0/6
route delete 16.0.0.0/4
route delete 32.0.0.0/3
route delete 64.0.0.0/2
route delete 128.0.0.0/2
route delete 192.0.0.0/4
route delete 208.0.0.0/5
route delete 216.0.0.0/8
route delete 217.0.0.0/13
route delete 217.8.0.0/14
route delete 217.12.0.0/15
route delete 217.14.0.0/19
route delete 217.14.32.0/20
route delete 217.14.48.0/21
route delete 217.14.56.0/24
route delete 217.14.57.0/28
route delete 217.14.58.0/23
route delete 217.14.60.0/22
route delete 217.14.64.0/18
route delete 217.14.128.0/17
route delete 217.15.0.0/16
route delete 217.16.0.0/12
route delete 217.32.0.0/11
route delete 217.64.0.0/10
route delete 217.128.0.0/9
route delete 218.0.0.0/7
route delete 220.0.0.0/6

:: Section 2: Somecast
:: route delete 224.0.0.0/4 2>&1
:: route delete 240.0.0.0/5 2>&1
:: route delete 248.0.0.0/6 2>&1
:: route delete 252.0.0.0/7 2>&1
:: route delete 254.0.0.0/8 2>&1
:: route delete 255.0.0.0/9 2>&1
:: route delete 255.128.0.0/10 2>&1
:: route delete 255.192.0.0/11 2>&1
:: route delete 255.224.0.0/12 2>&1
:: route delete 255.240.0.0/13 2>&1
:: route delete 255.248.0.0/14 2>&1
:: route delete 255.252.0.0/15 2>&1
:: route delete 255.254.0.0/16 2>&1
:: route delete 255.255.0.0/17 2>&1
:: route delete 255.255.128.0/18 2>&1
:: route delete 255.255.192.0/19 2>&1
:: route delete 255.255.224.0/20 2>&1
:: route delete 255.255.240.0/21 2>&1
:: route delete 255.255.248.0/22 2>&1
:: route delete 255.255.252.0/23 2>&1
:: route delete 255.255.254.0/24 2>&1
:: route delete 255.255.255.0/25 2>&1
:: route delete 255.255.255.128/26 2>&1
:: route delete 255.255.255.192/27 2>&1
:: route delete 255.255.255.224/28 2>&1
:: route delete 255.255.255.240/29 2>&1
:: route delete 255.255.255.248/30 2>&1
:: route delete 255.255.255.252/31 2>&1


:: Section 4: Home
route delete 172.17.22.0/24 2>&1
route delete 172.17.22.0/25 2>&1
route delete 172.17.22.128/25 2>&1

:: timeout /T 3
ping -n 3 127.0.0.1 2>&1