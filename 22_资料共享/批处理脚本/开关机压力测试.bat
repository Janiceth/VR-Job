rem ######################################
rem By Martin ||  ver.20151023
rem ######################################
rem 使用方法:
rem (1)连接设备到PC.
rem (2)执行本批处理.
rem (3)测试完成后检查截图和Log


@echo off
title 设备开关机压力测试
color 0a
setlocal enabledelayedexpansion 
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls

for /l %%i in (1,1,10000) do (
echo 第%%i次重启测试.
adb wait-for-device >nul 2>nul
ping -n 5 127.0.0.1>nul 2>nul
adb wait-for-device >nul 2>nul
adb reboot
adb wait-for-device >nul 2>nul
ping -n 5 127.0.0.1>nul 2>nul
adb wait-for-device >nul 2>nul
ping -n 45 127.0.0.1>nul 2>nul
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png 第%%i次测试截图_"%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%".png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
ping -n 5 127.0.0.1>nul 2>nul
)