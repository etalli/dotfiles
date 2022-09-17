# Rev.0.08
# file: /Users/k/etc/dotfiles/.zshrc
#
# dotfiles - how to link .dotfiles to home directory.
# example,  ln -nfs /Users/k/etc/dotfiles/.zshrc /Users/k/.zshrc #
#
# zsh history, ctrl-r for search historyy
# ctrl+a: go to the begeinning of line
# ctrl+e: go to the end of line
# ctrl+u: delete the whole line
# ctrl+k: delete text to the end of line

# avoid logot with Ctrl+D
#setopt IGNOREEOF
# Use Japanese
#export LANG=ja_JP.UTF-8
# aadd local path
export PATH="$HOME/bin:$PATH"
# Share history with other terminal
setopt share_history
# do not display history overlaps
setopt histignorealldups
#
export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store
function h-all { history -E 1}
# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd
# 自動でpushdを実行
setopt auto_pushd
# pushdから重複を削除
setopt pushd_ignore_dups
# コマンドミスを修正
#setopt correct
#
# Complement: Tab, Ctrl-i, Ctrl-d
autoload -U compinit
compinit
#
# prompt
autoload colors
colors
#PROMPT='[%T %~] % '
PROMPT="%{${fg[green]}%}%n:%{${reset_color}%} %~ %# "
#
# gfortran
# add  the stdlib to your $LIBRARY_PAT to avoid this error: "ld: library not found for -lSystem"
export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
#
alias h='fc -lt '%F %T' 1'
alias l='ls -ltr --color=auto'
alias ls='ls -aF'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lst='ls -ltr --color=auto'
alias cdd='cd desktop'
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias back='pushd'
alias diff='diff -U1'
# Global Alias
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
#
#
export EDITOR=code
#export EDITOR=vim
#
# Pangaea 1.1 with QMK latest Aug 29. 0.18.1
#alias pCD='cd $HOME/src/1004/qmk_firmware'## rev.2 and rev.3
#QMK_HOME='/Users/k/src/0502/qmk_firmware' ## rev 0417, May2, 2022
#QMK_HOME='/Users/k/src/0518/qmk_firmware' ## rev 1.1 wit QMK 0.16.9
QMK_HOME='/Users/k/src/0829/qmk_firmware'
#QMK_HOME='/Users/k/src/0915/qmk_firmware'
PANGAEA_HOME='/Users/k/src/0829/qmk_firmware/keyboards/pangaea/'
alias cdq='cd $QMK_HOME'
alias pcd="cd  $QMK_HOME/keyboards/pangaea"
alias pcdd="cd $QMK_HOME/keyboards/pangaea/keymaps/default/"
alias pe="$EDITOR   $QMK_HOME/keyboards/pangaea/keymaps/default/keymap.c"
alias pev="vi  $QMK_HOME/keyboards/pangaea/keymaps/default/keymap.c"
alias per="vi $QMK_HOME/keyboards/pangaea/rules.mk"
alias perr="vi $QMK_HOME/keyboards/pangaea/keymaps/default/rules.mk"
alias pec="vi  $QMK_HOME/keyboards/pangaea/config.h"
alias pei="vi  $QMK_HOME/keyboards/pangaea/info.json"
alias pem="vi  $QMK_HOME/keyboards/pangaea/matrix.c"
alias pecc="vi  $QMK_HOME/keyboards/pangaea/keymaps/default/config.h"
alias pep="vi  $QMK_HOME/keyboards/pangaea/keymaps/default/p.h"
alias pc='cd $QMK_HOME;/usr/bin/time qmk compile -kb pangaea -km default'
alias pf='cd $QMK_HOME;qmk flash -kb pangaea -km default'
# Archives pangaea project, but excludes .git directory, then copy the file to src for backup.
alias pzip='pcd;cd ../;zip -r pangaea.zip pangaea -x \*/.git/\* pangaea/keymaps/default/p.h;mv pangaea.zip $HOME/src/;echo "check src"'
alias ptar='pcd;cd ../;tar --exclude pangaea/.git -zcvf `date +%Y%m%d-%H%M-pangaea`.tar.gz $PANGAEA_HOME;mv *.tar.gz ~/src/backup'
alias tt='touch my_text-`date "+%Y-%m-%d__%H:%M:%S"`.txt;ls *.txt'
####
## kasumigasane 4x4 Macropad without diode by e3w2q
#alias kasumic='cd /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default '
#alias kasumie='vi /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
#alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
alias kasumic='cd /Users/k/src/0812/qmk_firmware/keyboards/kasumigasane/keymaps/default '
alias kasumie='vi /Users/k/src/0812/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
alias kasumib='kasumicd;qmk compile -kb kasumigasane -km default'
alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
###
#### my4pad my4pad with RP2040, it works fine [Aug 3,2022]
#MY4PAD_HOME='/Users/k/src/0812/qmk_firmware/keyboards/my4pad/' # Aug, 2022, 0812 version.
MY4PAD_HOME='/Users/k/src/0829/qmk_firmware/keyboards/my4pad/'
alias my4padcd='cd $MY4PAD_HOME/'
alias my4pade='vi $MY4PAD_HOME/keymaps/default/keymap.c'
alias my4padc='my4padcd;qmk compile -kb my4pad -km default;cd ../../'
alias my4padp='my4padcd;qmk flash -kb my4pad -km default;cd ../../'
####
# 2x2 by k2.
alias 2e='vi /Users/k/src/1004/qmk_firmware/keyboards/2x2/keymaps/default/keymap.c'
alias 2cd='cd /Users/k/src/1004/qmk_firmware/'
alias 2f='2cd;qmk flash -kb 2x2 -km default'
###
# a_dux // March 2022, obsolete.
alias axhome='cd /Users/k/src/0325/qmk_firmware'
alias axcd='cd /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default'
alias axe='vi /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default/keymap.c'
alias axf='aduxcd;make a_dux:default:avrdude-split-left'
alias axfr='aduxcd;make a_dux:default:avrdude-split-right'
###
# edit zshrc
alias ez='pushd;vim ~/.zshrc;source ~/.zshrc;bdot;popd'
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias rz='source ~/.zshrc'
# misc
alias gitclonep='git clone ssh://github.com/etalli/keyboard.git'
alias glqmk='git clone https://github.com/qmk/qmk_firmware.git'
alias cd128='cd ~/Dropbox/MyProjects/128_myKBD'
alias finder='open'
alias here='open .'
# git alias commands
alias grv='git remote -v'
alias gr='git remote'
alias grso='git remote show origin'
alias gp='git push'
alias gcm='git commit -m'
alias gcmn='git commit -m "now"'
alias ga='git add .'
alias bbb='git add $1'
alias bbb1='git commit -m "default" $1'
alias bbb2='git push;web https://github.com/etalli/SmallKey/blob/main/README.md'
alias gitls="alias | grep git"
alias gc="git checkout"
alias gcd="git checkout develop"
alias gpd="git push origin develop"
alias gpm="git push origin master"
alias grm="git rm --cached"
alias gdn="git diff --name-only"
alias grh="git reset --hard HEAD^"
## dotfiles backup
alias bdot='cd /Users/k/etc/dotfiles;git add .;git commit -m "ok" .zshrc;git push'
alias bdot2='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles'
alias bdot3='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles/blob/main/.zshrc'
alias bdoti='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles/blob/main/install.sh'
## web sites
alias www='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1'
alias github='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/'
alias gmail='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome gmail.com/'
alias d='du -h -d=1'
#
function mkcd(){mkdir -p $1 && cd $1}
#
source /Users/k/zsh_plugin/zaw/zaw.zsh
#
alias upd='git add images/*;git commit -m logic 00README.md images/* ;gp;sk'

#git remote add origon git@githubm.com:etalli/git-app.git
#
eval "$(pyenv init -)"

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
# <<< conda initialize <<<
#
#
# how to remove (base) on prompt
# conda deactivate
# conda config --set auto_activate_base False
