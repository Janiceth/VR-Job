@echo off
title ��������
color 0a
setlocal enabledelayedexpansion 
mode con cols=120 lines=38
echo �������ֻ�...
adb wait-for-device >nul 2>nul
cls
echo ����       ʱ��      CPU�¶�  ����¶� NTC�¶�  PMIC�¶� >>��������.log
for /l %%i in (1,1,10000) do (
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone1/temp') do set CPU�¶�=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone4/temp') do set ����¶�=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone7/temp') do set NTC�¶�=%%t
for /f "delims=" %%t in ('adb shell cat /sys/class/thermal/thermal_zone5/temp') do set PMIC�¶�=%%t
echo !date:~0,4!/!date:~5,2!/!date:~8,2! !time:~0,2!:!time:~3,2!:!time:~6,2!: !CPU�¶�!   !����¶�!    !NTC�¶�!    !PMIC�¶�!>>��������.log
set CPU�¶�=
set ����¶�=
set NTC�¶�=
set PMIC�¶�=
rem ****************************************
rem �����Ǽ��ʱ��,�����Զ�������,Ĭ����10��
adb shell sleep 10
)