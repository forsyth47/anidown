#!/bin/sh
read -p "Enter Anime Name [answer]: " aniname
read -p "Create Folder with same name? (Y/n): " crefol
read -p "Select Quality: [1]:best [2]:1080 [3]:720 [4]:480 [else]:quit [answer]: " aniquali
read -p "Providers: [1]XstreamCDN [2]:Animixplay [3]:Gogo [answer]: " provid

if [[ $crefol == n ]] ; then
	read -p "Enter Folder name: " folname
	if [[ $aniquali == 1 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$folname"
		ani-cli -f -q best -r $provid -p /mnt/usb/sdb2/media/Anime/"$folname"/ $aniname
	elif [[ $aniquali == 2 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$folname"
		ani-cli -f -q 1080 -r $provid -p /mnt/usb/sdb2/media/Anime/"$folname"/ $aniname
	elif [[ $aniquali == 3 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$folname"
		ani-cli -f -q 720 -r $provid -p /mnt/usb/sdb2/media/Anime/"$folname"/ $aniname
	elif [[ $aniquali == 4 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$folname"
		ani-cli -f -q 480 -r $provid -p /mnt/usb/sdb2/media/Anime/"$folname"/ $aniname
	else
		echo "No option were select; No Folder created... Exiting"
		exit 0
	fi
	read -p "Do you want to rename! [experimantal] (y/N): " reans
	if [[ $reans == y ]] ; then
		read -p 'Pausing for 15 seconds ; Enter to bypass.' -t 15
		cd /mnt/usb/sdb2/media/Anime/"$folname"
		a=1
		IFS="."
		for i in *.mp4; do
			tempname=$(echo $i | sed 's/\w*$//')
			new=$(printf "%02d. $tempname.mp4" "$a") #04 pad to length of 4
			mv -i -- "$i" "$new"
			let a=a+1
		done
	else
		cd
	fi

else
	if [[ $aniquali == 1 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$aniname"
		ani-cli -f -q best -r $provid -p /mnt/usb/sdb2/media/Anime/"$aniname"/ $aniname
	elif [[ $aniquali == 2 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$aniname"
		ani-cli -f -q 1080 -r $provid -p /mnt/usb/sdb2/media/Anime/"$aniname"/ $aniname
	elif [[ $aniquali == 3 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$aniname"
		ani-cli -f -q 720 -r $provid -p /mnt/usb/sdb2/media/Anime/"$aniname"/ $aniname
	elif [[ $aniquali == 4 ]] ; then
		mkdir /mnt/usb/sdb2/media/Anime/"$aniname"
		ani-cli -f -q 480 -r $provid -p /mnt/usb/sdb2/media/Anime/"$aniname"/ $aniname
	else
		echo "No option were select; No Folder created... Exiting"
		exit 0
	fi
	
	
	read -p "Do you want to rename! [experimantal] (y/N): " reans
	if [[ $reans == y ]] ; then
		read -p 'Pausing for 15 seconds ; Enter to bypass.' -t 15
		cd /mnt/usb/sdb2/media/Anime/"$aniname"
		a=1
		IFS='.'
		for i in *.mp4; do
			tempname=$(echo $i | sed 's/\w*$//')
			new=$(printf "%02d. $tempname.mp4" "$a") #04 pad to length of 4
			mv -i -- "$i" "$new"
			let a=a+1
		done
	else
		cd
	fi
fi
