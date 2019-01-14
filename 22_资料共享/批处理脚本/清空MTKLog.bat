@echo off
title 导出MTK Log
color 0a
mode con cols=120 lines=38
echo 未识别到设备,请连接...
adb wait-for-device >nul 2>nul
cls

adb shell rm -r /sdcard/mtklog
adb shell rm -r /storage/sdcard0/mtklog
adb shell rm -r /storage/sdcard1/mtklog
adb reboot