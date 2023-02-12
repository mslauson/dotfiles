#!/bin/sh
for dir in aconfmgr alacritty autostart BetterDiscord btop cava gtk-2.0 gtk-3.0 gtk-4.0 hypr kitty Kvantum mako neofetch nvim OpenRGB paru qt5ct qt6ct ranger rofi swappy swaylock waybar wlogout
do
    rm -rf ~/.config/$dir
    ln -s ./.config/$dir ~/.config/$dir
done