#!/usr/bin/env sh
# clickable workspaces to be populated in dzen

rm -rf /tmp/WS*
rm -rf /tmp/AWS
X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | sed 's/x://g')"
YP="$(xdotool getmouselocation | awk '{print$2}' | sed 's/y://g')"
fws="$(wmctrl -d | sed -n '/* /s///p' | awk '{print$NF}')" # current focused workspace
ufws="$(wmctrl -d | sed -n '/- /s///p' | awk '{print$NF}')" # unfocused workspaces
cwm="$(wmctrl -m | sed -n '/Name: /s///p')" # detect current window manager
dfg="#525e54"
dbg="#111827"
nfg="#b2bdb5"
nbg="#99111827"
ffg="#ffd700" # gold
fbg=""
ufg="#ef4444"
ubg=""
ofg="mediumseagreen" # yellow
obg=""
bspwmtags() { \
	      tags=$(bspc wm -g |
		       sed -Ee 's/:m/ \n  M\>/g' \
			   -e 's/:O|:F/ \n ^fg($ffg)/g'\
			   -e 's/:o/ \n ^fg(#$ofg)/g' \
			   -e 's/:U/ \n ^fg(#00fa9a)/g' \
			   -e 's/:u/ \n ^fg(#d56c30)/g' \
			   -e 's/:/ \n  /g' \
			   | grep "fg" \
			   | sed 's/Desktop/S/g' \
			   | tr '\n' '@' \
			   | sed 's/@/^fg($dfg)\|/g')

#toggle between monocle and tiled on-click
layout=$(bspc query -T -d | grep -q '"userLayout":"monocle"' && echo "  " || echo "  ")

# above data piped into dzen so /tmp creation unnecessary
echo "^bg($dbg) $tags^fg($nfg)^ca(1,bspc desktop -l tiled || bspc desktop -l monocle)$layout^ca()"
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
if [ "$st1" = "f" ]; then ws1="^fg($dfg)$ws1"; elif
   [ "$st1" = "O" ]; then ws1="^fg($ffg)$ws1"; elif
   [ "$st1" = "o" ]; then ws1="^fg($ofg)$ws1"; fi

if [ "$st2" = "f" ]; then ws2="^fg($dfg)$ws2"; elif
   [ "$st2" = "O" ]; then ws2="^fg($ffg)$ws2"; elif
   [ "$st2" = "o" ]; then ws2="^fg($ofg)$ws2"; fi

if [ "$st3" = "f" ]; then ws3="^fg($dfg)$ws3"; elif
   [ "$st3" = "O" ]; then ws3="^fg($ffg)$ws3"; elif
   [ "$st3" = "o" ]; then ws3="^fg($ofg)$ws3"; fi

if [ "$st4" = "f" ]; then ws4="^fg($dfg)$ws4"; elif
   [ "$st4" = "O" ]; then ws4="^fg($ffg)$ws4"; elif
   [ "$st4" = "o" ]; then ws4="^fg($ofg)$ws4"; fi

if [ "$st5" = "f" ]; then ws5="^fg($dfg)$ws5"; elif
   [ "$st5" = "O" ]; then ws5="^fg($ffg)$ws5"; elif
   [ "$st5" = "o" ]; then ws5="^fg($ofg)$ws5"; fi

layout=$(bspc query -T -d | grep -q '"userLayout":"monocle"' && echo "  " || echo "  ")

# creating /tmp data for enabling clickable tags abd layout
echo " ^ca(1,xdotool set_desktop 0)$ws1 ^ca()" > /tmp/WS1
echo "^ca(1,xdotool set_desktop 1)$ws2 ^ca()" > /tmp/WS2
echo "^ca(1,xdotool set_desktop 2)$ws3 ^ca()" > /tmp/WS3
echo "^ca(1,xdotool set_desktop 3)$ws4 ^ca()" > /tmp/WS4
echo "^ca(1,xdotool set_desktop 4)$ws5 ^ca()" > /tmp/WS5
echo "^ca(1,bspc desktop -l tiled || bspc desktop -l monocle)^fg($nfg)$layout^ca()" > /tmp/layout
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
if [ $fws = $ws1 ]; then 
	echo "^bg($fbg)^fg($ffg) $ws1 " > /tmp/WS1; else
	echo "^bg($dbg^fg($dfg) $ws1 " > /tmp/WS1
fi
if [ $fws = $ws2 ]; then 
	echo "^bg($fbg)^fg($ffg) $ws2 " > /tmp/WS2; else 
	echo "^bg($dbg)^fg($dfg) $ws2 " > /tmp/WS2
fi
if [ $ws2 = $ws1 ]; then 
	echo "^bg($dbg)^fg($dfg) II " > /tmp/WS2;echo "^bg($dbg)^fg($dfg) III " > /tmp/WS3;\
	echo "^bg($dbg)^fg($dfg) IV " > /tmp/WS4;echo "^bg($dbg)^fg($dfg) V " > /tmp/WS5
fi
if [ $fws = $ws3 ]; then 
	echo "^bg($fbg)^fg($ffg) $ws3 " > /tmp/WS3; else 
	echo "^bg($dbg)^fg($dfg) $ws3 " > /tmp/WS3
fi
if [ $ws3 = $ws2 ]; then 
	echo "^bg($dbg)^fg($dfg) III " > /tmp/WS3;echo "^bg($dbg)^fg($dfg) IV " > /tmp/WS4;\
	echo "^bg($dbg)^fg($dfg) V " > /tmp/WS5
fi
if [ $fws = $ws4 ]; then 
	echo "^bg($fbg)^fg($ffg) $ws4 " > /tmp/WS4; else 
	echo "^bg($dbg)^fg($dfg) $ws4 " > /tmp/WS4
fi
if [ $ws4 = $ws3 ]; then 
	echo "^bg($dbg)^fg($dfg) IV " > /tmp/WS4;echo "^bg($dbg)^fg($dfg) V " > /tmp/WS5
fi
if [ $fws = $ws5 ]; then 
	echo "^bg($fbg)^fg($ffg) $ws5 " > /tmp/WS5; else 
	echo "^bg($dbg)^fg($dfg) $ws5 " > /tmp/WS5
fi
if [ $ws5 = $ws4 ]; then 
	echo "^bg($dbg)^fg($dfg) V " > /tmp/WS5
fi
}

