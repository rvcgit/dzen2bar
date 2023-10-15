rm -rf /tmp/WS*
rm -rf /tmp/AWS
X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"
fws="$(wmctrl -d | sed -n '/* /s///p' | awk '{print$NF}')" # current focused workspace
ufws="$(wmctrl -d | sed -n '/- /s///p' | awk '{print$NF}')" # unfocused workspaces
cwm="$(wmctrl -m | sed -n '/Name: /s///p')" # detect current window manager

bspwmtags() { \
	      tags=$(bspc wm -g |
		       sed -Ee 's/:m/ \n  M\>/g' \
			   -e 's/:O|:F/ \n ^fg(#20b2aa)/g'\
			   -e 's/:o/ \n ^fg(#5e8c31)/g' \
			   -e 's/:U/ \n ^fg(#00fa9a)/g' \
			   -e 's/:u/ \n ^fg(#d56c30)/g' \
			   -e 's/:/ \n  /g' \
			   | grep "fg" \
			   | sed 's/Desktop/S/g' \
			   | tr '\n' '@' \
			   | sed 's/@/^fg(#525e54)\|/g')

#toggle between monocle and tiled on-click
layout=$(bspc query -T -d | grep -q '"userLayout":"monocle"' && echo "  " || echo "  ")

# above data piped into dzen so /tmp creation unnecessary
echo "^bg(#111827) $tags^fg(#20b2aa)^ca(1,bspc desktop -l tiled || bspc desktop -l monocle)$layout^ca()"
}

# same as above but with cickable options and display empty tags

c_bspwmtags() {
#ws_state="$(bspc wm -g | sed 's/:/\ /g' | rev | awk '{print $4" "$5" "$6" "$7" "$8}' | rev  | tr -s ' ' '\n')"
# configured to show upto 5 tags
# isolating the workspaces from bspc subscribe
ONE=$(bspc wm -g | sed 's/:/\ /g' | awk '{print $2}')
TWO=$(bspc wm -g | sed 's/:/\ /g' | awk '{print $3}')
THR=$(bspc wm -g | sed 's/:/\ /g' | awk '{print $4}')
FOU=$(bspc wm -g | sed 's/:/\ /g' | awk '{print $5}')
FIV=$(bspc wm -g | sed 's/:/\ /g' | awk '{print $6}')
# getting the current state of workspace [(o)ccupied / (O)ccupied but in focus / (f)empty ]]
st1=$(echo $ONE | cut -b1)
st2=$(echo $TWO | cut -b1)
st3=$(echo $THR | cut -b1)
st4=$(echo $FOU | cut -b1)
st5=$(echo $FIV | cut -b1)
# isolating the workspace name as defined in bspwmrc
ws1=$(echo $ONE | cut -c 2-)
ws2=$(echo $TWO | cut -c 2-)
ws3=$(echo $THR | cut -c 2-)
ws4=$(echo $FOU | cut -c 2-)
ws5=$(echo $FIV | cut -c 2-) &&
# populating the workspaces with predefined FG colors
if [ "$st1" = "f" ]; then ws1="^fg(#525e54)$ws1"; elif
   [ "$st1" = "O" ]; then ws1="^fg(#20b2aa)$ws1"; elif
   [ "$st1" = "o" ]; then ws1="^fg(#5e8c31)$ws1"; fi

if [ "$st2" = "f" ]; then ws2="^fg(#525e54)$ws2"; elif
   [ "$st2" = "O" ]; then ws2="^fg(#20b2aa)$ws2"; elif
   [ "$st2" = "o" ]; then ws2="^fg(#5e8c31)$ws2"; fi

if [ "$st3" = "f" ]; then ws3="^fg(#525e54)$ws3"; elif
   [ "$st3" = "O" ]; then ws3="^fg(#20b2aa)$ws3"; elif
   [ "$st3" = "o" ]; then ws3="^fg(#5e8c31)$ws3"; fi

if [ "$st4" = "f" ]; then ws4="^fg(#525e54)$ws4"; elif
   [ "$st4" = "O" ]; then ws4="^fg(#20b2aa)$ws4"; elif
   [ "$st4" = "o" ]; then ws4="^fg(#5e8c31)$ws4"; fi

if [ "$st5" = "f" ]; then ws5="^fg(#525e54)$ws5"; elif
   [ "$st5" = "O" ]; then ws5="^fg(#20b2aa)$ws5"; elif
   [ "$st5" = "o" ]; then ws5="^fg(#5e8c31)$ws5"; fi

layout=$(bspc query -T -d | grep -q '"userLayout":"monocle"' && echo "  " || echo "  ")

# creating /tmp data for enabling clickable tags and layout
echo " ^ca(1,xdotool set_desktop 0)$ws1 ^ca()" > /tmp/WS1
echo " ^ca(1,xdotool set_desktop 1)$ws2 ^ca()" > /tmp/WS2
echo " ^ca(1,xdotool set_desktop 2)$ws3 ^ca()" > /tmp/WS3
echo " ^ca(1,xdotool set_desktop 3)$ws4 ^ca()" > /tmp/WS4
echo " ^ca(1,xdotool set_desktop 4)$ws5 ^ca()" > /tmp/WS5
echo "^ca(1,bspc desktop -l tiled || bspc desktop -l monocle)^fg(#20b2aa)$layout^ca()" > /tmp/layout
}

