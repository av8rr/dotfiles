#!/usr/bin/sh

# Set the standard directories for our ZSH config
export CONFDIR="$HOME/.config"
export ZDOTDIR="$CONFDIR/sh"
export ZRESDIR="$ZDOTDIR/res"

# Let's set the compositor and wallpapers
# source ~/.config/sh/.zprofile

# Set the default apps
export EDITOR="emacsclient"
export TERMINAL="kitty"
export BROWSER="brave"
export FILE="nnn"

# Set the path
export PATH=$HOME/tools:$PATH

# Set key bindings at the base level
# This has been moved to start-bspwm
# xmodmap ~/.Xmodmap

# This line sets the SSH Keys authorization socket file
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# NNN File Manager Settings
export NNN_PLUG='j:autojump;p:preview-tabbed'
export NNN_FIFO=/tmp/nnn.fifo
