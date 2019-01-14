@echo off
TITLE V5000读AP状态工具【正在打印log，请问关闭窗口】
:restart
echo  ===================================================
echo  ===================AP Temperature==================
echo  ===================================================



:get_data

rem   打印系统日期及时间，同时将时间转换为8位(8:16:00-->08:16:00).
set   CurDate=%date:~0,10%
set   CurTime=%time%
set   hh=%CurTime:~0,2%
if   /i   %hh%   LSS   10   ( set   hh=0%CurTime:~1,1% )
set   mm=%CurTime:~3,2%
set   ss=%CurTime:~6,2%
set   CurDateTime=%CurDate%_%hh%:%mm%:%ss%
set   CurDateTime >>log.txt

echo  ===================ntc_temp========================
adb shell cat /sys/class/thermal/thermal_zone1/temp
echo  ===================cpu_temp========================
adb shell cat /sys/class/thermal/thermal_zone2/temp
rem 读取CPU频率
echo  ===================cpu_freq========================
adb shell cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
rem 读取GPU频率
echo  ===================gpu_freq========================
adb shell cat /sys/devices/14ac0000.mali/clock

rem 读取NTC温度
echo  /===================NTC_temp========================>>log.txt
adb shell cat /sys/class/thermal/thermal_zone1/temp>>log.txt
rem 读取AP温度
echo  /===================cpu_temp========================>>log.txt
adb shell cat /sys/class/thermal/thermal_zone2/temp>>log.txt
rem 读取CPU频率>>log.txt
echo  /===================cpu_freq========================>>log.txt
adb shell cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq>>log.txt
rem 读取GPU频率>>log.txt
echo  /===================gpu_freq========================>>log.txt
adb shell cat /sys/devices/14ac0000.mali/clock>>log.txt



rem 延时：10秒
choice /t 10 /d y /n >nul



goto get_data
pause
goto restart