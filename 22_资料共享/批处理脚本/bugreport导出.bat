@echo off
color 0a
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls
echo 正在导出Bugreport,请稍等...
adb bugreport > "Bugreport_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"