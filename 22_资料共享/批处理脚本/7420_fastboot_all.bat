@echo off
TITLE 7420 Fastboot ˢ������(5.5��֮���ROM�����ˢ������)
:MENU

echo.
ECHO. =======================isee 7420ˢ������===============================
echo.  
echo               ��ȷ����������װadb����
echo.
ECHO.
ECHO.  �����������...�ȴ�����waiting for device�󣬲���USB�߿���ˢ�뾵��
ECHO.
ECHO. =======================================================================
ECHO.

echo. ��ǰ·���� %~dp0
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