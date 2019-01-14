@echo off
color 0a
mode con cols=120 lines=38
cls
echo 请连接设备!!!
adb wait-for-device
cls

adb shell am start -n com.android.settings/.Settings