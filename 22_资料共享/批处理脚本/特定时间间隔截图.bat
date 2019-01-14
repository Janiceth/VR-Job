@echo off
title 特定时间间隔截图
color 0a
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls


for /l %%i in (1,1,1000000) do (
adb shell rm -r /sdcard/screenshot.png >nul 2>nul
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png screenshot_%%i_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul

rem 修改/t后面的数字,表示间隔多少秒截图1次
choice /t 5 /d y /n >nul
)