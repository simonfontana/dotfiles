source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/autocomplete.zsh
source ~/.zsh/vi.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

# LVIM is VIM
export VISUAL=lvim
export EDITOR="$VISUAL"

# Enable autojump
source /usr/share/autojump/autojump.sh

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
