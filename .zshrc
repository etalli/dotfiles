# file: $HOME/etc/dotfiles/.zshrc
#
# dotfiles - how to link .dotfiles to home directory.
# See $HOME/etc/dotfiles/install.sh
#
# ctrl+a: go to the begeinning of line, ctrl+e: go to the end of line
# ctrl+u: delete the whole line, ctrl+k: delete text to the end of line
# ctrl-r: search zsh history

setopt IGNOREEOF # avoid logout with Ctrl+D
export LANG=en_US.UTF-8 # export LANG=ja_JP.UTF-8 # use Japanese
export PATH="$HOME/bin:$PATH" # add local path
setopt share_history # share history with other terminal

# Basic operation improvements
setopt AUTO_CD              # cd without typing cd
setopt CORRECT              # correct typos in commands
setopt CORRECT_ALL          # correct typos in all arguments
setopt NO_CASE_GLOB         # case insensitive globbing
setopt NUMERIC_GLOB_SORT    # sort numeric filenames numerically
setopt EXTENDED_GLOB        # enable extended globbing patterns
setopt INTERACTIVE_COMMENTS # allow comments in interactive mode
# zsh history config
export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
function h-all { history -E 1}
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_all_dups
autoload -U compinit # Complement: Tab, Ctrl-i, Ctrl-d

# prompt
autoload colors
colors
RPROMPT="[%W ]" #PROMPT="%{${fg[green]}%}%n:%{${reset_color}%} %~ %# "

# alias file
ZSH_ALIAS_FILE="$HOME/.zsh_aliases"
if [ -f "$ZSH_ALIAS_FILE" ]; then
  echo "Your alias file is $ZSH_ALIAS_FILE"
  # Count current aliases before loading
  ALIAS_COUNT_BEFORE=$(alias | wc -l)
  source "$ZSH_ALIAS_FILE"
  # Count current aliases after loading
  ALIAS_COUNT_AFTER=$(alias | wc -l)
  ALIASES_LOADED=$((ALIAS_COUNT_AFTER - ALIAS_COUNT_BEFORE))
  echo "[OK] $ALIASES_LOADED aliases loaded from $ZSH_ALIAS_FILE"
else
  echo "[INFO] alias file not found: $ZSH_ALIAS_FILE"
  echo "# create it by → touch $ZSH_ALIAS_FILE or use install.sh"
fi

# text editor
export EDITOR=code
alias vi='vim'

## zshrc
alias ez='vim ~/.zshrc;source ~/.zshrc'
alias ea='vim ~/.zsh_aliases;source ~/.zshrc'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/k/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/k/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/k/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/k/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

### rust
export PATH="HOME/bin:$PATH"
export PATH="HOME/.cargo/bin/:$PATH"
alias cf='cargo fmt --check --verbose'
alias cb='cargo build'
alias cc='cargo clippy'

# restart shell without restating the terminal
alias relogin='exec $SHELL -l'
alias rss='echo "restarting shell.";exec $SHELL -l'
#
###  MyProjects short cuts
export DROPBOX='/Users/k2/Dropbox'  # Dropbox path
alias tt='cd ~/src/1216/qmk_firmware/'
#
export PICO_SDK_PATH='/Users/k/Library/CloudStorage/Dropbox/MyProjects/191_Wireless_KBD_Dongle/pico-sdk'
alias bledongle='cp picow_ble_hid_keyboard.uf2 /Volumes/RPI-RP2'
alias GIT_REMOVE='git filter-branch --force --index-filter git rm --cached --ignore-unmatch RileToRemove.md -- --all'
#
alias ze='source ~/zephyrproject/.venv/bin/activate'
export TODAY=`date +%m%d`  # today's date
#
# QMKs
alias sinfo='find ./ -name 'info.json' | xargs grep'  # search info.json
alias mikke='(){find ./ -type f -print | xargs grep $1 | less}'
# web browser
alias ff='./mach run >& /dev/null '  # run mach 
#
export PATH="(brew --prefix python)/libexec/bin:$PATH"
#
alias bldenv='python3 -m venv venv'
alias enenv='source venv/bin/activate'

# Added by Windsurf
export PATH="/Users/k2/.codeium/windsurf/bin:$PATH"

# Created by `pipx` on 2025-05-10 23:04:35
export PATH="$PATH:/Users/k2/.local/bin"
#
alias refresh_script='cp -f *.py *.png /Users/k2/Documents/KiCad/9.0/scripting/plugins'

# 数字でDropbox/MyProjects内のdirectoryに移動する
# ex. $ pj 229   →~/Dropbox/MyProjects/229xxx に移動
pj() {
    local base="$HOME/Dropbox/MyProjects"   # Dropboxのパス
    local match=(${base}/${1}*)             # 前方一致検索（配列）
    printf '  %s\n' $match
    if (( ${#match[@]} == 0 )); then
        echo "No match for: $1"
        return 1
    elif (( ${#match[@]} > 1 )); then
        echo "Multiple matches:"
        printf '  %s\n' $match
        return 1
    fi

    local histfile="$HOME/.pj_history"      # 履歴ファイル
    # 履歴に追加
    echo "$match[1]" >> "$histfile"

    cd "$match[1]" || echo "Cannot cd into $match[1]"
}

# ~/.pj_history から移動先を選んでジャンプ
pjh() {
    local histfile="$HOME/.pj_history"

    # 履歴ファイルがなければ終了
    [[ -f "$histfile" ]] || {
        echo "No history found: $histfile"
        return 1
    }
    echo "History file found: $histfile"
    # fzfで選択
    local dir
    dir=$(tac "$histfile" | fzf --prompt="Select directory> " --height=40% --reverse)
    # キャンセル時は何もしない
    [[ -n "$dir" ]] || return 1

    # ディレクトリ移動
    cd "$dir" || {
        echo "Cannot cd into $dir"
        return 1
    }
}
#
alias python=/opt/homebrew/bin/python3

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/k2/.lmstudio/bin"
# End of LM Studio CLI section

# Sony Spresense SDK
export PATH="/Users/k2/spresenseenv/usr/bin:$PATH"

# Arduino-cli
#export PATH="$PATH:/Users/k2/Applications/arduino-cli_1.3.1_macOS_ARM64"
export PATH="$PATH:$HOME/Applications/arduino-cli_1.3.1_macOS_ARM64"
