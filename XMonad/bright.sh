#!/bin/bash

yet=`cat /sys/class/backlight/intel_backlight/brightness`
max=`cat /sys/class/backlight/intel_backlight/max_brightness`

bl_up() {
    if [ $yet -lt $max ]; then
        let new=$yet+1
        sudo sh -c "echo $new > /sys/class/backlight/intel_backlight/brightness"
    else
        echo "brightness maximal"
    fi
}

bl_down() {
    if [ $yet -gt 0 ]; then
        let new=$yet-1
        sudo sh -c "echo $new > /sys/class/backlight/intel_backlight/brightness"
    else
        echo "brightness minimal"
    fi
}


bl_lolo() {
    let new=$(($max / 8)) 
    sudo sh -c "echo $new > /sys/class/backlight/intel_backlight/brightness"
}

bl_lo() {
    let new=$(($max / 5)) 
    sudo sh -c "echo $new > /sys/class/backlight/intel_backlight/brightness"
}

bl_med() {
    let new=$(($max / 2)) 
    sudo sh -c "echo $new > /sys/class/backlight/intel_backlight/brightness"
}

bl_hi() {
    sudo sh -c "echo $max > /sys/class/backlight/intel_backlight/brightness"
}


case "$1" in
    'u')
        bl_up
        ;;
    'd')
        bl_down
        ;;
    'l')
        bl_lo
        ;;
    'll')
        bl_lolo
        ;;
    'm')
        bl_med
        ;;
    'h')
        bl_hi
        ;;
    'z')
        echo "actual $yet to $max"
        ;;
    *)
        echo "bright.sh u (up) | d (down) | l (lo) | h (hi) | m (med) | z (actual)"
esac
