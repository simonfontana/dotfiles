# Unix
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias bc='bc -l'
alias diff='colordiff'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grepc='grep --color=always'
alias h=history
alias hg='history|grep'
alias less='less --RAW-CONTROL-CHARS'
alias ls='ls --color=auto -F'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ll -a'
alias now='date +"%T"'
alias nowtime='now'
alias nowdate='date +"%Y-%m-%d"'
alias history='history 0'

# Docker
alias d=docker

# Helm
alias h=helm

# Kubectl
alias ku='kubectl config use-context'
alias k=kubectl

# LVIM is VIM
alias vi='lvim'
alias vim='lvim'
alias e='lvim'
alias truevim='/usr/bin/vim'

# Other
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
