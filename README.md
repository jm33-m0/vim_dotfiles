# vim_dotfiles
my vim config files

## important

- please use [powerline-fonts](https://github.com/powerline/fonts) for special characters rendering
- make sure you have read the `vimrc` code before installing it, 'coz there're some dependencies that you have to be aware of
- **Read vimrc before using**, you need to be familiar with my keybindings
- works fine for Windows and Linux (should do on Mac too, but haven't tested)

## language specific

### python

#### PY2/3

- `python -m pip install autopep8 pylint --user`
- make sure you install for both python2 and python3
- and rename the python2 version under `~/.local/bin` to `OriginalName_2`, check `_vimrc` for details
- `:PY2` / `:PY3` helps you switch between python2 and python3

#### virtualenv

- `call Use_Py('/path/to/python')` to switch to a custom python interpreter for YCM
- run `virtualenv .venv` under project root, ALE will choose your python automatically (dont forget to run `/path/to/python -m pip install pylint` too

- for YCM

A common practice when working on a Python project is to install its dependencies in a virtual environment and develop the project inside that environment. To support this, YCM needs to know the interpreter path of the virtual environment. You can specify it by creating a .ycm_extra_conf.py file at the root of your project with the following contents:

```
def Settings( **kwargs ):
  return {
    'interpreter_path': '/path/to/virtual/environment/python'
  }
```

where /path/to/virtual/environment/python is the path to the Python used by the virtual environment you are working in. Typically, the executable can be found in the Scripts folder of the virtual environment directory on Windows and in the bin folder on other platforms.

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
