#!/usr/bin/env sh
## weather info on-click for dzen
X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"

if [ $YP -le "30" ];then pY=$(($YP+15));else
	pY=$(($YP-30)) ## result will be with "-" prefix so menu is above dzenbar
fi

pX=$(($X*33/100)) ## x offset to align

(
echo " [ Weather Forecast ] "
echo "Hi there... Today, it's ..."
echo "$(cat /tmp/asciiwttr)"
) | dzen2 -p -x $pX -y $pY -w "850" -l "30" -sa 'c' -ta 'c' -fn "Hack NF:pixelsize=10:bold:antialias=true"\
    -title-name 'Weather' -e 'onstart=uncollapse;button1=exit;button4=exit;button5=exit'
