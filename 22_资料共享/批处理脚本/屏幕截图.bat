@echo off
title �ֻ�����
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
rem adb wait-for-device >nul 2>nul
cls

rem ######��ȡ����·��######
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
set desk_dir=%%j
)

adb shell rm -r /sdcard/screenshot.png >nul 2>nul
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png %desk_dir%\screenshot_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png
adb shell rm -r /sdcard/screenshot.png >nul 2>nul