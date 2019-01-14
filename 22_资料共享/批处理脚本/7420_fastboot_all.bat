@echo off
TITLE 7420 Fastboot 刷机工具(5.5号之后的ROM有这个刷机工具)
:MENU

echo.
ECHO. =======================isee 7420刷机工具===============================
echo.  
echo               请确认已正常安装adb驱动
echo.
ECHO.
ECHO.  按任意键继续...等待出现waiting for device后，插入USB线开机刷入镜像
ECHO.
ECHO. =======================================================================
ECHO.

echo. 当前路径： %~dp0
fastboot.exe flash partition_table partition
fastboot.exe flash bootloader signed_bootloader
fastboot.exe flash dtb  exynos7420-avl7420-codegen.dtb
fastboot.exe flash kernel  Image
fastboot.exe flash ramdisk  ramdisk-uboot.img
fastboot.exe flash system  system.img
fastboot.exe flash recovery  ramdisk-recovery-uboot.img
fastboot.exe flash userdata  userdata.img
fastboot.exe flash cache  cache.img
fastboot.exe flash engmode ramdisk-engmode-uboot.img
ping -n 10 127.1 >nul 2>nul
fastboot reboot
echo. flash end