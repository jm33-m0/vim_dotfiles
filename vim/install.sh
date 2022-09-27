#!/bin/bash

command -v 'vim' || {
    echo 'You need to install vim first'
    exit 1
}

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o /tmp/installer.sh
sh /tmp/installer.sh ~/.dein && rm -f /tmp/installer.sh

# install init.vim
cp -av ../nvim/init.vim ~/.vimrc
echo "open nvim and it will automatically install for you"
