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
bindkey -M viins '^[[1;5D' backward-word        # left arrow
bindkey -M vicmd '^[[1;5D' backward-word        # left arrow
bindkey -M viins '^[[1;5C' forward-word         # right arrow
bindkey -M vicmd '^[[1;5C' forward-word         # right arrow
bindkey -M viins '^H' backward-delete-word      # ctrl-backspace (gnome-terminal is bugged: https://stackoverflow.com/questions/2715537/how-do-i-get-ctrl-backspace-to-delete-a-word-in-vim-within-gnome-terminal)
