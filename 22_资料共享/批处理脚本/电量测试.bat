@echo off
title 电量测试
color 0a
setlocal enabledelayedexpansion 
mode con cols=120 lines=38
echo 请连接手机...
adb wait-for-device >nul 2>nul
cls
echo 日期       时间      CPU温度  电池温度 NTC温度  PMIC温度 >>电量测试.log
for /l %%i in (1,1,10000) do (
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone1/temp') do set CPU温度=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone4/temp') do set 电池温度=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone7/temp') do set NTC温度=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone5/temp') do set PMIC温度=%%t
echo !date:~0,4!/!date:~5,2!/!date:~8,2! !time:~0,2!:!time:~3,2!:!time:~6,2!: !CPU温度!   !电池温度!    !NTC温度!    !PMIC温度!>>电量测试.log
set CPU温度=
set 电池温度=
set NTC温度=
set PMIC温度=
rem ****************************************
rem 以下是间隔时间,可以自定义设置,默认是10秒
adb shell sleep 10
)