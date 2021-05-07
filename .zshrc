source .zsh/prompt.zsh
source .zsh/autocomplete.zsh
source .zsh/history.zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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


docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

function play_satisfactory()
{
    sudo ifconfig wlan0 down
    sudo ifconfig docker0 down
    sudo ifconfig br-a2fe5f48a75b down
}

function unplay_satisfactory()
{
    sudo ifconfig wlan0 up
    sudo ifconfig docker0 up
    sudo ifconfig br-a2fe5f48a75b up
}

# NVIM is VIM
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable autojump
source /usr/share/autojump/autojump.sh

# ex - archive extractor
# usage: ex <file>
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# recirsive search
bindkey '^R' history-incremental-search-backward

source .zsh/aliases

# Load zsh-syntax-highlighting; should be last.
source /home/simon/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
