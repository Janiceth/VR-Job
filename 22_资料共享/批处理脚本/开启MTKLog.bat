@echo off
title 开启MTK Log
color 0a
mode con cols=120 lines=38
echo 未识别到设备,请连接...
adb wait-for-device >nul 2>nul
cls


echo 获取当前Log运行状态.
adb shell getprop debug.MB.running
adb shell getprop debug.mdlogger.Running
adb shell getprop persist.radio.netlog.Running


echo 切换Log存储到内置SD卡
adb shell setprop persist.mtklog.log2sd.path internal_sd
echo.

echo 设置Log大小限制到300MB
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_log_size_300 --ei cmd_target 1
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_total_log_size_300 --ei cmd_target 1
echo.

echo 执行开启Log命令
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name start --ei cmd_target 1
echo.

echo 设置开机启动Log
adb shell am broadcast -a com.mediatek.mtklogger.ADB_CMD -e cmd_name set_auto_start_1 --ei cmd_target 1
echo.

echo 获取当前Log运行状态.
adb shell getprop debug.MB.running
adb shell getprop debug.mdlogger.Running
adb shell getprop persist.radio.netlog.Running

ping 127.0.0.1 -n 2 >nul 2>nul
