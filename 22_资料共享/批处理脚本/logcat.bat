@echo off
title ����Logcat,�رմ���ֹͣ��ȡ..
color 0a
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls
adb logcat -v time>"Logcat_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"