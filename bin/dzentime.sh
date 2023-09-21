#!/usr/bin/env sh
#date pipe for dzen with customised cal popup on-click
X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"

if [ $YP -le "30" ];then 
	pY=$(($YP+15));else
	pY=$(($YP-30)) ## result will be with "-" prefix so menu is above dzenbar
fi
pX=$(($XP+10)) ## x offset to align
# some distro doesnt permit the -m flag in cal [i like monday to be day 1; in such cases use just cal [without -m]
(
echo "Calendar"
echo "$(cal -m | grep --color -EC6 "\b$(date +%e | sed 's/ //g')")" # ifcal -m returns blank, use just cal OR ncal -C
echo "It's $(date '+%a %e %b')"
) | dzen2 -p -x $pX -y $pY -w "240" -l "9" -sa 'c' -ta 'c' \
-bg '#134E4A' -fg '#CCFBF1' -fn "RobotoMono Nerd Font:pixelsize=13:Bold:antialias=true"\
-title-name 'Calendar' -e 'onstart=uncollapse;button1=exit;button4=exit;button5=exit'
