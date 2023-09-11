wit#!/usr/bin/env sh
## sys info to dzen pipe clickable

X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"

if [ $YP -le "30" ];then pY=$(($YP+15));else
	pY=$(($YP-30)) ## result will be with "-" prefix so menu is above dzenbar
fi

pX=$(($XP+10)) ## x offset to align

if [[ $pX -ge "400" ]];then pX="$(($X*60/100))";else pX="$pX";fi

D=$(df -h /dev/sda7 | tail -n1 | sed 's/run//g' | sed 's/media//g') # ntfs part; D: edit to suit your device id sdXY
C=$(df -h /dev/sda5 | tail -n1 | sed 's/run//g' | sed 's/media//g') # ntfs part; C: edit to suuit yur device id sdXY

(
echo " [ System Status ] "
echo " "
echo "Memory  : $(inxi -m | grep System | rev | awk '{print $5$6" / "$2$3}' | rev )   "
echo "cpuTemp  : $(inxi -F | grep Temperatures | awk '{print $4}')˚C ; Fan   : $(inxi -F | grep Fan | awk '{print$NF}')rpm   "
echo "Battery condition ⚡ ' : $(inxi -B | grep condition | rev | awk '{print $1" "$2 " "$3}' | rev | sed 's/\ //g' )  "
echo "Root Disk   : $(df -h /dev/sda10 | tail -n1)   "
echo "Home Disk  : $(df -h /dev/sda11 | tail -n1)   "
echo "D:\ ${D/\/\/\/$USER\//}	  "
echo "C:\ ${C/\/\/\/$USER\//}	  "
) | dzen2 -p -x $pX -y $pY -w "450" -l "9" -sa 'r' -ta 'l' -fn "RobotoMono Nerd Font:bold:pixelsize=10:antialias=true"\
    -title-name 'System Info' -e 'onstart=uncollapse;button1=exit;button4=exit;button5=exit'
