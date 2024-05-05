#!/bin/bash

# Define the path to the Rofi theme file
rofi_theme_file="$HOME/.config/rofi/config.rasi"
rofi_power_theme="$HOME/.config/rofi/powermenu.rasi"
# Ensure the wallpaper storage directory exists

# Use sed to replace the background-image path within the inputbar section of the .rasi file
sed -i "/inputbar {/,/}/ s|url(\"[^\"]*\", width)|url(\"$1\", width)|" "$rofi_theme_file"
sed -i "/inputbar {/,/}/ s|url(\"[^\"]*\", width)|url(\"$1\", width)|" "$rofi_power_theme"

swww img --transition-type wipe --transition-angle 30 --transition-step 200 $1
wal -i $1 -n
# waybar -rs

swaync-client -rs
mkdir -p "$HOME/.current_wallpaper"
# Copy the new wallpaper to the specified location and rename it
# cp "$1" "$HOME/.current_wallpaper/currentwallpaper.png"
convert $1 /$HOME/.current_wallpaper/currentwallpaper.png
convert $HOME/.current_wallpaper/currentwallpaper.png -scale 10% -blur 0x4 -resize 1000% $HOME/.current_wallpaper/currentwallpaperblurred.png
# convert $HOME/.current_wallpaper/currentwallpaper.png -resize 1920x1080^ -gravity center -extent 1920x1080 -blur 0x4 $HOME/.currentwallpaper/currentwallpaperblurred.png
# convert $HOME/.current_wallpaper/currentwallpaper.png -scale 20% -blur 0x2 -resize 200% $HOME/.current_wallpaper/currentwallpaperblurred.png

