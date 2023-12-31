#!/usr/bin/env sh
# rofi_cmd to locate rofi relatively

# for icon [using nerd fonts]
i='  ' i_fa_ban=$i
i='  ' i_fa_lock=$i
i='  ' i_fa_circle_o=$i
i='  ' i_fa_moon_o=$i
i='  ' i_fa_sign_out=$i
i='  ' i_fa_refresh=$i
i='  '  i_fa_power_off=$i
i='  ' i_fa_plug=$i

rofi_cmd() {	# 1 parameter: menu_width. The rest of parameters is passed to rofi
	menu_width="$1"	# width in pixels; XP & YP = current mouse position

X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"
if [ "$YP" -lt "50" ];then loc="1";else 
	loc="7";fi &&
if [ $loc = "1" ];then anc="1";elif
	[ $loc = "7" ]; then anc="7"
 fi &&

if [ $loc = "1" ]; then pY=$(($YP+10));else
		pY=$(($YP-$Y))
  fi &&

if [ $(($X-$XP-20)) -lt $menu_width ];then
	pX=$(($XP-$menu_width));else
 	pX=$(($XP-20));
  fi &&

	rofi  $@ \
	-location $loc -anchor $anc \
	-xoffset $pX -yoffset $pY \
	-theme-str 'window {width: 11%;}' \
	-theme-str 'listview { lines: 9; dynamic: true; fixed-height: false; }'
}

rofi_menu() { # 3 parameters: menu_title menu_width menu_list
	menu_title="$1"
	menu_width="$2"
	menu_list="$3"

	IFS='
	'
	for line in $menu_list ; do
		echo "${line%%:*}"
	done \
	| rofi_cmd "$menu_width" -dmenu -p "$menu_title" \
	| {	read choice
		for line in $menu_list ; do
			if [ "$choice" = "${line%%:*}" ] ; then
				echo "${line#*:}"
				break
			fi
		done
	}
}
rofi_exit() {
	eval $(rofi_menu " :" 100 \
		"	$i_fa_ban cancel:true
			$i_fa_lock lock:screenlock
			$i_fa_circle_o suspend:systemctl suspend
			$i_fa_moon_o hibernate:systemctl hibernate
			$i_fa_sign_out logout:xdotool key --clearmodifiers super+shift+q
			$i_fa_refresh reboot:systemctl reboot
			$i_fa_power_off poweroff:systemctl poweroff	")
}

rofi_exit
