# dzen2 config with info piped from conkys and usage of rofi
# currently configured for 1366x768 resolution;
# to be edited in respective scripts / binaries to suit location
# Dependencies:
1.Conky
2.Rofi
3.Curl
4.xdotool,xrandr & wmctrl
5.inxi
6.trayer [if installed; optional for top/bottom right placement] "trayer-br / trayer-tr" executable is configured for bottom/top,automatically shifts position w.r.t dzen2 location 
7. Font Awesome 6 Free; Nerd Fonts [ to display iconic fonts; RobotoMono Nerd Fonts;UbuntuMono Nerd Fonts; FuraCode Nerd Font, RobotoMono Nerd Fonts, Opendyslexic Nerd Fonts used.. FYI ] & a bitmap font i love so much from here : https://addy-dclxvi.github.io/post/bitmap-fonts/
and nerd fonts from here=> https://www.nerdfonts.com/font-downloads
8.Openweather script to pipe weather on bar [included in bin]
	forecast uses info from wttr.in, edit dzenbar file for your location
9.supportive executable and shell scripts
10. dunst [optional if you like notifiers in regular intervals]
11. xorg-transset [ for dzen bar transparency ]


# download zip
1. move contents from "bin" folder to your local executable path [i have configured all executables in $HOME/.bin; can save time if you too follow this folder for executable; last but not least, dont forget to export PATH
JUST SELECT THE 'y=..." LINE BY COMMENTING OUT THE OTHER FOR top/bottom BAR CHOICE]
2. If you dont have openweathermap id, do get one fro openweathermap.org;then edit the openweather script to enter credentials there [self explanatory in the script]
3. Move all contents from the conkys folder to $HOME/.conky/
4. bar is configured for bottom bar; if you need top bar, open the dzenbar file; edit by commenting out the current y anduncomment the top bar option

rofi + lemonbar is available as simplepanel thats structured modular by @kainonergon => https://github.com/kainonergon/simplepanel
i have been a great admirer cum user of this simplepanel and i felt i can learn from @kainonergon's scriptsto configure a dzenbar piping info with conky andusing rofi for popups

finally after all ~/.bin/ files been made executable and openweather configured script; simple run dzenbar!
optional fo transparency: presuming xorg-transset is installed; open terminal and type "transset 0.7 &" without quotes; the cursor changes to  "+" sign. just take it on the required bar to be transparent and click.... viola, you have transperency on dzen.

COMMON ISSUES:
IF ROFI WINDOW[ that follows pointer co-ordinates] may vary, feel free to juggle around the pX and pY part of respective config file

Depending on your distribution; inxi output may differ or display wrongly; simple edit 'dzensysinfo.sh' to suit your distribution
Home / Root device nomes [sdXY; X is a/b/c etc; Y is 1,2,3 etc]

for non EMWH compliant window managers like dwm or XMonad; window list and workspaces will be an issue. workspaces in those cases defaults to one,two,three etc. and active window listwill not function

rofi theme used is my configurtion of colors. thebar rofi popup will use the default rofi theme of yourinstallation.

xorg-transset will need to be installed to obtain transparency in dzen2. it can be installed at will and transparency attained using it from your terminal.

Font Color / Foreground Color can be edited to suit your choice in the respective Conky Config

ICONICFONT LOGOS FOR SOME DISTRIBUTIONS
current is for Manjaro... Choose your option/choice from here => https://github.com/lukas-w/font-logos OR any of the iconic font

i dont think this will work in wayland. i have not tested it nor the config is compatible for non X11.
 
Hope you like this setup. Feel free to upgrade and update...
dont forget to "fav" or "like" this !

execute this with 'dzenbar'

Cheers !
