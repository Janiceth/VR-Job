rem ######################################
rem By Martin ||  ver.20151023
rem ######################################
rem ʹ�÷���:
rem (1)�����豸��PC.
rem (2)ִ�б�������.
rem (3)������ɺ����ͼ��Log


@echo off
title �豸���ػ�ѹ������
color 0a
setlocal enabledelayedexpansion 
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls

for /l %%i in (1,1,10000) do (
echo ��%%i����������.
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
adb pull /sdcard/screenshot.png ��%%i�β��Խ�ͼ_"%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%".png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
ping -n 5 127.0.0.1>nul 2>nul
)