# Use lf to switch directories and bind it to ctrl-p
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^p' 'lfcd\n'

# Toggle git show with ctrl-g
function toggle_git_show {
    if [[ "$SPACESHIP_GIT_SHOW" = true ]]; then
        export SPACESHIP_GIT_SHOW=false
    else
        export SPACESHIP_GIT_SHOW=true
    fi
}
bindkey -s '^g' "toggle_git_show\n"

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# some keybinding that I'm used to
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^a' beginning-of-line
bindkey -M vicmd '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M vicmd '^e' end-of-line
bindkey -M vicmd '^u' backward-kill-line
bindkey -M viins '^u' backward-kill-line
bindkey -M vicmd '^k' kill-line
bindkey -M viins '^k' kill-line
bindkey -M viins '^[[1;5D' backward-word        # left arrow
bindkey -M vicmd '^[[1;5D' backward-word        # left arrow
bindkey -M viins '^[[1;5C' forward-word         # right arrow
bindkey -M vicmd '^[[1;5C' forward-word         # right arrow
bindkey -M viins '^H' backward-delete-word      # ctrl-backspace (gnome-terminal is bugged: https://stackoverflow.com/questions/2715537/how-do-i-get-ctrl-backspace-to-delete-a-word-in-vim-within-gnome-terminal)
bindkey -M viins "\e[3;5~" delete-word          # ctrl+del

# Disable software flow control (https://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal) 
# and use ctrl-q for push-input
stty -ixon
bindkey '^Q' push-input

# ctr-l to accept suggestion, ctrl-j to execut
bindkey '^l' autosuggest-accept
bindkey '^j' autosuggest-execute
# alt-j to search history on the current text backward, alt-k forward
bindkey '^[j' history-beginning-search-backward
bindkey '^[k' history-beginning-search-forward
