# Rev.0.07
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

# To avoid logot with Ctrl+D
#setopt IGNOREEOF
# Use Japanese
#export LANG=ja_JP.UTF-8
# To add local path
export PATH="$HOME/bin:$PATH"
# Share history with other terminal
setopt share_history
# do not display history overlaps
setopt histignorealldups
alias h='fc -lt '%F %T' 1'
export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store
function h-all { history -E 1}
#
# Complement: Tab, Ctrl-i, Ctrl-d
autoload -U compinit
compinit
#
# prompt
autoload colors
colors
PROMPT='[%W %T %d] % '
#
# gfortran
# add  the stdlib to your $LIBRARY_PAT to avoid this error: "ld: library not found for -lSystem"
export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
#
alias ls='ls -aF'
alias ll='ls -l'
alias cdd='cd desktop'
#
# OBSOLETE
# Pangaea rev.2, and rev.3
#alias pCD='cd $HOME/src/1004/qmk_firmware'
#alias pe="vi +46 /Users/k/src/1004/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
#alias pc='pCD;make pangaea:default'
#alias pcr3='pCD;make pangaea:rev3'
#alias pf='pCD;qmk flash -kb pangaea -km default'
#
# Pangaea v1.1(rev.0417, May 2,2022)
#alias pC11='cd $HOME/src/0502/qmk_firmware;pwd'
#alias pe11="vi /Users/k/src/0502/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
#alias per11="vi /Users/k/src/0502/qmk_firmware/keyboards/pangaea/keymaps/default/rules.mk"
#alias pCD11="cd /Users/k/src/0502/qmk_firmware/keyboards/pangaea"
#alias pep11="vi /Users/k/src/0502/qmk_firmware/keyboards/pangaea/keymaps/default/p.h"
#alias pc11='pC11;qmk compile -kb pangaea -km default'
#alias pf11='alias pf11;echo "   ";pC11;qmk flash -kb pangaea -km default'
#
# Pangaea v1.1. with QMK latest 0.16.9
#alias pC1='cd $HOME/src/0518/qmk_firmware;pwd'
#alias pe="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
#alias pw="wc -l /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
#alias per="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/rules.mk"
#alias perr="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/rules.mk"
#alias pcd="cd /Users/k/src/0518/qmk_firmware/keyboards/pangaea"
#alias pep="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/p.h"
#alias pc='pC1;qmk compile -kb pangaea -km default'
#alias pf='pC1;qmk flash -kb pangaea -km default'
#alias kmap='cat /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c | head -n 180 | tail -n 30'
# Pangaea c1.1 with QMK latest Aug 29. 0.18.1
QMK_HOME='/Users/k/src/0829'
alias cdq='cd $QMK_HOME'
alias pcd="cd   $QMK_HOME/qmk_firmware/keyboards/pangaea"
alias pe="vi    $QMK_HOME/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
alias per="vi   $QMK_HOME/qmk_firmware/keyboards/pangaea/rules.mk"
alias perr="vi  $QMK_HOME/qmk_firmware/keyboards/pangaea/keymaps/default/rules.mk"
alias pep="vi   $QMK_HOME/qmk_firmware/keyboards/pangaea/keymaps/default/p.h"
alias pc='cd $QMK_HOME/qmk_firmware;qmk compile -kb pangaea -km default'
alias pf='cd $QMK_HOME/qmk_firmware;qmk flash -kb pangaea -km default'
#
## kasumigasane 4x4 Macropad without diode by e3w2q
#alias kasumic='cd /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default '
#alias kasumie='vi /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
#alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
alias kasumic='cd /Users/k/src/0812/qmk_firmware/keyboards/kasumigasane/keymaps/default '
alias kasumie='vi /Users/k/src/0812/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
alias kasumib='kasumicd;qmk compile -kb kasumigasane -km default'
alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
###
### my4pad my4pad with RP2040, it works fine [Aug 13,2022]
### my4pad my4pad with RP2040, it works fine [Aug 3,2022]
# qmk develop branch
alias qmkd='git clone -b develop https://github.com/qmk/qmk_firmware.git'
alias my4padc='cd /Users/k/src/0812/qmk_firmware/keyboards/my4pad/'
alias my4pade='vi /Users/k/src/0812/qmk_firmware/keyboards/my4pad/keymaps/default/keymap.c'
alias my4padb='my4padc;qmk compile -kb my4pad -km default;cd ../../'
alias my4padbl='qmk compile -kb my4pad -km default'
alias my4padp='my4padc;qmk flash -kb my4pad -km default;cd ../../'
#
# 2x2 by k2.
alias 2e='vi /Users/k/src/1004/qmk_firmware/keyboards/2x2/keymaps/default/keymap.c'
alias 2cd='cd /Users/k/src/1004/qmk_firmware/'
alias 2f='2cd;qmk flash -kb 2x2 -km default'

# a_dux // March 2022, obsolete.
alias axhome='cd /Users/k/src/0325/qmk_firmware'
alias axcd='cd /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default'
alias axe='vi /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default/keymap.c'
alias axf='aduxcd;make a_dux:default:avrdude-split-left'
alias axfr='aduxcd;make a_dux:default:avrdude-split-right'

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
#
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
alias gnews='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://news.google.com/'
alias sk='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/smallkeyboard/blob/main/00README.md'
##
function mkcd(){mkdir -p $1 && cd $1}
#
source /Users/k/zsh_plugin/zaw/zaw.zsh
#
alias upd='git add images/*;git commit -m logic 00README.md images/* ;gp;sk'


#git remote add origon git@githubm.com:etalli/git-app.git
#

