#!/usr/bin/env sh
## workspaces for EWMH / non EWMH window managers

wsn() {
run=$(wmctrl -m | sed -n '/Name: /s///p')
if [ $run = "XMonad" ] || [ $run = "dwm" ];then
	echo "OnE" > /tmp/WS1
	echo "tWo" > /tmp/WS2
	echo "ThReE" > /tmp/WS3
	echo "fOuR" > /tmp/WS4
	echo "FiVe" > /tmp/WS5
	echo " " > /tmp/AWS;		### for non ewmh wm XMonad & dwm
elif [ $run != "XMonad" ] || [ $run != "dwm" ];then
	for i in {0..7};do
		cws=$(xdotool get_desktop)
		wsn=$(wmctrl -d | sed -n '/* /s///p' | awk '{print$NF}')
		ws1=$(wmctrl -d | head -n1 | awk '{print $NF}')
		ws2=$(wmctrl -d | head -n2 | awk '{print $NF}' | tail -n1)
		ws3=$(wmctrl -d | head -n3 | awk '{print $NF}' | tail -n1)
		ws4=$(wmctrl -d | head -n4 | awk '{print $NF}' | tail -n1)
		ws5=$(wmctrl -d | head -n5 | awk '{print $NF}' | tail -n1)
		
		[ "$cws | awk '{print$1}'" ] && break
		sleep 0.5
	done
	
		case "$cws" in
			0)	echo "$wsn" > /tmp/AWS ;;
			*) ;;
		esac
		case "$cws" in
			1)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			2)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			3)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			4)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			5)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			6)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			7)	echo "$wsn" > /tmp/AWS ;;
			*)	;;
		esac
	
	if [ $ws2 = $ws1 ]; then		## populating configured workspaces upto 5 workspaces in the bar
		echo "$ws1" > /tmp/WS1
		echo "ii" > /tmp/WS2
		echo "iii" > /tmp/WS3
		echo "iv" > /tmp/WS4
		echo "v" > /tmp/WS5;
	elif [ $ws3 = $ws2 ];then
		echo "$ws1" > /tmp/WS1
		echo "$ws2" > /tmp/WS2
		echo "iii" > /tmp/WS3
		echo "iv" > /tmp/WS4
		echo "v" > /tmp/WS5;
	elif [ $ws4 = $ws3 ]; then
		echo "$ws1" > /tmp/WS1
		echo "$ws2" > /tmp/WS2
		echo "$ws3" > /tmp/WS3
		echo "iv" > /tmp/WS4
		echo "v" > /tmp/WS5;
	elif [ $ws5 = $ws4 ]; then
		echo "$ws1" > /tmp/WS1
		echo "$ws2" > /tmp/WS2
		echo "$ws3" > /tmp/WS3
		echo "$ws4" > /tmp/WS4
		echo "v" > /tmp/WS5;
	elif [ $ws5 != $ws4 ];then
		echo "$ws1" > /tmp/WS1
		echo "$ws2" > /tmp/WS2
		echo "$ws3" > /tmp/WS3
		echo "$ws4" > /tmp/WS4
		echo "$ws5" > /tmp/WS5;fi
fi
}
wsn
