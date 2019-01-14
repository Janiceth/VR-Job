@echo off
title 批量安装当前目录下的所有apk
color 0a
mode con cols=120 lines=38
goto start
【使用說明】-- By Martin
(1)把bat文件放到与apk文件同一个目录中然后双击bat即可
(2)支持安装非英文文件名的apk
(3)支持安装文件名带空格的apk

:start
rem 替换文件名中的空格为-
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a-d/b *.apk') do (
    set "var=%%~na"
    set newn=!var: =-!
    ren "%%a" "!newn!%%~xa"
)
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls

for %%i in (*.apk) do (
del /q tmp.apk >nul 2>nul
if %%~nxi NEQ tmp.apk copy %%~nxi tmp.apk >nul 2>nul
echo #INSTALL: %%~nxi
adb install -r tmp.apk
echo.
del /q tmp.apk >nul 2>nul)
pause