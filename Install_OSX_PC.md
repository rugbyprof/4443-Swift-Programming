## How To Install OSX Yosemite On Your PC
_Posted on October 19, 2014 by Waj Syed_

_Source: http://www.instafuze.com/?p=587_

This guide will give a complete step by step on how to install OS 10.10 Yosemite on any PC that has a Intel base processor.

_What You Need:_
1. Built PC With Intel CPU
2. Any Computer Running Mac OSX Snow Leopard 10.6.6 or later.
3. USB Stick 8Gb or Larger


_What you need to Download:_ Click for the link

[Yosemite](https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=915041082&mt=12)

[UniBeast](http://www.tonymacx86.com/downloads.php?do=file&id=244)

[Multibeast](http://www.tonymacx86.com/downloads.php?do=file&id=242)

[DSDT](http://www.tonymacx86.com/11-dsdt-database.html) (if needed)

Inorder to download Unibeast, Multibeast  and DSDT files you need to have an account on tonymacx86.  If you don’t have an account then you can create an here.http://www.tonymacx86.com/register.php.

Make your you have Unibeast and Multibeast downloaded and unziped on to your desktop.

___STEP 1:___ Download OSX 10.10 Yosemite
The cool thing is that the whole OS is free for anyone who has a Apple ID and acess to a machine running 10.6.8 Snow Leopard or later.
1. Open Mac App Store
2. Log into your Apple ID
3. Download OS X Yosemite (its a big file >5GB so relax)
_STEP 2:_ Making a Bootable USB Drive
1. Insert your USB drive the is 8GB or Larger
2. Open /Applications/Utilities/_Disk Utility_
3. Select your USB drive
4. Go to the Partition Tab
5. Click Current and choose _1 Partition_
6. Click _Options_ and Choose _Master Boot Record_
7. Under _Name:_ type USB
8. Under _Format:_ choose _Mac OS Extended (Journaled)_
9. Click _Apply_ then _Partition_
10. Open UniBeast from your desktop
11. Click _Continue, Continue, Continue, Agree_
![](http://www.tonymacx86.com/attachments/106475d1412962728-ub-1.png.html)
12. At Destination Select, choose _USB_ and click _Continue_
![](http://www.tonymacx86.com/attachments/106472d1412962641-ub-2.png.html)
13. Choose _Yosemite_ on the _Select OS Installation_ screen
14. Click _Continue_
![](http://www.tonymacx86.com/attachments/106478d1412962972-ub-3.png.html)
15. If using a 5 or 6 Series system with AWARD BIOS choose _Legacy USB Support_
16. If using a laptop, choose _Laptop Support_
17. Click _Continue_
![](http://www.tonymacx86.com/attachments/106476d1412962807-ub-4.png.html)
18. Enter your password and click _Install_
![](http://www.tonymacx86.com/attachments/106477d1412962924-ub-6.png.html)
UniBeast will now create the bootable USB drive. Once completed put your the Multibeast folder in the USB drive.
_STEP 4:__Boot into USB Drive
1. Turn on the computer
2. Press the hotkey to choose boot device (usually F12 or F8)
3. Choose _USB-HDD_
4. At the Chimera Boot Screen, choose _USB_ and hit _Enter_
If you can’t get to the OSX installer, try typing in _-x_ at the Chimera Boot  screen. You can also type some other boot flags such as: _GraphicsEnabler=Yes, PCIRootUID=1, maxmem=4096, maxmem=8192_, and _npci=0x2000_ individually or in combination in order to solve boot issues.
_STEP 5:_ Install OSX Yosemite
Once you get to the installer:
1. In the top menu bar choose _Utilities_, and open _Disk Utility_
2. Highlight your target hard drive for the Yosemite installation in left column.
3. Click _Partition_ tab
4. Click _Current_ and choose _1 Partition_
5. Click _Options…_
6. Choose _GUID Partition Method_
7. Under _Name:_ type _Yosemite_ (You can rename it later)
8. Under _Format_ select _Mac OS Extended (Journaled)_
9. Click _Apply_ then _Partition_
10. Close out of the _Disk Utility_
11. When the installer asks you where to install, choose OSX, or your existing install if your just upgrading.
12. When complete system will reset automatically.
13. Press _F8_ or _F12_ to enter into boot menu & select your _USB_ drive again.
14. At the Chimera Boot Screen, choose your new _OSX_ installation.
15. Complete the OSX initial setup, date, user, password, etc.
_STEP 6:_ Finalization With MultiBeast 
1. Open Multibeast
2. if this is a new install go to the _Quick Start_ tab & choose _EasyBeast, UserDSDT_, or _DSDT-Free_.
3. Choose your audio drivers, enable trim if you are using an SSD, select your networking driver, etc. here are my settings based upon my motherboard (Gigabyte GA-Z77-D3H) Capture2
![](http://www.instafuze.com/wp-content/uploads/2014/10/Capture2.png)
4. Restart your PC and your done.
Congrats! you just installed  OS X Yosemite on your PC.
