@echo off
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls
echo ���ڵ���Bugreport,���Ե�...
adb bugreport > "Bugreport_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"