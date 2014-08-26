#!/bin/bash
#Simplest options
xrandr --auto --output VGA1 --same-as LVDS1
#xrandr --output VGA1 --mode 1280x1024 --same-as LVDS1
#xrandr --output VGA1 --off

#Forcing new resolution
#cvt 1280 1024
#xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
#xrandr --addmode VGA1 1280x1024_60.00
#xrandr --output VGA --mode 1280x1024_60.00
