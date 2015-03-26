##How To DualBoot OSX & Windows

___Posted on November 4, 2014 by [Waj Syed](http://www.instafuze.com/)___

___Source: http://www.instafuze.com/?p=619___

![](http://www.instafuze.com/wp-content/uploads/2014/11/DUALBOOT-THUMB.jpg)

###List of ingredients

- A machine that can run osx and windows

- Access to a computer that’s running OSX already

-8 Gb or larger Usb Drive for Unibeast with osx on it

-8 Gb or larger USB or DVD with Windows


 
What you need to Download: Click for the link

- [Yosemite](https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=915041082&mt=12)
- [Windows 10 preview](http://windows.microsoft.com/en-us/windows/preview)
- [UniBeast](http://www.tonymacx86.com/downloads.php?do=file&id=244)
- [Multibeast](http://www.tonymacx86.com/downloads.php?do=file&id=242)
- [DSDT](http://www.tonymacx86.com/11-dsdt-database.html) (if needed)

Inorder to download Unibeast, Multibeast  and DSDT files you need to have an account on tonymacx86.  If you don’t have an account then you can create an here.http://www.tonymacx86.com/register.php.

__Step 1: Create OSX Unibeast USB and Windows USB__

1. Make your unibeast usb drive, see step 2 on my full hackintosh guide, what means downloading OSX yosemite from app store, unibeast and multibeast. and run the unibeast utility to make your osx installer. when your done copy multibeast folder to usb
2. If you have a copy of windows on a physical disc then skip the following step, to make your Bootable windows USB you want to Put a windows iso or disc image to your USB. Im just downloading the [windows 10](http://windows.microsoft.com/en-us/windows/preview) preview from Microsoft and using the windows USB installer utility.

Now you should have one usb with osx and another usb with windows.

__Step 2: Boot into OSX installer__

1. turn on pc that you’re going to be installing everything on to and mash __delete__ to enter BIO.
2. Make sure sata settings are set to __AHCI__, instead of Raid or IDE. save and exit BIO by hitting __F10__.
3. As your pc resets start pressing __F8__ or __F12__ to enter into boot menu.
4. Select the USB drive that has Unibeast on it In my case that usb drive is called “USB”.
5. At the Chimera Boot Screen, choose __USB__ (with the unibeast icon) and hit __Enter__

if you can’t get to the OSX install use these boot flags at the chimera boot screen.

__Step 3: Partition Drive & Install OSX__

1. Select your language
2. Next click utilities at the top and select disk utilities
3. Select the drive that were going to be installing everything on to.
4. Go to the partition tab , set the partition layout to __2 Partitions__.
5. Click on Options and make sure it is set to __GUID Partition Table__.
6. Name the Top Partition “__Macintosh__” and change the format to __Mac OS Extended__ Journaled. Name the bottom Partition “__Windows__” and set the format to __MS-DOS FAT__. Then Click __Apply__. Once complete exit disk utility.
7. Go through the OSX installer & Select the “__Macintosh__” partition to install OSX on to and click continue. Once completed your computer will reset.
8. Boot into unibeast USB from boot menu again, and when you get to the chimera bootloader select the new OSX install named “Macintosh”.
9. Complete install setup and use multibeast to install the drivers for your audio, networking etc, don’t install chimera bootloader yet. Once multibeast is done shutdown your computer.


#### Step 4: Install Windows

1. Take out the osx USB and insert your windows USB or disc. Turn on your pc.
2. Mash __F8__ or __F12__ select the windows usb or disk.
3. Once you’re at the windows installer, select your language and click next, then install now, agree to terms.
4. Select __Custom (advanced)__
5. Select the partition labeled “__Windows__”, select __Format__ & click __OK__.
6. If it says Windows cannot be installed on the partition  and doesn’t let you install windows on that part, just restart and it should let you install .
7. Install windows, once windows is done installing, go through the initial setup and install your drivers like you would regularly do for any new windows installation.
8. Once your done all that shutdown your computer


#### Step 5: Installing Bootloader 

1. Unplug windows usb drive and insert unibeast flash drive again. turn on your computer.
2. Boot into unibeast flash drive from the boot menu.
3. At the chimera boot screen select your __Macintosh__ installation.
4. Once your is OSX run mulltibeast and install the chimera bootloader i like to just select the DSDT Free option. Once complete, take out the usb flash drive and  reboot.

And congrats you now have a choice of running either osx and windows on your pc. so every time you turn on your pc you can boot into what ever operating system you like.

