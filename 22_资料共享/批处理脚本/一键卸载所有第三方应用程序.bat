@echo off
title 一键卸载所有第三方应用程序
color 0a
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls
goto start
【使用說明】-- By Martin
(1)双击批处理即可

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