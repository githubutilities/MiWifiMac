#!/bin/sh
. /etc/rc.common

vendor="Ralink"
folder="Ralink Wireless Utility"
ui="WirelessUtility"

LeopardMajorVersion="9."
SnowLeopardMajorVersion="10"
LionMajorVersion="11"
MountainLionMajorVersion="12"
MavericksMajorVersion="13"

ThisVersion=`uname -r`
echo ThisVersion=$ThisVersion

ThisMajorVersion=${ThisVersion:0:2}
echo ThisMajorVersion=$ThisMajorVersion

case $ThisMajorVersion in
	$LeopardMajorVersion)		OsName="Leopard";;
	$SnowLeopardMajorVersion)	OsName="SnowLeopard";;
	$LionMajorVersion)		OsName="Lion";;
	$MountainLionMajorVersion)	OsName="MountainLion";;
	$MavericksMajorVersion)		OsName="Mavericks";;
esac

echo "Removing Startup Items..."
sudo killall 'CommandServer'
sudo /Applications/"$folder"/LoginItem -stringArg /Applications/"$folder"/$ui.app -boolArg NO

sudo rm -r /System/Library/StartupItems/WiFiUtilityStartUp

echo "Removing Driver..."
sudo kextunload -c /System/Library/Extensions/RT2870USBWirelessDriver.kext
sudo rm -r /System/Library/Extensions/RT2870USBWirelessDriver.kext
sudo kextcache -system-prelinked-kernel
sudo kextcache -system-caches


echo "Removing Wireless Utitity..."
sudo killall "$ui"
sudo rm -r /Applications/"$folder"
sudo rm ~/Library/Preferences/com.$vendor.RaConfig.plist

echo "Removing Frameworks..."
sudo rm -r /Library/Frameworks/RaWLAPI.Framework

echo "Removing Package"
sudo rm -f -r /Library/Receipts/USBWireless-Tiger.pkg
sudo pkgutil --forget com.Ralink.RT2870.pkg
sudo pkgutil --forget com.Ralink.Uninstall.pkg
echo "Uninstall Complete."
