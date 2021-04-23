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
 unset f
fi

# choose WM/DE
echo -en "\nSelect display option:\n \n1) BSPWM\n \n2) GNOME\n \nSelection: "
read -r
choice=$REPLY

case "$choice" in
	'1')
		# mouse preferences
		xinput set-prop 8 299 -0.6 &
		# monitor-related
		wal -R &
		~/.config/feh/.fehbg &
		redshift -P -O 4200 &
		#picom --experimental-backends &
		picom &
		mons --primary DP-2 -e left &
		exec bspwm
	;;
	'2')
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session
	;;
	'*')
		echo "Invalid option. Indicate choice with number for display option."
	;;
esac
