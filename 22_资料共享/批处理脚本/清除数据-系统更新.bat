@echo off
title ���ϵͳ����app������
color 0a
mode con cols=120 lines=38
cls
echo δʶ���豸,������...
adb wait-for-device
cls
adb shell pm clear com.mediatek.systemupdate