@echo off
title ������װ��ǰĿ¼�µ�����apk
color 0a
mode con cols=120 lines=38
goto start
��ʹ���f����-- By Martin
(1)��bat�ļ��ŵ���apk�ļ�ͬһ��Ŀ¼��Ȼ��˫��bat����
(2)֧�ְ�װ��Ӣ���ļ�����apk
(3)֧�ְ�װ�ļ������ո��apk

:start
rem �滻�ļ����еĿո�Ϊ-
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a-d/b *.apk') do (
    set "var=%%~na"
    set newn=!var: =-!
    ren "%%a" "!newn!%%~xa"
)
echo �������ֻ�...
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