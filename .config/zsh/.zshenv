# Read by every zsh, including the login shell SDDM uses to start the
# desktop session, so GUI apps get this environment too

typeset -U path # no duplicates
path=(~/.local/bin $path /usr/local/go/bin ~/go/bin ~/.cargo/bin ~/.lmstudio/bin)

export EDITOR=nvim
