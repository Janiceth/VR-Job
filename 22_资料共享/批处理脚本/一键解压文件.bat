@echo off
title 一键解压所有文件
color 0a
mode con cols=120 lines=38
goto start
【使用說明】-- By Martin
(1)把bat文件放到与压缩文件同一个目录中然后双击bat即可

:start
rem 替换文件名中的空格为-
setlocal enabledelayedexpansion

for /f "delims=" %%a in ('dir /a-d/b *.gpk') do (
    set "var=%%~na"
    set newn=!var: =-!
    ren "%%a" "!newn!%%~xa"
)

for %%i in (*.gpk) do (
echo 正在解压: %%~nxi
mkdir %%~ni
rem 从压缩文件中解压出*.apk文件
"C:\Program Files\2345Soft\HaoZip\HaoZipC.exe" e %%i -o%%~ni *.apk
)
pause