@echo off
title BatteryStats����
color 0a
mode con cols=120 lines=38
cls
echo δʶ���豸,������...
adb wait-for-device
cls
del /q batterystats.html >nul 2>nul
del /q batterystats.txt >nul 2>nul
del /q bugreport.txt >nul 2>nul
adb shell dumpsys batterystats >batterystats.txt
adb bugreport >bugreport.txt
historian.py batterystats.txt >batterystats.html
historian.py -a bugreport.txt >battery.html
echo �������ķ�������������: batterystats.html��battery.html
adb shell sleep 2