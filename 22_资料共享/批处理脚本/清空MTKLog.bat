@echo off
title ����MTK Log
color 0a
mode con cols=120 lines=38
echo δʶ���豸,������...
adb wait-for-device >nul 2>nul
cls

adb shell rm -r /sdcard/mtklog
adb shell rm -r /storage/sdcard0/mtklog
adb shell rm -r /storage/sdcard1/mtklog
adb reboot