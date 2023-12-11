#!/bin/zsh

[[ $- != *i* ]] && return


PROMPT='%B%F{green}%1~%f > %b'

HISTFILE=$ZDOTDIR/histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
autoload -Uz compinit
compinit
unsetopt PROMPT_SP

stty stop undef

function add_file(){
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

add_file "alias"
add_file "variables"
add_file "plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
add_file "plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

zle-line-init() {
    zle -K viins
    echo -ne "\e[3 q"
}
zle -N zle-line-init

lfShow() {
    lf <$TTY
    zle redisplay
}
zle -N lfShow
bindkey '^[1' lfShow

nvimShow() {
    nvim . <$TTY
    zle redisplay
}
zle -N nvimShow
bindkey '^[2' nvimShow

htopShow() {
    htop <$TTY
    zle redisplay
}
zle -N htopShow
bindkey '^[3' htopShow

ncmpcppShow() {
    ncmpcpp --quiet<$TTY
    zle redisplay
}
zle -N ncmpcppShow
bindkey '^[4' ncmpcppShow

echo -ne '\e[3 q'
preexec() { echo -ne '\e[3 q' ;}

function clear-screen-and-scrollback() {
    echoti civis >"$TTY"
    printf '%b' '\e[H\e[2J' >"$TTY"
    zle .reset-prompt
    zle -R
    printf '%b' '\e[3J' >"$TTY"
    echoti cnorm >"$TTY"
}

zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland &> $HOME/.cache/current_session

export XINITRC=$HOME/.config/x/xinitrc
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx $XINITRC
