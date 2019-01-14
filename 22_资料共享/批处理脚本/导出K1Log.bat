@echo off
title 导出K1 Log
color 0a
mode con cols=120 lines=38
echo 未识别到设备,请连接...
adb wait-for-device >nul 2>nul
cls

RD /S /Q anr >nul 2>nul
DEL /Q device_info.txt,vr.launcher_outlog,logcat.txt,bugreport.txt,appmanager_outlog.txt >nul 2>nul

adb logcat -d -v time >logcat.txt"
adb pull /storage/sdcard0/Android/data/com.idealsee.vr.launcher/files/Log/outLog.txt vr.launcher_outlog.txt
adb pull /storage/sdcard0/Android/data/com.idealsee.appmanager/files/Log/outLog.txt appmanager_outlog.txt
adb pull /data/anr anr
adb pull /data/tombstones tombstones

echo -----------------------------------设备信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell getprop ro.product.model') do echo 设备名称 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell getprop ro.build.display.id') do echo 系统版本 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell getprop ro.build.date') do echo Build日期 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell date') do echo 系统时间 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell getprop ro.product.locale.language') do echo 系统语言 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell getprop ro.build.version.release') do echo Android版本 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell getprop dhcp.wlan0.ipaddress') do echo IP地址 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell cat /sys/class/thermal/thermal_zone1/temp') do echo CPU温度 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell settings get secure bluetooth_address') do echo 蓝牙Mac -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell cat /sys/class/net/wlan0/address') do echo WiFi Mac -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell settings get system screen_brightness') do echo 屏幕亮度值 -- %%i>>device_info.txt
for /f "delims=" %%i in ('adb shell uptime') do echo uptime -- %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------内存信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell cat /proc/meminfo^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------WiFi信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell dumpsys wifi ^| findstr mWifiInfo:^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------蓝牙信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell dumpsys bluetooth_manager^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------电池信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell dumpsys batteryproperties^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------传感器信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell dumpsys sensorservice^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
echo -----------------------------------显示信息------------------------------------->>device_info.txt
for /f "delims=" %%i in ('adb shell dumpsys display ^| findstr DisplayInfo^|findstr .') do echo %%i>>device_info.txt
echo.>>device_info.txt
echo.>>device_info.txt
rem echo -----------------------------------播放器信息------------------------------------->>device_info.txt
rem for /f "delims=" %%i in ('adb shell dumpsys media.player^|findstr .') do echo %%i>>device_info.txt

echo pull bugreport......
rem adb bugreport >bugreport.txt

"C:\Program Files\2345Soft\HaoZip\HaoZipC.exe" a -tzip "C:\Users\Administrator\Desktop\log_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.zip" anr\* device_info.txt vr.launcher_outlog.txt logcat.txt appmanager_outlog.txt bugreport.txt tombstones\*

RD /S /Q anr >nul 2>nul
DEL /Q device_info.txt,appmanager_outlog.txt,vr.launcher_outlog.txt,logcat.txt,bugreport.txt,tombstones >nul 2>nul