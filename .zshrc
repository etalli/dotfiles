# rev.0.05
# file: /Users/k/etc/dotfiles/.zshrc
#
# dotfiles - how to link. example
# ln -nfs /Users/k/etc/dotfiles/.zshrc /Users/k/.zshrc
#
# zsh history, ctrl-r for search historyy
# ctrl+a: go to the begeinning of line
# ctrl+e: go to the end of line
# ctrl+u: delete the whole line
# ctrl+k: delete text to the end of line

export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store
function h-all { history -E 1}
#
# prompt
autoload -U compinit
autoload colors
colors
compinit
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
# Pangaea rev.2, and rev.3(now)
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
alias pC= 'cd $HOME/src/0518/qmk_firmware;pwd'
alias pe="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
alias per="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/rules.mk"
alias perr="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/rules.mk"
alias pCD="cd /Users/k/src/0518/qmk_firmware/keyboards/pangaea"
alias pep="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/p.h"
alias pc='pC11;qmk compile -kb pangaea -km default'
alias pf='alias pf11;echo "   ";pC11;qmk flash -kb pangaea -km default'
alias kmap='cat /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c | head -n 180 | tail -n 30'
#
## kasumigasane by e3w2q
alias kasumicd='cd /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default '
alias kasumie='vi /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
#
# 2x2 by k2.
alias 2e='vi /Users/k/src/1004/qmk_firmware/keyboards/2x2/keymaps/default/keymap.c'
alias 2f='pCD;qmk flash -kb 2x2 -km default'

# a_dux // March 2022, obsolete.
alias axhome='cd /Users/k/src/0325/qmk_firmware'
alias axcd='cd /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default'
alias axe='vi /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default/keymap.c'
alias axf='aduxcd;make a_dux:default:avrdude-split-left'
alias axfr='aduxcd;make a_dux:default:avrdude-split-right'

# edit zshrc
alias ez='vim ~/.zshrc;source ~/.zshrc;bdot2'
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
alias gp='git push'
alias gcm='git commit -m'
alias ga='git add .'
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
alias bdot='cd /Users/k/etc/dotfiles;git add .;git commit -m "anything" .zshrc;git push'
alias bdot2='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles'
## web sites
alias web='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias github='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/'
alias gmail='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome gmail.com/'
alias gnews='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://news.google.com/'
##
function mkcd(){mkdir -p $1 && cd $1}
#
source /Users/k/zsh_plugin/zaw/zaw.zsh
