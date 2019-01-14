@echo off
title 查看设备信息
color 0a
mode con cols=120 lines=38
cls
echo 未识别到设备,请连接...
adb wait-for-device
cls

set /p="型号 -------------- "<nul & adb shell getprop ro.product.model
set /p="名称 -------------- "<nul & adb shell getprop ro.product.name
set /p="IP地址 ------------ "<nul & adb shell getprop dhcp.wlan0.ipaddress
set /p="时区 -------------- "<nul & adb shell getprop persist.sys.timezone
set /p="语言 -------------- "<nul & adb shell getprop ro.product.locale.language
set /p="Android版本 ------- "<nul & adb shell getprop ro.build.version.release
set /p="API Level --------- "<nul & adb shell getprop ro.build.version.sdk
set /p="CPU --------------- "<nul & adb shell getprop ro.product.cpu.abi
set /p="CPU温度 ----------- "<nul & adb shell cat /sys/class/thermal/thermal_zone1/temp
set /p="Region ------------ "<nul & adb shell getprop ro.product.locale.region
set /p="Serial number ----- "<nul & adb shell getprop ro.serialno
set /p="Build number ------ "<nul & adb shell getprop ro.build.display.id
set /p="Build日期 --------- "<nul & adb shell getprop ro.build.date
set /p="Baseband version -- "<nul & adb shell getprop gsm.version.baseband
set /p="蓝牙Mac地址 ------- "<nul & adb shell settings get secure bluetooth_address
set /p="WiFi Mac地址 ------ "<nul & adb shell cat /sys/class/net/wlan0/address
set /p="电池电量 ---------- "<nul & adb shell cat /sys/class/power_supply/battery/capacity
rem set /p="电池温度 ---------- "<nul & adb shell cat /sys/class/power_supply/battery/batt_temp
rem set /p="电池电压 ---------- "<nul & adb shell cat /sys/class/power_supply/battery/batt_vol
set /p="电池温度 ---------- "<nul & adb shell cat /sys/class/power_supply/battery/temp
set /p="电池电压 ---------- "<nul & adb shell cat /sys/class/power_supply/battery/voltage_now
set /p="日期和时间 -------- "<nul & adb shell date
set /p="Uptime ------------ "<nul & adb shell uptime
set /p="Activity name  -- "<nul & adb shell dumpsys activity top | findstr ACTIVITY

choice /t 10 /d y /n >nul