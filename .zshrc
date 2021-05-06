# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# history length
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

bindkey -v

source <(kubectl completion zsh)
source <(helm completion zsh)

docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

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
alias vi='nvim'
alias vim='nvim'
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
