#!/usr/bin/sh

export EDITOR="emacsclient"
export TERMINAL="kitty"
export BROWSER="firefox"
export FILE="nnn"

export CONFDIR="$HOME/.config"

export ZDOTDIR="$CONFDIR/sh"
export ZRESDIR="$ZDOTDIR/res"

export NNN_PLUG='j:autojump;p:preview-tabbed'
export NNN_FIFO=/tmp/nnn.fifo

export PATH=$HOME/.local/bin:$HOME/tools:$PATH

xmodmap ~/.Xmodmap

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
