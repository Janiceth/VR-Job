@echo off
title CPU温度监控
color 0a
mode con cols=120 lines=38
cls
echo 请连接手机!!!
adb wait-for-device >nul 2>nul
cls

for /l %%i in (1,1,10000) do (
adb shell cat /sys/class/thermal/thermal_zone1/temp
adb shell sleep 1
)