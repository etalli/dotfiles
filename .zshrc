# rev.3.1
# zsh history, ctrl-r for search historyy
export HISTFILE=~/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY

# prompt
autoload -U compinit
autoload colors
colors
compinit
PROMPT='[%W %T %d] % '
#PROMPT="${fg[white]}${bg[black]}%W %T %d] % %{${reset_color}%}"

# gfortran
# add  the stdlib to your $LIBRARY_PAT to avoid this error: "ld: library not found for -lSystem"
export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"

# dotfiles - how to link. example
# ln -nfs /Users/k/src/dotfiles/.zshrc /Users/k/.zshrc
# ln -nfs /Users/k/src/dotfiles/.vimrc /Users/k/.vimrc

alias ls='ls -aF'
alias ll='ls -l'
alias ll='ls -l'
alias cdd='cd desktop'

# Pangaea rev.2, and rev.3(now)
alias pCD='cd $HOME/src/1004/qmk_firmware'
alias pe="vi +46 /Users/k/src/1004/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
alias pc='pCD;make pangaea:default'
alias pcr3='pCD;make pangaea:rev3'
alias pf='pCD;qmk flash -kb pangaea -km default'
alias kmap='cat /Users/k/src/1004/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c | head -n 190 | tail -n 30'
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
alias pC11= 'cd $HOME/src/0518/qmk_firmware;pwd'
alias pe11="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
alias per11="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/rules.mk"
alias pCD11="cd /Users/k/src/0518/qmk_firmware/keyboards/pangaea"
alias pep11="vi /Users/k/src/0518/qmk_firmware/keyboards/pangaea/keymaps/default/p.h"
alias pc11='pC11;qmk compile -kb pangaea -km default'
alias pf11='alias pf11;echo "   ";pC11;qmk flash -kb pangaea -km default'
#
## kasumigasane
alias kasumicd='cd /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default '
alias kasumie='vi /Users/k/src/1004/qmk_firmware/keyboards/kasumigasane/keymaps/default/keymap.c'
alias kasumip='kasumicd;qmk flash -kb kasumigasane -km default'
#
# 2 x 2 by k2.
alias 2e='vi /Users/k/src/1004/qmk_firmware/keyboards/2x2/keymaps/default/keymap.c'
alias 2f='pCD;qmk flash -kb 2x2 -km default'

# a_dux //March 2022, obsolete.
alias axhome='cd /Users/k/src/0325/qmk_firmware'
alias axcd='cd /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default'
alias axe='vi /Users/k/src/0325/qmk_firmware/keyboards/a_dux/keymaps/default/keymap.c'
alias axf='aduxcd;make a_dux:default:avrdude-split-left'
alias axfr='aduxcd;make a_dux:default:avrdude-split-right'

# zshrc
alias ez='vim ~/.zshrc;source ~/.zshrc'
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias rz='source ~/.zshrc'

# hogehoge
alias gitclonep='git clone ssh://github.com/etalli/keyboard.git'
alias glqmk='git clone https://github.com/qmk/qmk_firmware.git'
alias 128='cd ~/Dropbox/MyProjects/128_myKBD'
alias finder='open'
alias here='open .'

# Show all git alias commands
alias gitls="alias | grep git"
alias gc="git checkout"
alias gcd="git checkout develop"
alias gpd="git push origin develop"
alias gpm="git push origin master"
alias grm="git rm --cached"
alias gdn="git diff --name-only"
alias grh="git reset --hard HEAD^"

gmpd () {
    git pull origin develop
    echo "Type branche name to merge : " && read branch;
    git merge ${branch};
    git status;
    echo "Is it okay to continue?" && read;
    git push origin develop
}

# Push all changes to current branch
gcom () {
    git add . && git status
    echo "Type commit comment" && read comment;
    git commit -m ${comment} && git push origin HEAD
}

mygcre () {
	git init && git add . && git status && git commit -m "First commit"
    echo "Type repository name: " && read name;
    echo "Type repository description: " && read description;
    curl -u YOURID:YOURPASSWORD https://api.github.com/user/repos -d '{"name":"'"${name}"'","description":"'"${description}"'","private":true}'
    git remote add origin https://github.com/deatiger/${name}.git
    git checkout -b develop;
    git push -u origin develop;
}
## dotfiles backup
alias backupdot='git add.;git commit -m "anything" .zshrc;git push'

