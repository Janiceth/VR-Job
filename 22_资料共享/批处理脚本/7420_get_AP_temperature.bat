@echo off
TITLE V5000��AP״̬���ߡ����ڴ�ӡlog�����ʹرմ��ڡ�
:restart
echo  ===================================================
echo  ===================AP Temperature==================
echo  ===================================================



:get_data

rem   ��ӡϵͳ���ڼ�ʱ�䣬ͬʱ��ʱ��ת��Ϊ8λ(8:16:00-->08:16:00).
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
rem ��ȡCPUƵ��
echo  ===================cpu_freq========================
adb shell cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
rem ��ȡGPUƵ��
echo  ===================gpu_freq========================
adb shell cat /sys/devices/14ac0000.mali/clock

rem ��ȡNTC�¶�
echo  /===================NTC_temp========================>>log.txt
adb shell cat /sys/class/thermal/thermal_zone1/temp>>log.txt
rem ��ȡAP�¶�
echo  /===================cpu_temp========================>>log.txt
adb shell cat /sys/class/thermal/thermal_zone2/temp>>log.txt
rem ��ȡCPUƵ��>>log.txt
echo  /===================cpu_freq========================>>log.txt
adb shell cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq>>log.txt
rem ��ȡGPUƵ��>>log.txt
echo  /===================gpu_freq========================>>log.txt
adb shell cat /sys/devices/14ac0000.mali/clock>>log.txt



rem ��ʱ��10��
choice /t 10 /d y /n >nul



goto get_data
pause
goto restart