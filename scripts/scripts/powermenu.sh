#!/bin/bash

# Define power options
options="Logout\nRestart\nShutdown"

# Display the menu and store the selection
selected=$(echo -e $options | wofi --show dmenu --width 100 --height 100 --lines 5)

# Take action based on selection
case $selected in
    Logout)
        # Command to logout. This will depend on your session manager. 
        # For example, for sway, use `swaymsg exit`
        ;;
    Restart)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
