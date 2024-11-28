set -o vi
bind -m vi-insert "\C-l":clear-screen
export CLICOLOR=1
alias ls='ls -G'
alias la='ls -Ga'
alias ll='ls -Galh'

alias cls="clear; printf '\033[3J'"
alias ts='tailscale'
