@echo off
title 进程监控
color 0a
mode con cols=120 lines=38
cls
echo 请连接手机!!!
adb wait-for-device >nul 2>nul
cls
echo PID    PR CPU% S  #THR      VSS     RSS PCY UID      Name

for /l %%i in (1,1,10000) do (
adb shell top | findstr "com.idealsee.vr.launcher"
)