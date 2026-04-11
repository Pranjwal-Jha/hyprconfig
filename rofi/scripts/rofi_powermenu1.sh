#!/usr/bin/env bash
poweroff_str="Poweroff"
reboot_str="Reboot"
logout_str="Logout"
lock_str="Lock"
options="${poweroff_str}\n${reboot_str}\n${logout_str}\n${lock_str}"
selected_option=$(echo -e "$options" | rofi -dmenu -p "Power" -theme applets/powermenu)
case "$selected_option" in
    "$poweroff_str")
        systemctl poweroff
        ;;
    "$reboot_str")
        systemctl reboot
        ;;
    "$logout_str")
        hyprctl dispatch exit
        ;;
    "$lock_str")
        betterlockscreen --lock dim > /dev/null 2>&1
        ;;
esac

