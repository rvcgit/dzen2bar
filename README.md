# customised bar using den2 with conky & rofi
* [PREVIEW](https://github.com/rvcgit/dzen2bar/blob/main/preview.png)
* bar location and length auto set w.r.t your screen [uses xrandr]
* edit in respective scripts / binaries to suit location
* UPDATED with 2 options :
* [1] dzenbar executes 3 seperate dzen2 instance with trayer in dock mode
* [2] dzen2panel executes a single dzen2 instance which is docked [trayer is un-docked]
# Dependencies:
* dzen2 [ if your distro doent provide; find it [HERE](https://github.com/minos-org/dzen2.git) ]
* Conky
* Rofi
* Curl
* xdotool,xrandr & wmctrl
* inxi [refer the dzensysinfo details and edit with your required syntax for inxi as your distro provides]
* trayer [optional if needed; for top/bottom right placement whichis auto to execute respective scripts]
* Font Awesome 6 Free; Nerd Fonts [ to display iconic fonts; RobotoMono Nerd Fonts;UbuntuMono Nerd Fonts; FuraCode Nerd Font, RobotoMono Nerd Fonts, Opendyslexic Nerd Fonts used.. FYI ] & a bitmap font i love so much from [HERE](https://addy-dclxvi.github.io/post/bitmap-fonts/)
and nerd fonts from [HERE](https://www.nerdfonts.com/font-downloads)
* Openweather script to pipe weather on bar [included in bin]
local-weather [included in bin];forecast uses info from wttr.in, edit dzenbar file for your location
* supportive executable and shell scripts
* dunst [optional if you like notifiers in regular intervals]
* xorg-transset [ optional for dzen bar transparency ]
* added mpd playlist window popup in the fav menu. for those who use mpd
# clone repo OR download & extract zip
* move contents of "bin" folder to $HOME/.bin folder; make all files executable; give sym link to dzenbar in your PATH [$HOME/.local/bin OR $HOME/bin OR /usr/local/bin]
* PATH=$HOME/.bin:$PATH && export PATH [run this to set PATH with $HOME/.bin
* move contents of the "conkys" folder to $HOME/.conky/
* check and edit openweather & local-weather scripts for location settings
* check dzensysinfo.sh to edit device path in the script [sdXY]
* edit dzen2rofifavmenu to set your fav programs
* WORKSPACES are configured upto 5; FYI
* ACTIVE WORKSPACE / WINDOWLIST popup will not show in non EWMH WM like dwm / xmonad; though clickable shift will be possible
* for clickable workspace; i have used xdotoo key Super+{1/2/3/4/5}; edit if its different for you

* finally after all ~/.bin/ files been made executable and openweather configured script; simple run dzenbar!
optional fo transparency: presuming xorg-transset is installed; open terminal and type "transset 0.7 &" without quotes; the cursor changes to  "+" sign. just take it on the required bar to be transparent and click.... viola, you have transperency on dzen.

* COMMON ISSUES:
IF ROFI WINDOW[ that follows pointer co-ordinates] may vary, feel free to juggle around the pX and pY part of respective config file

i have deliberately not configured dzen2 as dock here; i use 3 different bars so i made trayer as dock so the bars can be acoomodated within that doc space and windows dont overlap ! just for info so those not using trayer may find the windows overlap.

Depending on your distribution; inxi output may differ or display wrongly; simple edit 'dzensysinfo.sh' to suit your distribution
Home / Root device nomes [sdXY; X is a/b/c etc; Y is 1,2,3 etc]

rofi + lemonbar is available as simplepanel thats structured modular by @kainonergon's [simplepanel](https://github.com/kainonergon/simplepanel); honestly, this lemonbar inspired me to explore into dzen2 to pipe similar info and integrate rofi. full credit to @kainonergon ! hope someday thesimplepanel will becoe the default lemonpanelfor some windowmanager !
i have been a great admirer cum user of this simplepanel and i felt i can learn from @kainonergon's scriptsto configure a dzenbar piping info with conky andusing rofi for popups

rofi theme used is my configurtion of colors. rofi menus will use the default rofi theme of your installation.

Font Color / Foreground Color can be edited to suit your choice in the respective Conky Config

ICONICFONT LOGOS FOR SOME DISTRIBUTIONS
current is for Manjaro... Choose your option/choice from [HERE](https://github.com/lukas-w/font-logos)

i dont think this will work in wayland. i have not tested it nor the config is compatible for non X11 as of now.
 
Hope you like this setup. Feel free to upgrade and fork/update...

execute this bar with 'dzenbar' OR 'dzen2panel' as you may like.

Cheers !
