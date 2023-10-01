#!/bin/bash
# 
# Dzen2 App Launcher script box version by Rasmus Edgar.
# -tw = Width of titlebar, -w = Width of slavewindow,
# -l = length of slavewindow. Remember to adjust -l accordingly when adding 
# apps. ^pa(*) is for text/decoration alignment.
# 
#
#
# Menu script starts below.   
#

# Needed Applications:

AP1=firefox
AP2=sakura
AP3=gimp
AP4=gedit
AP5=pcmanfm
SM1=Exit_Menu

# Get cursor position:

X=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f1) #screen resolution ; X
Y=$(xrandr | grep '*' | uniq | awk '{print$1}' | cut -d 'x' -f2) #screen resolution Y
XP="$(xdotool getmouselocation | awk '{print$1}' | cut -c3-6)"
YP="$(xdotool getmouselocation | awk '{print$2}' | cut -c3-5)"

pY="$(($YP-30))" 
pX="$(($XP+10))" 

if [[ $pX -ge "100" ]];then dX="100";else dX="$pX";fi
if [[ $pY -ge "40" ]];then dY="40";else dY="$pY";fi

# Decorations for the menu:

DC1=1x17
DC2=3x2
DC3=4x2
DC4=3x1
DC5=198x10
DC6=199x17

# Font:

#FONT="-*-dina-medium-r-*-*-15-*-*-*-*-*-iso8859-1"
FONT="pretzel-13:antialias=true"
# Menu Title

TI="Dzen2menu"

# Colors:

FG1=#4682b4
FG2=#f57900
FG3=#4682b4
#FG3=#D9A509
BG1=#091020

# Icons:

IC1=~/.config/herbstluftwm/simply-xbm/firefox.xbm
IC2=~/.config/herbstluftwm/simply-xbm/urxvt.xbm
IC3=~/.config/herbstluftwm/simply-xbm/gimp.xbm
IC4=~/.config/herbstluftwm/simply-xbm/gedit.xbm
IC5=~/.config/herbstluftwm/simply-xbm/pcmanfm.xbm
SMI=~/.config/herbstluftwm/simply-xbm/arrow-right.xbm

# Text piped to Dzen2

(echo "^ro(${DC6})^ib(1)^pa(30)$TI" ;echo -e "^fg(${FG1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC1})^fg(${FG1}) ${AP1} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC2})^fg(${FG1}) ${AP2} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC3})^fg(${FG1}) ${AP3} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC4})^fg(${FG1}) ${AP4} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC5})^fg(${FG1}) ${AP5} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${SMI})^fg(${FG1}) ${SM1} ^pa(192)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^ro(${DC6})^ib(1)^pa(2)favourites")\
| (dzen2 -y "$pY" -x "$pX" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 7 -tw 200 -ta l -w 200 -m -p -e 'onstart=uncollapse;button1=menuexec;leaveslave=exit;button3=exit')
