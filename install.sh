#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo " $0 <full/lite>"
    exit 1
fi

case "$1" in
full)
    vimrc_uri="https://github.com/jm33-m0/vim_dotfiles/raw/master/vimrc"
    curl 'https://github.com/jm33-m0/vim_dotfiles/raw/master/.tmux.conf' -o ~/.tmux.conf
    if ! command -v tmux; then
        echo " tmux not found, please install it"
    fi
    cp -r ./sh ~
    echo " tmux config has been installed"
    ;;
lite)
    vimrc_uri="https://github.com/jm33-m0/vim_dotfiles/raw/master/_vimrc"
    ;;
*)
    echo " $0 <full/lite>"
    exit 1
    ;;
esac

vimplug_uri="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs $vimplug_uri
curl -fLo ~/.vimrc $vimrc_uri

echo " vim-plug has been installed, please :PlugInstall to install other plugins"
