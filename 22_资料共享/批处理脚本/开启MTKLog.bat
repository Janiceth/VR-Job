@echo off
title ����MTK Log
color 0a
mode con cols=120 lines=38
echo δʶ���豸,������...
adb wait-for-device >nul 2>nul
cls


echo ��ȡ��ǰLog����״̬.
adb shell getprop debug.MB.running
adb shell getprop debug.mdlogger.Running
adb shell getprop persist.radio.netlog.Running


echo �л�Log�洢������SD��
adb shell setprop persist.mtklog.log2sd.path internal_sd
echo.

echo ����Log��С���Ƶ�300MB
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_log_size_300 --ei cmd_target 1
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_total_log_size_300 --ei cmd_target 1
echo.

echo ִ�п���Log����
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name start --ei cmd_target 1
echo.

echo ���ÿ�������Log
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_auto_start_1 --ei cmd_target 1
echo.

echo ��ȡ��ǰLog����״̬.
adb shell getprop debug.MB.running
adb shell getprop debug.mdlogger.Running
adb shell getprop persist.radio.netlog.Running

ping 127.0.0.1 -n 2 >nul 2>nul
