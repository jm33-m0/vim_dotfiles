#!/bin/bash

command -v 'nvim' || {
    echo 'You need to install neovim first'
    exit 1
}

# install init.vim
[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
cp -av ./init.vim ~/.config/nvim
echo "open nvim and it will automatically install for you"
