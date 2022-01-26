#!/bin/bash

command -v 'nvim' || {
    echo 'You need to install neovim first'
    exit 1
}

# python binding
(command -v python3 && ! python3 -m pip list | grep pynvim) && {
    python3 -m pip install neovim python-language-server pyright pylint yapf autopep8 --user
}
(command -v python2 && ! python2 -m pip list | grep pynvim) && {
    python2 -m pip install neovim python-language-server pylint yapf autopep8 --user
}

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o /tmp/installer.sh
sh /tmp/installer.sh ~/.dein && rm -f /tmp/installer.sh

# install dependencies
command -v apt && {
    echo -e "\n\napt detected, trying to install dependencies"
    sudo apt install ripgrep fzf -y            # required
    sudo apt install golang gopls              # golang
    sudo apt install clang clangd clang-format # c
    sudo apt install shellcheck                # bash
    sudo apt install snapd                     # snap
}

command -v snap && {
    echo -e "\n\nsnap detected, trying to install more utilities"
    sudo snap install shfmt
    sudo snap install node --classic
    sudo snap install lazygit
}

# install nodejs via apt if snap is unavailable
(command -v snap && ! command -v node) && {
    echo -e "\n\nnodejs not found, trying to install from apt"
    sudo apt install nodejs npm
}

# nodejs related packages
test_ro=/usr/local/bin/nvim-test
(command -v npm && sudo touch "$test_ro") && {
    echo -e "\n\nnodejs found, trying to install required modules"
    sudo npm install -g js-beautify
    sudo npm install -g yarn
    [[ -f "$test_ro" ]] && sudo rm -f "$test_ro"
}

(command -v go && ! command -v shfmt) && {
    echo -e "\n\ninstalling shfmt via go get"
    go install mvdan.cc/sh/v3/cmd/shfmt@latest || echo "shfmt failed to install, figure it out yourself"
}

# install init.vim
[[ -d ~/.config/nvim ]] || mkdir -p ~/.config/nvim
cp -av ./init.vim ~/.config/nvim
echo "open nvim and it will automatically install for you"
