@echo off
title ʵʱCPUƵ��
adb root
adb remount
for /l %%i in (1,1,100000) do (
set /p="TMU�¶�: "<nul & adb shell cat /sys/devices/10060000.tmu/curr_temp
set /p="GPUƵ��: "<nul & adb shell cat /sys/devices/14ac0000.mali/clock
set /p="CPUʹ������: "<nul & adb shell cat /sys/devices/system/cpu/online
adb shell cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
echo.
ping 127.1 >nul 2>nul
)