# file: $HOME/etc/dotfiles/.zshrc
# Ctrl+a: go to the beginning of line, Ctrl+e: go to the end of line
# Ctrl+u: delete the whole line, Ctrl+k: delete text to the end of line
# Ctrl+r: search zsh history

typeset -U path  # to avoid duplicates in PATH
path=(
  $HOME/.local/bin
  /usr/local/bin
  $path  # add existing PATH at the end
)
export PATH
#
export PATH="$HOME/bin:$PATH"
#
setopt IGNOREEOF # avoid logout with Ctrl+D
export LANG=en_US.UTF-8 # use English
# export LANG=ja_JP.UTF-8 # use Japanese
setopt share_history # share history with other terminal

# Basic operation improvements
#setopt CORRECT_ALL          # correct typos in commands and arguments
setopt NO_CASE_GLOB         # case insensitive globbing
setopt NUMERIC_GLOB_SORT    # sort numeric filenames numerically
setopt auto_pushd           # automatically pushd when cd'ing to a directory
autoload -U compinit        # Complement: Ctrl-i: complete (same as Tab), Ctrl-d: list possible matches
setopt INTERACTIVE_COMMENTS # allow comments in interactive mode
export HISTFILE=${HOME}/etc/dotfiles/.zsh_history # zsh history config
export HISTSIZE=1000        # Commands kept in memory during the session
export SAVEHIST=10000       # Commands saved to the file, and restored when you open a new terminal
setopt EXTENDED_HISTORY     # Save timestamp and duration of commands in the history file
setopt hist_ignore_all_dups # ignore all duplicates in the history
setopt pushd_ignore_dups    # ignore duplicates in the pushd history

# Prompt
autoload colors
colors
PROMPT="%{${fg[blue]}%}%~%{${reset_color}%} %# "
# RPROMPT="[%W ]" 

# Text editor
alias vi='vim'
export EDITOR=code

# Auto load aliases and environment variables from ~/.zsh_aliases
ZSH_ALIAS_FILE="$HOME/.zsh_aliases"
if [ -f "$ZSH_ALIAS_FILE" ]; then
  source "$ZSH_ALIAS_FILE"
  echo "[OK] aliases loaded $ZSH_ALIAS_FILE"
else
  echo "[INFO] Alias file not found: $ZSH_ALIAS_FILE"
fi

# edit .zshrc and restart shell
alias ez='cd ~/etc/dotfiles;vic ~/etc/dotfiles/.zshrc;source ~/.zshrc' # main zshrc
alias ea='vic ~/etc/dotfiles/.zsh_aliases;source ~/.zshrc' # alias and environment variables
alias rl='exec $SHELL -l' # restart shell without restarting the terminal

# vi + git auto-commit helper
function vic() {
  if [ -z "$1" ]; then
    echo "Usage: vic <filename>"
    return 1
  fi
  vim "$1" && git add "$1" && git commit -m "$1 $(date '+%Y-%m-%d %H:%M:%S') && git push"
}

# add alias from history
function real() {
  if [ "$#" -ne 2 ]; then
    echo "register alias: e.g., $ real la ls -al"
    return 1
  fi
  local alias_name="$1"
  local alias_command_body="$2"
#  echo "$alias_name"
#  echo "$alias_command_body"

  local alias_define="alias $alias_name=\"$alias_command_body\""
#  echo "$alias_define"

  echo "$alias_define" >> ~/.zsh_aliases
  echo "Alias '$alias_name' registered as: $alias_command_body"
  echo "-----"
  tail -n 1 ~/.zsh_aliases
}
