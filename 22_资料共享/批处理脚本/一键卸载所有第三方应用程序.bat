@echo off
title һ��ж�����е�����Ӧ�ó���
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls
goto start
��ʹ���f����-- By Martin
(1)˫����������

:start
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('adb shell pm list packages -3') do (
    set "var=%%a"
    set newn=!var:package:=!
    echo #UNINSTALL: !newn!
    del /q uninstall_tmp.bat >nul 2>nul
    echo adb shell pm uninstall !newn! >uninstall_tmp.bat
    call uninstall_tmp.bat
    echo.
)
del /q uninstall_tmp.bat >nul 2>nul
pause