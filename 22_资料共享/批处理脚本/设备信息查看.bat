@echo off
title �鿴�豸��Ϣ
color 0a
mode con cols=120 lines=38
cls
echo δʶ���豸,������...
adb wait-for-device
cls

set /p="�ͺ� -------------- "<nul & adb shell getprop ro.product.model
set /p="���� -------------- "<nul & adb shell getprop ro.product.name
set /p="IP��ַ ------------ "<nul & adb shell getprop dhcp.wlan0.ipaddress
set /p="ʱ�� -------------- "<nul & adb shell getprop persist.sys.timezone
set /p="���� -------------- "<nul & adb shell getprop ro.product.locale.language
set /p="Android�汾 ------- "<nul & adb shell getprop ro.build.version.release
set /p="API Level --------- "<nul & adb shell getprop ro.build.version.sdk
set /p="CPU --------------- "<nul & adb shell getprop ro.product.cpu.abi
set /p="CPU�¶� ----------- "<nul & adb shell cat /sys/class/thermal/thermal_zone1/temp
set /p="Region ------------ "<nul & adb shell getprop ro.product.locale.region
set /p="Serial number ----- "<nul & adb shell getprop ro.serialno
set /p="Build number ------ "<nul & adb shell getprop ro.build.display.id
set /p="Build���� --------- "<nul & adb shell getprop ro.build.date
set /p="Baseband version -- "<nul & adb shell getprop gsm.version.baseband
set /p="����Mac��ַ ------- "<nul & adb shell settings get secure bluetooth_address
set /p="WiFi Mac��ַ ------ "<nul & adb shell cat /sys/class/net/wlan0/address
set /p="��ص��� ---------- "<nul & adb shell cat /sys/class/power_supply/battery/capacity
rem set /p="����¶� ---------- "<nul & adb shell cat /sys/class/power_supply/battery/batt_temp
rem set /p="��ص�ѹ ---------- "<nul & adb shell cat /sys/class/power_supply/battery/batt_vol
set /p="����¶� ---------- "<nul & adb shell cat /sys/class/power_supply/battery/temp
set /p="��ص�ѹ ---------- "<nul & adb shell cat /sys/class/power_supply/battery/voltage_now
set /p="���ں�ʱ�� -------- "<nul & adb shell date
set /p="Uptime ------------ "<nul & adb shell uptime
set /p="Activity name  -- "<nul & adb shell dumpsys activity top | findstr ACTIVITY

choice /t 10 /d y /n >nul