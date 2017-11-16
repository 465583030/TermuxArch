#!/data/data/com.termux/files/usr/bin/bash -e
# Website for this project at https://sdrausty.github.io/TermuxArch
# See https://sdrausty.github.io/TermuxArch/CONTRIBUTORS Thank You! 
# Copyright 2017 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# If you are encountering issues with the system-image.tar.gz file regarding download time, repository website connection and/or md5 checksum error, edit this script and change $mirror to your desired geographic location in knownconfigurations.sh.  Before editing this file, ensure termux-wake-lock is running during script operation and that you have a stable Internet connection. 
################################################################################

depend ()
{
	printf '\033]2;  Thank you for using `setupTermuxArch.sh` 📲 \007'"\n 🕛 \033[36;1m< 🕛 This setup script will attempt to set Arch Linux up in your Termux environment.  When successfully completed, you will be enjoying the bash prompt in Arch Linux in Termux on your smartphone or tablet.  If you do not see 🕐 one o'clock below, run this script again. You might want to check your Internet connection too.  \n\n"
	apt-get -qq install bsdtar proot wget --yes 
	wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.tar.gz
	wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.md5 
	if md5sum -c setupTermuxArch.md5 ; then
		printmd5syschk1success 
		bsdtar -xf setupTermuxArch.tar.gz
		. archsystemconfigs.sh
		. knownconfigurations.sh
		. necessaryfunctions.sh
		. printoutstatements.sh
		rmfiles1  
	else
		printmd5syschkerror
		rmfiles1  
	fi
}

printmd5syschkerror ()
{
	printf "\033[07;1m\033[31;1m\n 🔆 ERROR md5sum mismatch!  Setup initialization mismatch!\033[36;1m  Update your copy of setupTermuxArch.sh.  If you have updated it, this kind of error can go away, sort of like magic.  Waiting a few minutes before executing again is recommended, especially if you are using a new copy from https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh on your system.  There are many reasons that generate checksum errors.  Proxies are one reason.  Mirroring and mirrors are another explaination for md5sum errors.  Either way this means,  \"Try again, initialization was not successful.\"  See https://sdrausty.github.io/TermuxArchPlus/md5sums for more information.  \n\n	Run setupTermuxArch.sh again. \033[31;1mExiting...  \033[0m\n"
	exit 
}

printmd5syschk1success ()
{
	printf "\033[0m\n 🕐 \033[36;1m< 🕛 Installation script download: OK  \033[0m\n"
}

rmfiles1 ()
{
	rm setupTermuxArch.md5
	rm setupTermuxArch.tar.gz
}

# Main Block
depend 
callsystem 
$HOME/arch/$bin ||: 
printtail
exit 

