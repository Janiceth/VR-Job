@echo off
title ��Ļ¼��
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls

adb shell rm -r /sdcard/bug_video.mp4 >nul 2>nul
adb shell screenrecord /sdcard/bug_video.mp4
rem adb pull /sdcard/bug_video.mp4
rem adb shell rm -r /sdcard/bug_video.mp4 >nul 2>nul