#!/bin/sh


#yay -S cava musikcube

currentPath="$(pwd)"
for dir in aconfmgr alacritty autostart BetterDiscord btop cava doom emacs dunst gtk-2.0 gtk-3.0 gtk-4.0 hypr i3 kitty Kvantum mako neofetch nvim OpenRGB paru polybar qt5ct qt6ct ranger rofi swappy swaylock waybar wlogout xfce
do
    rm -rf ~/.config/$dir
    ln -s "$currentPath"/.config/$dir ~/.config/$dir
done

for item in .p10k.zsh .zshrc .gitconfig .fonts .swt .themes
do
    rm -rf ~/$item
    ln -s "$currentPath"/$item ~/$item
done

rm -rf ~/.wallpapers
mkdir ~/.wallpapers
ln -s "$currentPath"/wallpapers/* ~/.wallpapers
