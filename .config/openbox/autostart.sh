# setting the wallpaper
nitrogen --restore

# panel
#~/bin/bmpanel arch &

# gnome settings
#gnome-settings-daemon &
#gnome-power-manager &

# shadows
#`sleep 1 && ~/bin/shadows.sh` &

# applications
stalonetray &
#~/bin/trayapp.sh

# conky section
~/bin/clock.sh
tint &
conky &
volwheel &
#glipper-old &
thunar --daemon &

# setting keyboard and mouse preferences
xset r rate 250 30
xset m 1.5 4

~/bin/shadows.sh

# applications
#nm-applet &


