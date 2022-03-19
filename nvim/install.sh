#!/bin/bash

command -v 'nvim' || {
    echo 'You need to install neovim first'
    exit 1
}

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o /tmp/installer.sh
sh /tmp/installer.sh ~/.dein && rm -f /tmp/installer.sh

# install init.vim
[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
cp -av ./init.vim ~/.config/nvim
echo "open nvim and it will automatically install for you"
