# Keep the rest of zsh's config in ~/.config/zsh
export ZDOTDIR=~/.config/zsh
# zsh has already picked this file as its .zshenv, so read the real one
source $ZDOTDIR/.zshenv
