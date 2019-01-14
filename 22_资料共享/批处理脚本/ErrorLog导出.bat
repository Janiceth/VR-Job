@echo off
title ErrorLog导出
color 0a
mode con cols=120 lines=38
echo 未识别到设备,请连接...
adb wait-for-device >nul 2>nul
cls

adb pull /storage/sdcard0/Android/data/com.idealsee.vr.launcher/files/Log/outLog.txt "C:\Users\Administrator\Desktop\ErrorLog_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"