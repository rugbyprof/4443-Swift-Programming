## How To Install OSX Yosemite On Your PC
_Posted on October 19, 2014 by Waj Syed_

_Source: http://www.instafuze.com/?p=587_

This guide will give a complete step by step on how to install OS 10.10 Yosemite on any PC that has a Intel base processor.

_What You Need:_
1. Built PC With Intel CPU
2. Any Computer Running Mac OSX Snow Leopard 10.6.6 or later.
3. USB Stick 8Gb or Larger


__What you need to Download:__ Click for the link

[Yosemite](https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=915041082&mt=12)

[UniBeast](http://www.tonymacx86.com/downloads.php?do=file&id=244)

[Multibeast](http://www.tonymacx86.com/downloads.php?do=file&id=242)

[DSDT](http://www.tonymacx86.com/11-dsdt-database.html) (if needed)

Inorder to download Unibeast, Multibeast  and DSDT files you need to have an account on tonymacx86.  If you don’t have an account then you can create an here.http://www.tonymacx86.com/register.php.

Make your you have Unibeast and Multibeast downloaded and unziped on to your desktop.

__STEP 1: Download OSX 10.10 Yosemite__
The cool thing is that the whole OS is free for anyone who has a Apple ID and acess to a machine running 10.6.8 Snow Leopard or later.

1. Open Mac App Store
2. Log into your Apple ID
3. Download OS X Yosemite (its a big file >5GB so relax)

__STEP 2: Making a Bootable USB Drive__

1. Insert your USB drive the is 8GB or Larger
2. Open /Applications/Utilities/__Disk Utility__
3. Select your USB drive
4. Go to the Partition Tab
5. Click Current and choose __1 Partition__
6. Click __Options__ and Choose __Master Boot Record__
7. Under __Name:__ type USB
8. Under __Format:__ choose __Mac OS Extended (Journaled)__
9. Click __Apply__ then __Partition__
10. Open UniBeast from your desktop
11. Click __Continue, Continue, Continue, Agree__
![](http://www.tonymacx86.com/attachments/106475d1412962728-ub-1.png.html)
12. At Destination Select, choose __USB__ and click __Continue__
![](http://www.tonymacx86.com/attachments/106472d1412962641-ub-2.png.html)
13. Choose __Yosemite__ on the __Select OS Installation__ screen
14. Click __Continue__
![](http://www.tonymacx86.com/attachments/106478d1412962972-ub-3.png.html)
15. If using a 5 or 6 Series system with AWARD BIOS choose __Legacy USB Support__
16. If using a laptop, choose __Laptop Support__
17. Click __Continue__
![](http://www.tonymacx86.com/attachments/106476d1412962807-ub-4.png.html)
18. Enter your password and click __Install__

![](http://www.tonymacx86.com/attachments/106477d1412962924-ub-6.png.html)
UniBeast will now create the bootable USB drive. Once completed put your the Multibeast folder in the USB drive.


__STEP 4: Boot into USB Drive__

1. Turn on the computer
2. Press the hotkey to choose boot device (usually F12 or F8)
3. Choose __USB-HDD__
4. At the Chimera Boot Screen, choose __USB__ and hit __Enter__

If you can’t get to the OSX installer, try typing in __-x__ at the Chimera Boot  screen. You can also type some other boot flags such as: __GraphicsEnabler=Yes, PCIRootUID=1, maxmem=4096, maxmem=8192__, and __npci=0x2000__ individually or in combination in order to solve boot issues.

__STEP 5: Install OSX Yosemite__

Once you get to the installer:

1. In the top menu bar choose __Utilities__, and open __Disk Utility__
2. Highlight your target hard drive for the Yosemite installation in left column.
3. Click __Partition__ tab
4. Click __Current__ and choose __1 Partition__
5. Click __Options…__
6. Choose __GUID Partition Method__
7. Under __Name:__ type __Yosemite__ (You can rename it later)
8. Under __Format__ select __Mac OS Extended (Journaled)__
9. Click __Apply__ then __Partition__
10. Close out of the __Disk Utility__
11. When the installer asks you where to install, choose OSX, or your existing install if your just upgrading.
12. When complete system will reset automatically.
13. Press __F8__ or __F12__ to enter into boot menu & select your __USB__ drive again.
14. At the Chimera Boot Screen, choose your new __OSX__ installation.
15. Complete the OSX initial setup, date, user, password, etc.

__STEP 6: Finalization With MultiBeast__

1. Open Multibeast
2. if this is a new install go to the __Quick Start__ tab & choose __EasyBeast, UserDSDT__, or __DSDT-Free__.
3. Choose your audio drivers, enable trim if you are using an SSD, select your networking driver, etc. here are my settings based upon my motherboard (Gigabyte GA-Z77-D3H) Capture2
![](http://www.instafuze.com/wp-content/uploads/2014/10/Capture2.png)
4. Restart your PC and your done.
Congrats! you just installed  OS X Yosemite on your PC.
