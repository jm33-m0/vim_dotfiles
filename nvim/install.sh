#!/bin/bash

command -v 'nvim' || {
    echo 'You need to install neovim first'
    exit 1
}

# python binding
command -v python3 && python3 -m pip install neovim python-language-server pyright pylint yapf autopep8 --user
command -v python2 && python2 -m pip install neovim python-language-server pylint yapf autopep8 --user

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh >installer.sh
sh ./installer.sh ~/.dein

# install dependencies
command -v apt && {
    echo -e "\n\napt detected, trying to install dependencies"
    sudo apt install ripgrep fzf -y            # required
    sudo apt install nodejs npm                # nodejs, required by many plugins
    sudo apt install golang gopls              # golang
    sudo apt install clang clangd clang-format # c
    sudo apt install shellcheck                # bash
}
command -v npm && sudo npm install -g yarn
command -v snap && {
    sudo snap install shfmt
}
command -v go && {
    go install mvdan.cc/sh/v3/cmd/shfmt@latest || echo "shfmt failed to install, figure it out yourself"
}

# install init.vim
[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
cp -av ./init.vim ~/.config/nvim
echo "open nvim and it will automatically install for you"
