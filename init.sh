#!/bin/sh
currentPath="`pwd`"
for dir in aconfmgr alacritty autostart BetterDiscord btop cava gtk-2.0 gtk-3.0 gtk-4.0 hypr kitty Kvantum mako neofetch nvim OpenRGB paru qt5ct qt6ct ranger rofi swappy swaylock waybar wlogout
do
    rm -rf ~/.config/$dir
    ln -s $currentPath/.config/$dir ~/.config/$dir
done

for file in .p10k.zsh .zshrc .gitconfig
do
    rm -rf ~/$file
    ln -s $currentPath/$file ~/$file
done