# customised bar using den2 with conky & rofi
* tested in bspwm; dwm; herbstluftwm; i3; openbox & freebsd [multiple bars OR panel]
* tested to be perfectlyworking with dwl [dwm for wayland]; [conky syntax to be modified as ber conky script for dwl]
* [PREVIEW](https://github.com/rvcgit/dzen2bar/blob/main/preview.png)
* [PREVIEW ANIMATED GIF](https://github.com/rvcgit/dzen2bar/blob/main/preview.gif)
* bar location and length auto set w.r.t your screen [uses xrandr]
* edit in respective scripts / binaries to suit location
* UPDATED with 2 options :
* [1] dzenbar executes 4 seperate dzen2 instance [seperate bars]
* [2] dzen2panel executes a single dzen2 instance
# Dependencies:
* dzen2 [ if your distro doent provide; find it [HERE](https://github.com/minos-org/dzen2.git) ]
* Conky
* Rofi [ if your distro doesnt provide; you can find it [ HERE ](https://github.com/davatorium/rofi) ]
* Curl
* xdotool,xrandr & wmctrl
* inxi [refer the dzensysinfo details and edit with your required syntax for inxi as your distro provides]
* trayer [optional if needed; for top/bottom right placement whichis auto to execute respective scripts]
* Font Awesome 6 Free; Nerd Fonts [ link provided below ] & a bitmap font i love so much from [HERE](https://addy-dclxvi.github.io/post/bitmap-fonts/) for the dzen sysinfo and calendar popup
and nerd fonts from [HERE](https://www.nerdfonts.com/font-downloads)
* Openweather script to pipe weather on bar [included in bin]; edit with your credentials
local-weather [included in bin];forecast uses info from wttr.in, edit dzenbar file for your location
* supportive executable and shell scripts
* dunst [optional if you like notifiers in regular intervals]
* xorg-transset [ optional for dzen bar transparency ]
* added mpd playlist window popup in the fav menu. for those who use mpd
# clone repo OR download & extract zip
* move contents of "bin" folder to $HOME/.bin folder; make all files executable; give sym link to dzenbar in your PATH [$HOME/.local/bin OR $HOME/bin OR /usr/local/bin]
* PATH=$HOME/.bin:$PATH && export PATH [ do this if $HOME/.bin is not in your $PATH ]
* move contents of the "conkys" folder to $HOME/.conky/
* check and edit openweather & local-weather scripts for location settings
* check dzensysinfo.sh to edit device path in the script [sdXY]
* edit dzen2rofifavmenu to set your fav programs
* WORKSPACES are configured upto 5; FYI
* ACTIVE WORKSPACE / WINDOWLIST popup will not show in non EWMH WM like xmonad; though clickable shift will be possible
* for clickable workspace; i have used xdotool key Super+{1/2/3/4/5}; edit if its different for you

* Edit  "dzenbar" ; "dzen2panel" ; "openweather" & "local-weather" scriptswith your CREDENTIALS
* After moving all scripts intp the $HOME/.bin [local executable PATH]; choose either dzenbar OR dzen2panel to run the status bar
* optional fo transparency: presuming xorg-transset is installed; open terminal and type "transset 0.7 &" without quotes; the cursor changes to  "+" sign. just take it on the required bar to be transparent and click.... viola, you have transperency on dzen.

* COMMON ISSUES:
IF ROFI WINDOW[ that follows pointer co-ordinates] may vary, feel free to juggle around the pX and pY part of respective config file

Edit your dzenbar OR dzen2panel to make trayer dock OR undock

Depending on your distribution; inxi output may differ or display wrongly; simple edit 'dzensysinfo.sh' to suit your distribution
Home / Root device nomes [sdXY; X is a/b/c etc; Y is 1,2,3 etc]

rofi + lemonbar is available as simplepanel thats structured modular by @kainonergon's [simplepanel](https://github.com/kainonergon/simplepanel); honestly, this lemonbar inspired me to explore into dzen2 to pipe similar info and integrate rofi. full credit to @kainonergon ! hope someday thesimplepanel will becoe the default lemonpanelfor some windowmanager !
i have been a great admirer cum user of this simplepanel and i felt i can learn from @kainonergon's scriptsto configure a dzenbar piping info with conky andusing rofi for popups

rofi theme used is my configurtion of colors. rofi menus will use the default rofi theme of your installation.

Font Color / Foreground Color can be edited to suit your choice in the respective Conky Config

ICONICFONT LOGOS FOR SOME DISTRIBUTIONS
Choose your option/choice from [HERE](https://github.com/lukas-w/font-logos)

i dont think this will work in wayland. i have not tested it nor the config is compatible for non X11 as of now.
 
Hope you like this setup. Feel free to upgrade and fork/update...

execute this bar with 'dzenbar' OR 'dzen2panel' as you may like.

* To use with i3wm: edit config file; comment out all info related to i3status etc... add this "i3bar_command PATH/TO/dzenbar OR dzen2panel"
* openbox/bspwm provides config to allocate dock padding so "dzenbar OR dzen2bar" can be added in the autostart file if respective bspwmrc or rc.xml is edited to suit
* For dwm and xmonad, xtitle; workspaces active show etc will not function coz i have used tools that are EMWH compliant and i have not added config for non-ewmh windowmanagers
* Works fine with freeBSD too; obviously with some edits to be freebsd specific syntax [i have tried with fluxbox and its working flawlessly]
* added mpd control buttons in the bar [ left and right click controls added ]
* an animated gif added as preview.
* for use with wlroots [dwl] the rofi related scripts need to be configured with numbers;
* dynamic mousepointer location is not possible as on date in wayland

CHEERS !
