#!/usr/bin/env sh
## rofi for dzen [bottom bar; redefine dX and dY for other positions]
menu_width="$1"
X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution ; Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"
if [[ "$YP" -lt "50" ]];then loc="1";else  # 50% of Y resolution 
	loc="7";fi &&
if [[ $YP -le "50" ]];then anc="1";else
	anc="7";fi &&

if [[ $anc == "1" ]]; then pY=$(($YP+10));elif
	[[ $anc == "7" ]]; then pY=$(YP-30);fi

if [[ $(($XP-$X)) -gt "$menu_width"  ]];then 
	pX="$(($XP-$menu_width))";else 
	pX="$(($XP-10))";fi ## x offset to align

	rofi -show "drun" \
		-modi "drun" \
		-location $loc -anchor $anc \
		-xoffset $pX -yoffset $pY \
		-no-sidebar-mode \
 		-theme-str "#window { width: 25%; }" \
		-theme-str "#listview { lines: 9; dynamic: true; fixed-height: false; }"
