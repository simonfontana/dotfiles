source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/autocomplete.zsh
source ~/.zsh/vi.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

# NVIM is VIM
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable autojump
source /usr/share/autojump/autojump.sh

# recirsive search
bindkey '^R' history-incremental-search-backward

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
