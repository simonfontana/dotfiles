# Read by every zsh, including the login shell greetd starts the desktop
# session with (/etc/greetd/environments), so GUI apps get this environment too

typeset -U path # no duplicates
path=(~/.local/bin $path /usr/local/go/bin ~/go/bin ~/.cargo/bin ~/.lmstudio/bin)

export EDITOR=nvim
