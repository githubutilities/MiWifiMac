此驱动适用于小度wifi，兼容MAC OS X 10.6 10.7 10.8 10.9
a.无线网卡功能：安装此驱动后，小度wifi在MAC OS X平台实现USB无限网卡功能。
b.wifi共享功能：使用小度wifi接入互联网，使用mac中自带的AirPort设置为共享的Wifi热点。
1.安装RTUSB_D2870-4.2.9.10_UI-5.0.0.01

2.去\System\Library\Extensions\RT2870USBWirelessDriver.kext\Contents
中修改info.plist
小度wifi使用的是联发科的MT7601芯片，它的pid是1001，vid是2955。换算为10进制pid是4097，vid是10581。将这个参数添加到info.plist中，我已经修改好了，大家使用我提供的info.plist将这个文件替换掉就行。

3.该驱动自带的管理面板总是闪退，因此我们需要使用其他面板辅助一下。
安装DWA-125_A2_for_MAC_v2.3.8.0,在安装的过程中我们选择最高的10.6版本就行。

4.使用Kext_Wizard重建缓存。

5.大功告成，插上小度wifi，如果弹出面板直接连接即可（一般会闪退），我们选择 系统偏好设置-->其他-->DWA-125。使用这个面板就行无线的连接。如果要共享热点，只需要再使用mac中自带的AirPort设置一个共享的Wifi热点即可。

        by：ian
        blog：www.ianisme.com

===============================================================================

我是套用网络上小度wifi的驱动来简单的更改小米随身wifi的PID、VID来进行驱动程序识别。
小米wifi使用的是联发科的MT7601芯片，它的pid是4106，vid是2717。换算为10进制pid是16646，vid是10007。
将这个参数添加到info.plist中，我已经修改好了，大家使用我提供的info.plist将这个文件替换掉就行。
去\System\Library\Extensions\RT2870USBWirelessDriver.kext\Contents 下进行替换原文件。
使用mac中自带的AirPort设置为共享的Wifi热点，我没有测试出来，希望下一步可以实现。
