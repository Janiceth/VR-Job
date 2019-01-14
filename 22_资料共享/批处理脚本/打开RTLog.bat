@echo off
title ´ò¿ªRTLog
adb wait-for-device
adb shell setprop persist.sys.logcontrol 3
adb reboot