@echo off
title BatteryStats分析
color 0a
mode con cols=120 lines=38
cls
echo 未识别到设备,请连接...
adb wait-for-device
cls
del /q batterystats.html >nul 2>nul
del /q batterystats.txt >nul 2>nul
del /q bugreport.txt >nul 2>nul
adb shell dumpsys batterystats >batterystats.txt
adb bugreport >bugreport.txt
historian.py batterystats.txt >batterystats.html
historian.py -a bugreport.txt >battery.html
echo 电量消耗分析报告已生成: batterystats.html和battery.html
adb shell sleep 2