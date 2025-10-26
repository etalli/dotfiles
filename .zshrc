# file: $HOME/etc/dotfiles/.zshrc
# dotfiles - how to link .dotfiles to home directory, see $HOME/etc/dotfiles/install.sh
# ctrl+a: go to the begeinning of line, ctrl+e: go to the end of line
# ctrl+u: delete the whole line, ctrl+k: delete text to the end of line
# ctrl-r: search zsh history
setopt IGNOREEOF # avoid logout with Ctrl+D
export LANG=en_US.UTF-8 # export LANG=ja_JP.UTF-8 # use Japanese
export PATH="$HOME/bin:$PATH" # add local path
setopt share_history # share history with other terminal
# Basic operation improvements
setopt CORRECT              # correct typos in commands
setopt CORRECT_ALL          # correct typos in all arguments
setopt NO_CASE_GLOB         # case insensitive globbing
setopt NUMERIC_GLOB_SORT    # sort numeric filenames numerically
setopt EXTENDED_GLOB        # enable extended globbing patterns
setopt INTERACTIVE_COMMENTS # allow comments in interactive mode
export HISTFILE=${HOME}/etc/.zsh_history # zsh history config
export HISTSIZE=1000        # Commands kept in memory during the session
export SAVEHIST=10000       # Commands saved to the history file, Saved across sessions and restored when you open a new terminal
setopt EXTENDED_HISTORY     # Save timestamp and duration of commands in the history file
function h-all { history -E 1} # show all history with timestamp and duration
setopt auto_pushd           # automatically pushd when cd'ing to a directory
setopt pushd_ignore_dups    # ignore duplicates in the pushd history
setopt hist_ignore_dups     # ignore duplication command history list
setopt hist_ignore_all_dups # ignore all duplicates in the history
autoload -U compinit        # Complement: Tab, Ctrl-i, Ctrl-d
## zshrc edit and restart shell
alias ez='vim ~/.zshrc;source ~/.zshrc' # main zshrc
alias ea='vim ~/.zsh_aliases;source ~/.zshrc' # alias and environment variables
alias relogin='exec $SHELL -l' # restart shell without restarting the terminal
# Prompt
autoload colors
colors
RPROMPT="[%W ]" #PROMPT="%{${fg[green]}%}%n:%{${reset_color}%} %~ %# "
# Text editor
export EDITOR=code
alias vi='vim'
# Auto load aliases and environment variables from ~/.zsh_aliases
ZSH_ALIAS_FILE="$HOME/.zsh_aliases"
if [ -f "$ZSH_ALIAS_FILE" ]; then
  echo "[INFO] Your alias file is $ZSH_ALIAS_FILE"
  source "$ZSH_ALIAS_FILE"
  echo "[OK] Aliases loaded from $ZSH_ALIAS_FILE"
else
  echo "[INFO] Alias file not found: $ZSH_ALIAS_FILE"
  echo "# Create it by → touch $ZSH_ALIAS_FILE"
fi