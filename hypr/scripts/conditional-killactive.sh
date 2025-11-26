#!/bin/bash

active_class=$(hyprctl activewindow -j | jq -r '.class')

if [[ "$active_class" == "org.gnome.Nautilus" ]]; then
    hyprctl dispatch togglespecialworkspace nautilus
else
    hyprctl dispatch killactive
fi
