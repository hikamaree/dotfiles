#!/bin/zsh

[[ $- != *i* ]] && return

source <(fzf --zsh)

autoload -U compinit; compinit

function add_file() {
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

add_plugin() {
  local repo_path=$1
  local base_dir="$HOME/.local/share/zsh"
  local plugin_dir="$base_dir/${repo_path##*/}"

  [[ -f "$plugin_dir/${repo_path##*/}.plugin.zsh" ]] || {
    mkdir -p "$base_dir"
    git clone "https://github.com/$repo_path" "$plugin_dir"
  }

  source "$plugin_dir/${repo_path##*/}.plugin.zsh"
}

add_file "alias"
add_file "variables"
add_file "keymaps"

add_plugin "Aloxaf/fzf-tab"
zstyle ':fzf-tab:*' use-fzf-default-opts yes

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt AUTO_CD
setopt CHASE_LINKS

stty stop undef

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland > /dev/null
[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx > /dev/null
