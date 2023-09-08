#!/usr/bin/env sh
# xtitle for dzen2  using rofi commands
title_cmd() {
	rofi -modi windowcd -show windowcd -display-windowcd "Window:" -no-sidebar-mode
}

sp_title() {
	if ! which xtitle > /dev/null ; then		# check if xtitle is installed
		print_module "$1" "no xtitle"
		exit
	fi
	pkill -x xtitle >/dev/null 2>&1

	FORMAT="${1}:%s%"

	xtitle -s -t -70 -f "$FORMAT"
}
sp_title_mod() {
	lastpid=""
	xprop -spy -root -notype _NET_ACTIVE_WINDOW \
	| while read winid; do
		if ps -p $lastpid  >/dev/null 2>&1 ; then
			kill $lastpid
		fi
	winid="${winid##* }"
	if [ "$winid" = "0x0" ] ; then	# empty desktop
		echo
	else
		xprop -spy -id ${winid} -notype _NET_WM_NAME &
		lastpid=$!
	fi
	done 2>/dev/null \
	| while read line; do
		line="${line#* =}"
		line="${line#*\"}"
		line="${line%\"}"
		echo "$1:$line"
	done
}
sp_title