hl_tags() {
dfg="#525e54"
dbg="#111827"
nfg="#E7E5E4"
nbg="#99111827"
ffg="#ffd700" # gold
fbg=""
ufg="#ef4444"
ubg=""
ofg="mediumseagreen" # yellow
obg=""

# i have configured upto 8 tags 

    ONE=$(herbstclient tag_status | awk '{print$1}')
    TWO=$(herbstclient tag_status | awk '{print$2}')
    THR=$(herbstclient tag_status | awk '{print$3}')
    FOU=$(herbstclient tag_status | awk '{print$4}')
    FIV=$(herbstclient tag_status | awk '{print$5}')
    SIX=$(herbstclient tag_status | awk '{print$6}')
    SEV=$(herbstclient tag_status | awk '{print$7}')
    EIG=$(herbstclient tag_status | awk '{print$8}')
    
# state of tags
	st1=$(echo $ONE | cut -b1)
	st2=$(echo $TWO | cut -b1)	
   	st3=$(echo $THR | cut -b1)
	st4=$(echo $FOU | cut -b1)
	st5=$(echo $FIV | cut -b1)
	st6=$(echo $SIX | cut -b1)
	st7=$(echo $SEV | cut -b1)
	st8=$(echo $EIG | cut -b1)

# isolating the workspace name as defined in bspwmrc
	ws1=$(echo $ONE | cut -c 2-)
	ws2=$(echo $TWO | cut -c 2-)
	ws3=$(echo $THR | cut -c 2-)
	ws4=$(echo $FOU | cut -c 2-)
	ws5=$(echo $FIV | cut -c 2-)
	ws6=$(echo $SIX | cut -c 2-)
	ws7=$(echo $SEV | cut -c 2-)
	ws8=$(echo $EIG | cut -c 2-) &&
	
	# populating the workspaces with predefined FG colors
if [ "$st1" = "." ]; then ws1="^fg(#3f4f5f)$ws1"; elif
   [ "$st1" = "#" ]; then ws1="^fg(#ffd700)$ws1"; elif
   [ "$st1" = ":" ]; then ws1="^fg(#82d600)$ws1"; fi

if [ "$st2" = "." ]; then ws2="^fg(#3f4f5f)$ws2"; elif
   [ "$st2" = "#" ]; then ws2="^fg(#ffd700)$ws2"; elif
   [ "$st2" = ":" ]; then ws2="^fg(#82d600)$ws2"; fi

if [ "$st3" = "." ]; then ws3="^fg(#3f4f5f)$ws3"; elif
   [ "$st3" = "#" ]; then ws3="^fg(#ffd700)$ws3"; elif
   [ "$st3" = ":" ]; then ws3="^fg(#82d600)$ws3"; fi

if [ "$st4" = "." ]; then ws4="^fg(#3f4f5f)$ws4"; elif
   [ "$st4" = "#" ]; then ws4="^fg(#ffd700)$ws4"; elif
   [ "$st4" = ":" ]; then ws4="^fg(#82d600)$ws4"; fi

if [ "$st5" = "." ]; then ws5="^fg(#3f4f5f)$ws5"; elif
   [ "$st5" = "#" ]; then ws5="^fg(#ffd700)$ws5"; elif
   [ "$st5" = ":" ]; then ws5="^fg(#82d600)$ws5"; fi
    
if [ "$st6" = "." ]; then ws6="^fg(#3f4f5f)$ws6"; elif
   [ "$st6" = "#" ]; then ws6="^fg(#ffd700)$ws6"; elif
   [ "$st6" = ":" ]; then ws6="^fg(#82d600)$ws6"; fi

if [ "$st7" = "." ]; then ws7="^fg(#3f4f5f)$ws7"; elif
   [ "$st7" = "#" ]; then ws7="^fg(#ffd700)$ws7"; elif
   [ "$st7" = ":" ]; then ws7="^fg(#82d600)$ws7"; fi

if [ "$st8" = "." ]; then ws8="^fg(#3f4f5f)$ws8"; elif
   [ "$st8" = "#" ]; then ws8="^fg(#ffd700)$ws8"; elif
   [ "$st8" = ":" ]; then ws8="^fg(#82d600)$ws8"; fi
   
# creating /tmp data for enabling clickable tags
echo " ^ca(1,xdotool set_desktop 0)$ws1 ^ca()" > /tmp/WS1
echo "^ca(1,xdotool set_desktop 1)$ws2 ^ca()" > /tmp/WS2
echo "^ca(1,xdotool set_desktop 2)$ws3 ^ca()" > /tmp/WS3
echo "^ca(1,xdotool set_desktop 3)$ws4 ^ca()" > /tmp/WS4
echo "^ca(1,xdotool set_desktop 4)$ws5 ^ca()" > /tmp/WS5
echo "^ca(1,xdotool set_desktop 5)$ws6 ^ca()" > /tmp/WS6
echo "^ca(1,xdotool set_desktop 6)$ws7 ^ca()" > /tmp/WS7
echo "^ca(1,xdotool set_desktop 7)$ws8 ^ca()" > /tmp/WS8

}


