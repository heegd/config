# If not running interactively, don't do anything
[[ $- != *i* ]] && return

LANG=en_US.UTF-8
LC_ALL="en_US.UTF-8"

alias ls='ls --color=auto'

# eval "$(oh-my-posh init bash --config ~/.config/oh_my_posh_theme.omb.json)"
eval "$(starship init bash)"
