# file: $HOME/etc/dotfiles/.zshrc
# dotfiles - how to link .dotfiles to home directory, see $HOME/etc/dotfiles/install.sh
# ctrl+a: go to the begeinning of line, ctrl+e: go to the end of line
# ctrl+u: delete the whole line, ctrl+k: delete text to the end of line
# ctrl-r: search zsh history

typeset -U path  # 重複を禁止
path=(
  $HOME/.local/bin
  /usr/local/bin
  $path  # 既存PATHを最後
)
export PATH
#
export PATH="$HOME/bin:$PATH"
#
setopt IGNOREEOF # avoid logout with Ctrl+D
export LANG=en_US.UTF-8 # export LANG=ja_JP.UTF-8 # use Japanese
setopt share_history # share history with other terminal

# Basic operation improvements
setopt CORRECT_ALL          # correct typos in commands and arguments
setopt NO_CASE_GLOB         # case insensitive globbing
setopt NUMERIC_GLOB_SORT    # sort numeric filenames numerically
setopt auto_pushd           # automatically pushd when cd'ing to a directory
autoload -U compinit        # Complement: Ctrl-i: complete (same as Tab), Ctrl-d: list possible matches
setopt INTERACTIVE_COMMENTS # allow comments in interactive mode
export HISTFILE=${HOME}/etc/.zsh_history # zsh history config
export HISTSIZE=1000        # Commands kept in memory during the session
export SAVEHIST=10000       # Commands saved to the file, and restored when you open a new terminal
setopt EXTENDED_HISTORY     # Save timestamp and duration of commands in the history file
setopt hist_ignore_all_dups # ignore all duplicates in the history
setopt pushd_ignore_dups    # ignore duplicates in the pushd history
# zshrc edit and restart shell
alias ez='pushd ~/etc/dotfiles;vic ~/etc/dotfiles/.zshrc;source ~/.zshrc;popd' # main zshrc
alias ea='vic ~/etc/dotfiles/.zsh_aliases;source ~/.zshrc' # alias and environment variables
alias rl='exec $SHELL -l' # restart shell without restarting the terminal
# Prompt
autoload colors
colors
#RPROMPT="[%W ]" 
PROMPT="%{${fg[blue]}%}%~%{${reset_color}%} %# "
# Text editor
export EDITOR=code
alias vi='vim'
# Auto load aliases and environment variables from ~/.zsh_aliases
ZSH_ALIAS_FILE="$HOME/.zsh_aliases"
if [ -f "$ZSH_ALIAS_FILE" ]; then
  source "$ZSH_ALIAS_FILE"
  echo "[OK] Aliases loaded"
else
  echo "[INFO] Alias file not found: $ZSH_ALIAS_FILE"
fi


# vi + git auto-commit helper
function vic() {
  if [ -z "$1" ]; then
    echo "Usage: vic <filename>"
    return 1
  fi
  vim "$1" && git add "$1" && git commit -m "auto: $1 $(date '+%Y-%m-%d %H:%M:%S')"
}

# VS code
function codec() {
  if [ -z "$1" ]; then
    echo "Usage: code <filename>"
    return 1
  fi
  code "$1" && git add "$1" && git commit -m "auto: $1 $(date '+%Y-%m-%d %H:%M:%S')"
}


