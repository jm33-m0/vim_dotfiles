#!/bin/bash

command -v 'nvim' || {
    echo 'You need to install neovim first'
    exit 1
}

# python binding
python -m pip install neovim python-language-server pyright pylint yapf autopep8 --user
python2 -m pip install neovim python-language-server pylint yapf autopep8 --user

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh >installer.sh
sh ./installer.sh ~/.dein

# install init.vim
[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
cp -av ./init.vim ~/.config/nvim
echo -e "\n\nRemember to add required config to ~/.config/nvim/init.vim\n
and then ':call dein#install()'"
