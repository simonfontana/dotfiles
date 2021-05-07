# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

# New history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY
