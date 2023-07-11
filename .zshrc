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

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Go envs
export GO111MODULE=on
export GOPATH=~/go
export GOMODCACHE=~/go/pkg/mod

export KUBECONFIG=~/.kube/config

export XDG_CONFIG_HOME=~/.config

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Android Studio
export PATH=/home/simon/Android/Sdk/platform-tools:/home/simon/Android/Sdk/tools:/home/simon/Android/Sdk/tools/bin:/home/simon/android-studio/bin:$PATH

# Cargo
export PATH=~/.cargo/bin:$PATH

# Notes
export NOTES_CLI_HOME=~/notes
export NOTES_CLI_EDITOR=~/.local/bin/lvim
