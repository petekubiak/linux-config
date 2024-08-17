# Activating natural scrolling
Open `/usr/share/X11/xorg.conf.d/40-libinput.conf`
Find the following:
```
  Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
  EndSection
```
Add the following line within this section: `Option "NaturalScrolling" "True"`
