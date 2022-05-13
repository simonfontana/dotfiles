# Reverse complete with CTRL+Shift+z
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Use bash-style when moving between words
autoload -U select-word-style
select-word-style bash

# Allow comments in zsh.
setopt interactive_comments

# Disable bracketed paste so the that pasting a newline at the end actually runs the command.
unset zle_bracketed_paste

# Don't remove slash at the end of directory
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
