#!/usr/bin/env sh
## sys info to dzen pipe clickable

X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"

popup_width="500" # edit your width to suit

if [ $YP -le "30" ];then 
	pY=$(($YP+15));else
	pY=$(($YP-30)) ## result will be with "-" prefix so menu is above dzenbar
fi

if [ $(($X-$pX+15)) -gt $popup_width ];then 
	pX="$(($XP+10))";else
	pX="$(($XP-$popup_widht+5))"
fi # xoffset w.r.t mouse location
##sleep 1 && exec `(transset .5 -n dzentop >/dev/null 2>&1 &)` &
status="$(mpc status)" # ntfs part; D:
basenameC="basename $(df -h /dev/sda5 | tail -n1 | awk '{print $NF}')" # ntfs part; C:

(
echo "  $(mpc status | head -n1)  "
echo " "
echo "  State: $(mpc status | tail -n2 | head -n1)      " # edit if outputis erratic for inxi
echo "  Volume: $(mpc status | tail -n1)        "
) | dzen2 -p -x $pX -y $pY -w $popup_width -l "4" -sa 'l' -ta 'c' \
	-bg '#0a0e11' -fg '#8db600' -fn "RobotoMono Nerd Font:bold:pixelsize=10:antialias=true"\
    -title-name 'M P D' -e 'onstart=uncollapse;button1=exit;button4=exit;button5=exit' 
