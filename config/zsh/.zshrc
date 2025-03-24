#!/bin/zsh

[[ $- != *i* ]] && return

source <(fzf --zsh)

function add_file() {
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

add_file "alias"
add_file "variables"
add_file "keymaps"

setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt auto_cd
setopt chase_links

stty stop undef

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland > /dev/null
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx > /dev/null
