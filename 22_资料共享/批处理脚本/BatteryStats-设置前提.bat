@echo off
title BatteryStats����
color 0a
mode con cols=120 lines=38
cls
echo δʶ���豸,������...
del /q batterystats.html >nul 2>nul
del /q batterystats.txt >nul 2>nul
adb wait-for-device
cls
adb kill-server
adb devices
adb wait-for-device
adb shell dumpsys batterystats --enable full-wake-history
adb shell dumpsys batterystats --reset
echo ��Ͽ�USB����Ȼ������豸!
adb shell sleep 2