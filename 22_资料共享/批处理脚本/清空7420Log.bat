@echo off
title Çå¿Õ7420 Log
adb wait-for-device
adb shell rm -rf /sdcard/RTLog/*
adb reboot