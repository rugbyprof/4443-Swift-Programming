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
2. Open /Applications/Utilities/Disk Utility
3. Select your USB drive
4. Go to the Partition Tab
5. Click Current and choose 1 Partition 
6. Click Options and Choose Master Boot Record
7. Under Name: type USB
8. Under Format: choose Mac OS Extended (Journaled)
9. Click Apply then Partition
10. Open UniBeast from your desktop
11. Click Continue, Continue, Continue, Agree

![](http://www.tonymacx86.com/attachments/106475d1412962728-ub-1.png.html)

12. At Destination Select, choose USB and click Continue

![](http://www.tonymacx86.com/attachments/106472d1412962641-ub-2.png.html)

13. Choose Yosemite on the Select OS Installation screen
14. Click Continue

![](http://www.tonymacx86.com/attachments/106478d1412962972-ub-3.png.html)

15. If using a 5 or 6 Series system with AWARD BIOS choose Legacy USB Support
16. If using a laptop, choose Laptop Support
17. Click Continue

![](http://www.tonymacx86.com/attachments/106476d1412962807-ub-4.png.html)

18. Enter your password and click Install

![](http://www.tonymacx86.com/attachments/106477d1412962924-ub-6.png.html)

UniBeast will now create the bootable USB drive. Once completed put your the Multibeast folder in the USB drive.

_STEP 4:__Boot into USB Drive

1. Turn on the computer
2. Press the hotkey to choose boot device (usually F12 or F8)
3. Choose _USB-HDD_
4. At the Chimera Boot Screen, choose _USB_ and hit _Enter_

If you can’t get to the OSX installer, try typing in _-x_ at the Chimera Boot  screen. You can also type some other boot flags such as: GraphicsEnabler=Yes, PCIRootUID=1, maxmem=4096, maxmem=8192, and npci=0x2000 individually or in combination in order to solve boot issues.

 STEP 5: Install OSX Yosemite

Once you get to the installer:

1. In the top menu bar choose Utilities, and open Disk Utility
2. Highlight your target hard drive for the Yosemite installation in left column.
3. Click Partition tab
4. Click Current and choose 1 Partition
5. Click Options…
6. Choose GUID Partition Method
7. Under Name: type Yosemite (You can rename it later)
8. Under Format select Mac OS Extended (Journaled)
9. Click Apply then Partition
10. Close out of the Disk Utility
11. When the installer asks you where to install, choose OSX, or your existing install if your just upgrading.
12. When complete system will reset automatically.
13. Press F8 or F12 to enter into boot menu & select your USB drive again.
14. At the Chimera Boot Screen, choose your new OSX installation.
15. Complete the OSX initial setup, date, user, password, etc.
STEP 6: Finalization With MultiBeast 
1. Open Multibeast
2. if this is a new install go to the Quick Start tab & choose EasyBeast, UserDSDT, or DSDT-Free.
3. Choose your audio drivers, enable trim if you are using an SSD, select your networking driver, etc. here are my settings based upon my motherboard (Gigabyte GA-Z77-D3H) Capture2
4. Restart your PC and your done.
Congrats! you just installed  OS X Yosemite on your PC.
