#!/bin/sh

homedir=(".bash_profile" ".bashrc" ".fonts.conf" ".gitconfig" ".sane" ".vimrc" ".xinitrc")
configdir=("gtk-3.0" "gtk-4.0" "lf" "neofetch")


mkdir $HOME/.config

for dir in ${homedir[@]}; do
    ln -sf $HOME/.dotfiles/$dir $HOME/
done

for file in ${configdir[@]}; do
    ln -sf $HOME/.dotfiles/.config/$file $HOME/.config/
done


mkdir $HOME/.monitorconfig
ln -sf $HOME/.dotfiles/.montiorconfig/disconnect_monitor.sh $HOME/.monitorconfig
ln -sf $HOME/.dotfiles/.montiorconfig/connect_monitor.sh $HOME/.monitorconfig
ln -sf $HOME/.dotfiles/.vim/autoload $HOME/.vim
ln -sf $HOME/.dotfiles/Code/settings.json $HOME/.config/Code/User
