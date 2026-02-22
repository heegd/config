# If not running interactively, don't do anything
[[ $- != *i* ]] && return

LANG=en_US.UTF-8
LC_ALL="en_US.UTF-8"

alias ls='ls --color=auto'

export PATH="$PATH:$HOME/.gitcommands"

eval "$(starship init bash)"

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