ewmh_ws() {
if [ $cwm != "XMonad" ] || [ $run != "dwm" ];then
	for i in {0..7};do
		cws=$(xdotool get_desktop)
		ws1=$(wmctrl -d | head -n1 | awk '{print $NF}')
		ws2=$(wmctrl -d | head -n2 | awk '{print $NF}' | tail -n1)
		ws3=$(wmctrl -d | head -n3 | awk '{print $NF}' | tail -n1)
		ws4=$(wmctrl -d | head -n4 | awk '{print $NF}' | tail -n1)
		ws5=$(wmctrl -d | head -n5 | awk '{print $NF}' | tail -n1)
		ws6=$(wmctrl -d | head -n6 | awk '{print $NF}' | tail -n1)
		ws7=$(wmctrl -d | head -n7 | awk '{print $NF}' | tail -n1)
		ws8=$(wmctrl -d | head -n8 | awk '{print $NF}' | tail -n1)
		
		[ "$cws | awk '{print$1}'" ] && break
		sleep 0.5
	done
fi
	# update active workspace in realtime
		case "$cws" in
			0)	echo "$ws1 " > /tmp/AWS ;;
			*) ;;
		esac
		case "$cws" in
			1)	echo "$ws2 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			2)	echo "$ws3 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			3)	echo "$ws4 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			4)	echo "$ws5 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			5)	echo "$ws6 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			6)	echo "$ws7 " > /tmp/AWS ;;
			*)	;;
		esac
		case "$cws" in
			7)	echo "$ws8 " > /tmp/AWS ;;
			*)	;;
		esac
		
# lets populate workspaces	
fws="$(wmctrl -d | sed -n '/* /s///p' | awk '{print$NF}')"
#echo $fws > /tmp/AWS
if [ $fws = $ws1 ]; then echo "^bg(#030303)^fg(#ffd700) $ws1 " > /tmp/WS1; else echo "^bg(#111827)^fg(#525e54) $ws1 " > /tmp/WS1;fi
if [ $fws = $ws2 ]; then echo "^bg(#030303)^fg(#ffd700) $ws2 " > /tmp/WS2; else echo "^bg(#111827)^fg(#525e54) $ws2 " > /tmp/WS2;fi
if [ $ws2 = $ws1 ]; then echo "^bg(#111827)^fg(#525e54) II " > /tmp/WS2;echo "^bg(#111827)^fg(#525e54) III " > /tmp/WS3;echo \
"^bg(#111827)^fg(#525e54) IV " > /tmp/WS4;echo "^bg(#111827)^fg(#525e54) V " > /tmp/WS5;fi
if [ $fws = $ws3 ]; then echo "^bg(#030303)^fg(#ffd700) $ws3 " > /tmp/WS3; else echo "^bg(#111827)^fg(#525e54) $ws3 " > /tmp/WS3;fi
if [ $ws3 = $ws2 ]; then echo "^bg(#111827)^fg(#525e54) III " > /tmp/WS3;echo "^bg(#111827)^fg(#525e54) IV " > /tmp/WS4;echo "^bg(#111827)^fg(#525e54) V " > /tmp/WS5;fi
if [ $fws = $ws4 ]; then echo "^bg(#030303)^fg(#ffd700) $ws4 " > /tmp/WS4; else echo "^bg(#111827)^fg(#525e54) $ws4 " > /tmp/WS4;fi
if [ $ws4 = $ws3 ]; then echo "^bg(#111827)^fg(#525e54) IV " > /tmp/WS4;echo "^bg(#111827)^fg(#525e54) V " > /tmp/WS5; fi
if [ $fws = $ws5 ]; then echo "^bg(#030303)^fg(#ffd700) $ws5 " > /tmp/WS5; else echo "^bg(#111827)^fg(#525e54) $ws5 " > /tmp/WS5;fi
if [ $ws5 = $ws4 ]; then echo "^bg(#111827)^fg(#525e54) V " > /tmp/WS5;fi
}


if [ "$cwm" = "bspwm" ]; then
        tags="c_bspwmtags"; elif  # c_bspwmtags is clickable; bspwmtags is default bspwm
        [ "$cwm" = "herbstluftwm" ]; then
        tags="hl_tags"; else
        tags="ewmh_ws"
fi

$tags
