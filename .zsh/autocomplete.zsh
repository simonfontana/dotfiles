# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# _comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' special-dirs true

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(k3d completion zsh)
source ~/git/adp/bob/bob-completion.sh
