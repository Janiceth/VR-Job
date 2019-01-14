@echo off
title 清除系统更新app的数据
color 0a
mode con cols=120 lines=38
cls
echo 未识别到设备,请连接...
adb wait-for-device
cls
adb shell pm clear com.mediatek.systemupdate