setopt interactive_comments
unset zle_bracketed_paste
setopt no_auto_remove_slash

fpath=( "$HOME/.zfunctions" $fpath )
source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/autocomplete.zsh
source ~/.zsh/vi.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh
source ~/.secure/credentials.zsh

# LVIM is installed in this directory
PATH=.local/bin:$PATH

# LVIM is VIM
export VISUAL=lvim
export EDITOR="$VISUAL"

# Enable autojump
source /usr/share/autojump/autojump.sh

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on

export XDG_CONFIG_HOME=~/.config

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
