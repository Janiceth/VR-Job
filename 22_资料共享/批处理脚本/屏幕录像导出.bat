@echo off
title 屏幕录像导出
color 0a
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls

adb pull /sdcard/bug_video.mp4 "BugVideo_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.mp4"
adb shell rm -r /sdcard/bug_video.mp4 >nul 2>nul