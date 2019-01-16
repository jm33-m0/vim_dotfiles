# vim_dotfiles
my vim config files

## important

- please use [powerline-fonts](https://github.com/powerline/fonts) for special characters rendering
- make sure you have read the `vimrc` code before installing it, 'coz there're some dependencies that you have to be aware of
- **Read vimrc before using**, you need to be familiar with my keybindings
- works fine for Windows and Linux (should do on Mac too, but haven't tested)

## language specific

### python

- `python -m pip install autopep8 pylint --user`
- make sure you install for both python2 and python3
- and rename the python2 version under `~/.local/bin` to `OriginalName_2`, check `_vimrc` for details
- `:PY2` / `:PY3` helps you switch between python2 and python3

### c/cpp

- use `:YcmGenerateConfig` in your project, to enable autocompletion and other features provided by YCM (requires `Makefile`), check [YCM's doc](https://valloric.github.io/YouCompleteMe/#c-family-semantic-completion) for details
- when browsing code of a large project such as linux kernel, use [cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html) for navigation
- cscope can be installed via `apt install cscope`, you can read it doc [here](http://cscope.sourceforge.net/cscope_maps.vim)

## features

- IDE-like dev environ for Python, Go, etc.
- switch between python2 and python3 with one command (`PY2` / `PY3`)
- installs plugins automatically using [vim-plug](https://github.com/junegunn/vim-plug)
- must-have plugins to satisfy your daily needs
- customizable keyboard shortcuts

![screenshot](./img/screenshot.png)
![screenshot](./img/screenshot.jpg)
