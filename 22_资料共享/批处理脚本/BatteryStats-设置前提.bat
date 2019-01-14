@echo off
title BatteryStats分析
color 0a
mode con cols=120 lines=38
cls
echo 未识别到设备,请连接...
del /q batterystats.html >nul 2>nul
del /q batterystats.txt >nul 2>nul
adb wait-for-device
cls
adb kill-server
adb devices
adb wait-for-device
adb shell dumpsys batterystats --enable full-wake-history
adb shell dumpsys batterystats --reset
echo 请断开USB连接然后操作设备!
adb shell sleep 2