#!/bin/zsh

[[ $- != *i* ]] && return

function add_file(){
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function add_plugin() {
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
		add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
		add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
	else
		git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
	fi
}

add_file "alias"
add_file "variables"
add_file "keymaps"
add_plugin "zsh-users/zsh-autosuggestions"
add_plugin "zsh-users/zsh-syntax-highlighting"

setopt appendhistory
stty stop undef

source <(fzf --zsh)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland > /dev/null
