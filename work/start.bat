@echo off
cls & color 02
mode con:cols=125 lines=45

:: Section 1: Public
route delete 0.0.0.0/5 >nul
route delete 8.0.0.0/7 >nul
route delete 11.0.0.0/8 >nul
route delete 12.0.0.0/6 >nul
route delete 16.0.0.0/4 >nul
route delete 32.0.0.0/3 >nul
route delete 64.0.0.0/2 >nul
route delete 128.0.0.0/2 >nul
route delete 192.0.0.0/8 >nul
route delete 193.0.0.0/9 >nul
route delete 193.128.0.0/11 >nul
route delete 193.160.0.0/14 >nul
route delete 193.164.0.0/17 >nul
route delete 193.164.128.0/20 >nul
route delete 193.164.144.0/23 >nul
route delete 193.164.147.0/24 >nul
route delete 193.164.148.0/22 >nul
route delete 193.164.152.0/21 >nul
route delete 193.164.160.0/19 >nul
route delete 193.164.192.0/18 >nul
route delete 193.165.0.0/16 >nul
route delete 193.166.0.0/15 >nul
route delete 193.168.0.0/13 >nul
route delete 193.176.0.0/12 >nul
route delete 193.192.0.0/10 >nul
route delete 194.0.0.0/7 >nul
route delete 196.0.0.0/6 >nul
route delete 200.0.0.0/5 >nul
route delete 208.0.0.0/5 >nul
route delete 216.0.0.0/8 >nul
route delete 217.0.0.0/13 >nul
route delete 217.8.0.0/14 >nul
route delete 217.12.0.0/15 >nul
route delete 217.14.0.0/19 >nul
route delete 217.14.32.0/20 >nul
route delete 217.14.64.0/18 >nul
route delete 217.14.128.0/17 >nul
route delete 217.15.0.0/16 >nul
route delete 217.16.0.0/12 >nul
route delete 217.32.0.0/11 >nul
route delete 217.64.0.0/10 >nul
route delete 217.128.0.0/9 >nul
route delete 218.0.0.0/7 >nul
route delete 220.0.0.0/6 >nul

:: xv
route delete 193.164.146.0/25 >nul
route delete 193.164.146.128/27 >nul
route delete 193.164.146.160/28 >nul
route delete 193.164.146.176/29 >nul
route delete 193.164.146.184/30 >nul
route delete 193.164.146.189/32 >nul
route delete 193.164.146.190/31 >nul
route delete 193.164.146.192/26 >nul

:: x2
route delete 217.14.48.0/24 >nul
route delete 217.14.49.0/28 >nul
route delete 217.14.49.16/30 >nul
route delete 217.14.49.21/32 >nul
route delete 217.14.49.22/31 >nul
route delete 217.14.49.24/29 >nul
route delete 217.14.49.32/27 >nul
route delete 217.14.49.64/26 >nul
route delete 217.14.49.128/25 >nul
route delete 217.14.50.0/23 >nul
route delete 217.14.52.0/22 >nul
route delete 217.14.56.0/24 >nul
route delete 217.14.57.0/27 >nul
route delete 217.14.57.32/29 >nul
route delete 217.14.57.40/32 >nul
route delete 217.14.57.42/31 >nul
route delete 217.14.57.44/30 >nul
route delete 217.14.57.48/28 >nul
route delete 217.14.57.64/29 >nul
route delete 217.14.57.72/32 >nul
route delete 217.14.57.74/31 >nul
route delete 217.14.57.76/30 >nul
route delete 217.14.57.80/28 >nul
route delete 217.14.57.96/27 >nul
route delete 217.14.57.128/25 >nul
:: route delete 217.14.58.0/23
route delete 217.14.60.0/22 >nul

:: Section 2: Broadcast
route delete 255.254.0.0/16 >nul
route delete 255.255.0.0/17 >nul
route delete 255.255.128.0/18 >nul
route delete 255.255.192.0/19 >nul
route delete 255.255.224.0/20 >nul
route delete 255.255.240.0/21 >nul
route delete 255.255.248.0/22 >nul
route delete 255.255.252.0/23 >nul
route delete 255.255.254.0/24 >nul
route delete 255.255.255.0/25 >nul
route delete 255.255.255.128/26 >nul
route delete 255.255.255.192/27 >nul
route delete 255.255.255.224/28 >nul
route delete 255.255.255.240/29 >nul
route delete 255.255.255.248/30 >nul
route delete 255.255.255.252/31 >nul
route delete 255.255.255.254/32 >nul
route delete 255.255.255.255/32 >nul

:: Section 3: Home
route delete 192.168.1.0/24 >nul 2>&1
route delete 192.168.1.0/25 >nul 2>&1
route delete 192.168.1.128/25 >nul 2>&1
route delete 192.168.111.0/24 >nul 2>&1
route delete 192.168.111.0/25 >nul 2>&1
route delete 192.168.111.128/25 >nul 2>&1
route delete 192.168.118.0/24 >nul 2>&1
route delete 192.168.118.0/25 >nul 2>&1
route delete 192.168.118.128/25 >nul 2>&1
route delete 172.17.11.0/24 >nul 2>&1
route delete 172.17.11.0/25 >nul 2>&1
route delete 172.17.11.128/25 >nul 2>&1
route delete 172.17.17.0/24 >nul 2>&1
route delete 172.17.17.0/25 >nul 2>&1
route delete 172.17.17.128/25 >nul 2>&1

:: timeout /T 3
ping -n 3 127.0.0.1 >nul 2>&1