# PATH
PATH="$HOME/bin:$HOME/.local/bin:/snap/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/games"
export PATH

# npm install without root
# ------------------------
export NPM_PACKAGES="${HOME}/.npm-packages"
# in ~/.npmrc
# prefix=${HOME}/.npm-packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export MANPATH

# ENV
# ---
vim=vim
if command -v nvim>/dev/null; then
    vim=nvim
fi
export VISUAL="$vim"
export EDITOR="$vim"
export SUDO_EDITOR="$vim"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# KDE environment
if [ "$XDG_SESSION_DESKTOP" = "plasma" ]; then
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export SDL_IM_MODULE=fcitx
    export SSH_AUTH_SOCK=/tmp/ssh-agent.socket
fi

# wayland for firefox/thunderbird
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export SDL_VIDEODRIVER=wayland
    export QT_QPA_PLATFORM=wayland
fi

# GPG
# ---
GPG_TTY="$(tty)"
export GPG_TTY
