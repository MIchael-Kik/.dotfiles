#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset 
fi

#### SYSTEM REQUIREMENTS CONFIGS ###
# Setting resolutions
xrandr --setprovideroutputsource modesetting NVIDIA-0 
xrandr --auto

# Compositor
picom -f &
### END ###

### Customizations for DWM ###
# For dwm info bar
~/WindowManagerConfig/dwm-bar/dwm_bar.sh &

# Background random slideshow for User michaelkik
oxygen /Pictures 300 2 &

# Keyring daemon for minecraft launcher
gnome-keyring-daemon -r -d &
### END ###

# Setting mouse speed
xinput --set-prop 14 'libinput Accel Speed' -0.9
xinput --set-prop 13 'libinput Accel Speed' -0.9

# Execute DWM
exec dwm 
