rem ######################################
rem By Martin ||  ver.20151023
rem ######################################
rem ʹ�÷���:
rem (1)�����豸��PC.
rem (2)ִ�б�������.
rem (3)������ɺ����ͼ��Log


@echo off
title �����乾ӰԺ�б����
color 0a
setlocal enabledelayedexpansion 
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls

for /l %%i in (1,1,10000) do (
echo ��%%i�λ�������.
adb wait-for-device >nul 2>nul
ping -n 1 127.0.0.1>nul 2>nul
adb wait-for-device >nul 2>nul
adb shell input touchpad swipe 300 1200 300 100 100
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png ��%%i�β��Խ�ͼ_"%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%".png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
ping -n 1 127.0.0.1>nul 2>nul
)