hl_tags() {

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
if [ "$st1" = "." ]; then ws1="^fg($dfg)$ws1"; elif
   [ "$st1" = "#" ]; then ws1="^fg($ffg)$ws1"; elif
   [ "$st1" = ":" ]; then ws1="^fg($ofg)$ws1"; fi

if [ "$st2" = "." ]; then ws2="^fg($dfg)$ws2"; elif
   [ "$st2" = "#" ]; then ws2="^fg($ffg)$ws2"; elif
   [ "$st2" = ":" ]; then ws2="^fg($ofg)$ws2"; fi

if [ "$st3" = "." ]; then ws3="^fg($dfg)$ws3"; elif
   [ "$st3" = "#" ]; then ws3="^fg($ffg)$ws3"; elif
   [ "$st3" = ":" ]; then ws3="^fg($ofg)$ws3"; fi

if [ "$st4" = "." ]; then ws4="^fg($dfg)$ws4"; elif
   [ "$st4" = "#" ]; then ws4="^fg($ffg)$ws4"; elif
   [ "$st4" = ":" ]; then ws4="^fg($ofg)$ws4"; fi

if [ "$st5" = "." ]; then ws5="^fg($dfg)$ws5"; elif
   [ "$st5" = "#" ]; then ws5="^fg($ffg)$ws5"; elif
   [ "$st5" = ":" ]; then ws5="^fg($ofg)$ws5"; fi
    
if [ "$st6" = "." ]; then ws6="^fg($dfg)$ws6"; elif
   [ "$st6" = "#" ]; then ws6="^fg($ffg)$ws6"; elif
   [ "$st6" = ":" ]; then ws6="^fg($ofg)$ws6"; fi

if [ "$st7" = "." ]; then ws7="^fg($dfg)$ws7"; elif
   [ "$st7" = "#" ]; then ws7="^fg($ffg)$ws7"; elif
   [ "$st7" = ":" ]; then ws7="^fg($ofg)$ws7"; fi

if [ "$st8" = "." ]; then ws8="^fg($dfg)$ws8"; elif
   [ "$st8" = "#" ]; then ws8="^fg($ffg)$ws8"; elif
   [ "$st8" = ":" ]; then ws8="^fg($ofg)$ws8"; fi
   
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

if [ "$cwm" = "bspwm" ]; then
        tags="c_bspwmtags"; elif  # c_bspwmtags is clickable; bspwmtags is default bspwm
        [ "$cwm" = "herbstluftwm" ]; then
        tags="hl_tags"; else
        tags="ewmh_ws"
fi

$tags
