@echo off
title ÏÔÊ¾IPµØÖ·
adb wait-for-device
adb tcpip 5555
adb wait-for-device
adb shell dumpsys wifi | findstr DNS
ping -n 10 127.1>nul 2>nul