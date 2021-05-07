source .zsh/history.zsh
source .zsh/prompt.zsh
source .zsh/autocomplete.zsh
source .zsh/vi.zsh
source .zsh/keybindings.zsh

# NVIM is VIM
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable autojump
source /usr/share/autojump/autojump.sh

# recirsive search
bindkey '^R' history-incremental-search-backward

source .zsh/aliases

# Load zsh-syntax-highlighting; should be last.
source /home/simon/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
