#!/bin/bash
WAYBAR_DIR="$HOME/.config/waybar"

# Check which theme is currently active by looking at the first line
if grep -q "Dark Paper" "$WAYBAR_DIR/mocha.css"; then
    # Switch to light mode
    cp "$WAYBAR_DIR/eink-light.css" "$WAYBAR_DIR/mocha.css"
else
    # Switch to dark mode
    cp "$WAYBAR_DIR/eink-dark.css" "$WAYBAR_DIR/mocha.css"
fi

# Reload waybar
killall -SIGUSR2 waybar
