#!/usr/bin/env bash
poweroff_str="Poweroff"
reboot_str="Reboot"
logout_str="Logout"
lock_str="Lock"
options="${poweroff_str}\n${reboot_str}\n${logout_str}\n${lock_str}"
selected_option=$(echo -e "$options" | rofi -dmenu -p "Power" -theme applets/powermenu)
case "$selected_option" in
    "$poweroff_str")
        poweroff
        ;;
    "$reboot_str")
        reboot
        ;;
    "$logout_str")
        # I saw you are on Hyprland, 'bspc quit' won't work.
        # Use this instead:
        hyprctl dispatch exit
        ;;
    "$lock_str")
        betterlockscreen --lock dim > /dev/null 2>&1
        ;;
esac
# case "$1" in
#     "poweroff")
#         poweroff # Assuming 'poweroff' is an executable command
#         ;;
#     "reboot")
#         reboot   # Assuming 'reboot' is an executable command
#         ;;
#     "logout")
#         bspc quit
#         ;;
#     "lock")
#         betterlockscreen --lock dim > /dev/null 2>&1
#         exit 0
#         ;;
#     *)
#         # Default case: Print the options
#         echo -e "${poweroff_str}\n${reboot_str}\n${logout_str}\n${lock_str}"
#         ;;
# esac
