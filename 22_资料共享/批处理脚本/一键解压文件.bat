@echo off
title һ����ѹ�����ļ�
color 0a
mode con cols=120 lines=38
goto start
��ʹ���f����-- By Martin
(1)��bat�ļ��ŵ���ѹ���ļ�ͬһ��Ŀ¼��Ȼ��˫��bat����

:start
rem �滻�ļ����еĿո�Ϊ-
setlocal enabledelayedexpansion

for /f "delims=" %%a in ('dir /a-d/b *.gpk') do (
    set "var=%%~na"
    set newn=!var: =-!
    ren "%%a" "!newn!%%~xa"
)

for %%i in (*.gpk) do (
echo ���ڽ�ѹ: %%~nxi
mkdir %%~ni
rem ��ѹ���ļ��н�ѹ��*.apk�ļ�
"C:\Program Files\2345Soft\HaoZip\HaoZipC.exe" e %%i -o%%~ni *.apk
)
pause