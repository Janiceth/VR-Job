@echo off
title ��RTLog
adb wait-for-device
adb shell setprop persist.sys.logcontrol 3
adb reboot