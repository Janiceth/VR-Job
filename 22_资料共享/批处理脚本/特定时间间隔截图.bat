@echo off
title �ض�ʱ������ͼ
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls


for /l %%i in (1,1,1000000) do (
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png screenshot_%%i_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul

rem �޸�/t���������,��ʾ����������ͼ1��
choice /t 5 /d y /n >nul
)