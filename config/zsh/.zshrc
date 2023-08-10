#!/bin/zsh

[[ $- != *i* ]] && return

HISTFILE=$ZDOTDIR/histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

stty stop undef

function add_file(){
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

add_file "alias"
add_file "variables"
add_file "plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
add_file "plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

PROMPT='%B%F{green}%1~%f > %b'

zle-line-init() {
    zle -K viins
    echo -ne "\e[3 q"
}

zle -N zle-line-init

echo -ne '\e[3 q'
preexec() { echo -ne '\e[3 q' ;}

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx "$XINITRC"
