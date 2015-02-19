# Mi Wifi for Mac

As we known, Mi Wifi currently does not support Mac OS X. Since it uses `MT7601` chip of `mediatek`, we can use `MT7601` driver for Mac.

This repo provides a way to solve this problem. 

## Features

* Wifi sharing through Mi Wifi
* Use Mi Wifi as Wireless component

## Usage

1. Install `RTUSB_D2870-4.2.9.10_UI-5.0.0.01` which needs restart
2. Replace `\System\Library\Extensions\RT2870USBWirelessDriver.kext\Contents\Info.plist` with `Info.plist` of this repo and restart again
> > The local repo's `Info.plist` changes the `pid` to 16646 and `vid` to 10007 which is the Mi Wifi's `pid` and `vid`.

3. In case control panel of `RTUSB_D2870-4.2.9.10_UI-5.0.0.01` does not work, install `DWA-125_A2_for_MAC_v2.3.8.0`
4. Use `Kext_Wizard` to rebuild the system cache and restart the computer
5. Done!

## Reference

* [jb51](http://www.jb51.net/softs/180598.html)
* [mediatek](http://www.mediatek.com/en/downloads/)
* [mediatek-rt2870](http://www.mediatek.com/en/downloads/usb-rt2870rt2770rt3x7xrt537xrt5572/)