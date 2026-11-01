# Options
setopt autocd               # type a folder name to cd into it
setopt interactive_comments # allow comments on the command line
setopt no_auto_remove_slash # keep the slash after a completed folder
setopt no_flow_control      # free Ctrl+S and Ctrl+Q

# History
HISTFILE=~/.local/state/zsh/history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt share_history        # save each command at once and read other shells' commands
setopt extended_history     # save a timestamp with each command
setopt hist_ignore_dups     # skip a command that repeats the one before
setopt hist_ignore_space    # skip a command that starts with a space
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}

# vi mode
bindkey -v
KEYTIMEOUT=1

# Block cursor in normal mode, beam cursor otherwise
cursor_beam() { printf '\e[5 q' }
zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]]; then
        printf '\e[1 q'
    else
        cursor_beam
    fi
}
zle -N zle-keymap-select
zle -N zle-line-init cursor_beam
autoload -Uz add-zsh-hook
add-zsh-hook preexec cursor_beam

# vim text objects, such as ci" and da(
autoload -Uz select-bracketed select-quoted
zle -N select-bracketed
zle -N select-quoted
for keymap in viopp visual; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $keymap $c select-bracketed
    done
    for c in {a,i}{\',\",\`}; do
        bindkey -M $keymap $c select-quoted
    done
done

# vim surround, such as cs"' and ds(
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# Words stop at / . - and other punctuation, as in bash
autoload -Uz select-word-style
select-word-style bash

# Keys
for keymap in viins vicmd; do
    bindkey -M $keymap '^A' beginning-of-line
    bindkey -M $keymap '^E' end-of-line
    bindkey -M $keymap '^U' backward-kill-line
    bindkey -M $keymap '^K' kill-line
    bindkey -M $keymap '^[[1;5D' backward-word                     # Ctrl+Left
    bindkey -M $keymap '^[[1;5C' forward-word                      # Ctrl+Right
    bindkey -M $keymap '^[[A' history-beginning-search-backward    # Up
    bindkey -M $keymap '^[[B' history-beginning-search-forward     # Down
    bindkey -M $keymap '^[j' history-beginning-search-backward     # Alt+J
    bindkey -M $keymap '^[k' history-beginning-search-forward      # Alt+K
done
bindkey -M viins '^?' backward-delete-char # Backspace past where insert mode started
bindkey -M viins '^H' backward-kill-word   # Ctrl+Backspace
bindkey -M viins '^[[3;5~' kill-word       # Ctrl+Delete
bindkey -M viins '^Q' push-input           # set the line aside for one command

# Ctrl+X Ctrl+E edits the line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M viins '^X^E' edit-command-line
bindkey -M vicmd '^X^E' edit-command-line

# Completion: Tab opens a menu
zmodload zsh/complist
autoload -Uz compinit
[[ -d ~/.cache/zsh ]] || mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # lowercase also matches uppercase
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}    # colours as in ls
zstyle ':completion:*' group-name ''                     # group by kind, with headings
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' special-dirs true                 # complete the / after ..
bindkey -M menuselect h vi-backward-char
bindkey -M menuselect j vi-down-line-or-history
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char
bindkey -M menuselect '^[[Z' reverse-menu-complete      # Shift+Tab

# fzf: Ctrl+R searches history, Ctrl+T inserts a path, Alt+C changes folder
source <(fzf --zsh)
