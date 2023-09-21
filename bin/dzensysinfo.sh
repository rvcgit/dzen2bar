#!/usr/bin/env sh
## sys info to dzen pipe clickable

X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"

popup_width="360" # edit your width to suit

if [ $YP -le "30" ];then 
	pY=$(($YP+15));else
	pY=$(($YP-30)) ## result will be with "-" prefix so menu is above dzenbar
fi

if [ $(($X-$pX+15)) -gt $popup_width ];then 
	pX="$(($XP+10))";else
	pX="$(($XP-$popup_widht+5))"
fi # xoffset w.r.t mouse location

basenameD="$(basename $(df -h /dev/sda7 | tail -n1 | awk '{print $NF}'))" # ntfs part; D:
basenameC="basename $(df -h /dev/sda5 | tail -n1 | awk '{print $NF}')" # ntfs part; C:

## Checkout and edit your dev fo all the inxi output below

(
echo " [ System Status ] "
echo " "
echo "Memory  : $(inxi -m | grep System | rev | awk '{print $5$6" / "$2$3}' | rev )   " # edit if outputis erratic for inxi
echo "cpuTemp  : $(inxi -F | grep Temperatures | awk '{print $4}')˚C ; Fan   : $(inxi -F | grep Fan | awk '{print$NF}')rpm   "
echo "Battery condition ⚡ ' : $(inxi -B | grep condition | rev | awk '{print $1" "$2 " "$3}' | rev | sed 's/\ //g' )  "
echo "Root Disk  : $(df -h /dev/sdaX | tail -n1 | awk '{$NF=""}1')  ROOT  "
echo "Home Disk  : $(df -h /dev/sdaY | tail -n1 | awk '{$NF=""}1')  HOME  "
echo "D:\ $(df -h /dev/sda7 | tail -n1 | awk '{$NF=""}1')  $basenameD  "
echo "C:\ $(df -h /dev/sda5 | tail -n1 | awk '{$NF=""}1')  $basenameC  "
) | dzen2 -p -x $pX -y $pY -w $popup_width -l "9" -sa 'r' -ta 'l' \
-bg '#0C4A6E' -fg '#BAE6FD' -fn "RobotoMono Nerd Font:bold:pixelsize=10:antialias=true"\
-title-name 'System Info' -e 'onstart=uncollapse;button1=exit;button4=exit;button5=exit'
