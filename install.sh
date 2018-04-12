#!/bin/bash

vimrc_uri="https://github.com/jm33-m0/vim_dotfiles/raw/master/_vimrc"
vimplug_uri="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs $vimplug_uri
curl -fLo ~/.vimrc $vimrc_uri

echo "vim-plug has been installed, please :PlugInstall to install other plugins"
