### How To Install OSX Yosemite On Your PC
____Posted on October 19, 2014 by Waj Syed___
Source: http://www.instafuze.com/?p=587

This guide will give a complete step by step on how to install OS 10.10 Yosemite on any PC that has a Intel base processor.

 What You Need:
1. Built PC With Intel CPU
2. Any Computer Running Mac OSX Snow Leopard 10.6.6 or later.
3. USB Stick 8Gb or Larger


What you need to Download: Click for the link

Yosemite

UniBeast

Multibeast

DSDT (if needed)

Inorder to download Unibeast, Multibeast  and DSDT files you need to have an account on tonymacx86.  If you don’t have an account then you can create an here.http://www.tonymacx86.com/register.php.

Make your you have Unibeast and Multibeast downloaded and unziped on to your desktop.

STEP 1: Download OSX 10.10 Yosemite

The cool thing is that the whole OS is free for anyone who has a Apple ID and acess to a machine running 10.6.8 Snow Leopard or later.

Open Mac App Store
Log into your Apple ID
Download OS X Yosemite (its a big file >5GB so relax)
STEP 2: Making a Bootable USB Drive

Insert your USB drive the is 8GB or Larger
Open /Applications/Utilities/Disk Utility
Select your USB drive
Go to the Partition Tab
Click Current and choose 1 Partition 
Click Options and Choose Master Boot Record
Under Name: type USB
Under Format: choose Mac OS Extended (Journaled)
Click Apply then Partition
Open UniBeast from your desktop
Click Continue, Continue, Continue, Agree

12. At Destination Select, choose USB and click Continue


13. Choose Yosemite on the Select OS Installation screen
14. Click Continue


15. If using a 5 or 6 Series system with AWARD BIOS choose Legacy USB Support
16. If using a laptop, choose Laptop Support
17. Click Continue


18. Enter your password and click Install


UniBeast will now create the bootable USB drive. Once completed put your the Multibeast folder in the USB drive.

STEP 4: Boot into USB Drive

Turn on the computer
Press the hotkey to choose boot device (usually F12 or F8)
Choose USB-HDD
At the Chimera Boot Screen, choose USB and hit Enter
If you can’t get to the OSX installer, try typing in -x at the Chimera Boot  screen. You can also type some other boot flags such as: GraphicsEnabler=Yes, PCIRootUID=1, maxmem=4096, maxmem=8192, and npci=0x2000 individually or in combination in order to solve boot issues.

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
