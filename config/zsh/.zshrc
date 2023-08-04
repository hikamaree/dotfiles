#!/bin/zsh

[[ $- != *i* ]] && return

HISTFILE=$ZDOTDIR/histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

stty stop undef

alias ls='ls --color=auto'
alias ll='ls -al --group-directories-first'
alias lf='lfrun'
alias grep='grep --color=auto'
alias wgcc='x86_64-w64-mingw32-gcc'
alias wmake='x86_64-w64-mingw32-make'
alias makedwm='rm -rf config.h; sudo make clean install'

export HISTFILE="$ZDOTDIR/zsh_history"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export WINEPREFIX=$HOME/.local/wine
export OPENER="xdg-open"
export XINITRC=$HOME/.config/x/xinitrc
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

function add_file(){
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

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
