# file: /Users/k/etc/dotfiles/.zshrc
#
# dotfiles - how to link .dotfiles to home directory.
# example,  $ ln -nfs /Users/k/etc/dotfiles/.zshrc /Users/k/.zshrc
#
# ctrl-r: search zsh historyy
# ctrl+a: go to the begeinning of line
# ctrl+e: go to the end of line
# ctrl+u: delete the whole line
# ctrl+k: delete text to the end of line
#
# avoid logout with Ctrl+D
setopt IGNOREEOF
# use Japanese
export LANG=ja_JP.UTF-8
# aadd local path
export PATH="$HOME/bin:$PATH"
# share history with other terminal
setopt share_history
# do not display history overlaps
setopt histignorealldups
# zsh history configg
export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store
function h-all { history -E 1}
setopt auto_pushd
setopt pushd_ignore_dups

# Complement: Tab, Ctrl-i, Ctrl-d
autoload -U compinit
compinit

# prompt
autoload colors
colors
#PROMPT="%{${fg[green]}%}%n:%{${reset_color}%} %~ %# "
RPROMPT="[%W %d]"
# pure, Feb 19, 2023-
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# aliases
alias l='ls -ltr --color=auto'
alias ls='ls --color=auto -F'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lst='ls -ltr --color=auto'
alias cdd='cd desktop'
alias h='fc -lt '%F %T' 1'
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
alias grl='grep -rl'
# text editor
#export EDITOR=vim
export EDITOR=code
alias vscode='code'

# Pangaea 1.2 with QMK
alias gcp='git clone git@github.com:e3w2q/Pangaea-keyboard.git'
export TODAY=`date +%m%d`
#export QMK_HOME='/Users/k/src/1216/qmk_firmware' # LATEST, V1.2
export QMK_HOME='/Users/k/Library/CloudStorage/Dropbox/MyProjects/181_pangaea_config/qmk_firmware' # LATEST qmk 22.10
export PANGAEA_HOME=$QMK_HOME'/keyboards/pangaea/'
alias cdq='cd $QMK_HOME'
alias pe="$EDITOR  $QMK_HOME/keyboards/pangaea/keymaps/k2/keymap.c"
alias peh="vi  $QMK_HOME/keyboards/pangaea/pangaea.h"
alias pev="vi  $QMK_HOME/keyboards/pangaea/keymaps/k2/keymap.c"
alias pecb="vi $QMK_HOME/keyboards/pangaea/keymaps/k2/combo.c"
alias pcd="cd  $QMK_HOME/keyboards/pangaea;echo "";echo QMK_HOME is $QMK_HOME;echo PANGAEA_HOME is $PANGAEA_HOME"
alias pcdk="cd $QMK_HOME/keyboards/pangaea/keymaps/k2/;pwd"
alias per="vi  $QMK_HOME/keyboards/pangaea/rules.mk"
alias perk="vi $QMK_HOME/keyboards/pangaea/keymaps/k2/rules.mk"
alias pec="vi  $QMK_HOME/keyboards/pangaea/config.h"
alias pei="vi  $QMK_HOME/keyboards/pangaea/info.json"
alias pem="vi  $QMK_HOME/keyboards/pangaea/matrix.c"
alias pecc="vi $QMK_HOME/keyboards/pangaea/keymaps/k2/config.h"
alias pep="vi  $QMK_HOME/keyboards/pangaea/keymaps/k2/p.h"
alias pc="cd   $QMK_HOME;pwd;/usr/bin/time qmk compile -kb pangaea -km k2;cd $PANGAEA_HOME"
alias qc="cd $QMK_HOME;qmk clean -a"
alias pf="cd   $QMK_HOME;qmk flash -kb pangaea -km k2;pcd"
# Archives pangaea project, but excludes .git directory and p.h, then copy the file to src for backup.
alias pzip="pcd;cd ../;zip -r `date +%m%d-pangaea`.zip pangaea -x \*/.git/\* pangaea/keymaps/k2/p.h;mv `date +%m%d-pangaea`.zip $HOME/src/backup/;cd ~/src/backup;ls -l"
alias ptar="pcd;cd ../;tar --exclude pangaea/.git --exclude p.h -hzcvf `date +%Y%m%d-%H%M%S-pangaea`.tar.gz $PANGAEA_HOME;ls -l *pangaea.tar.gz;mv *.tar.gz ~/src/backup;cd ~/src/backup/;ls -l"
alias tt="touch my_text-`date "+%Y-%m-%d__%H:%M:%S"`.txt;ls *.txt"
##
## kasumigasane 4x4 Macropad without diode by e3w2q
##
KASUMI_HOME=$QMK_HOME/keyboards/kasumigasane/
alias kcd='cd $KASUMI_HOME/keymaps/default'
alias ke='vi $KASUMI_HOME/keymaps/default/keymap.c'
alias kc='kcd;qmk compile -kb kasumigasane -km default'
alias kp='kcd;qmk flash -kb kasumigasane -km default'

##
## my4pad my4pad with RP2040,  [Aug 3,2022], updaetd July 15, 2023
##
#MY4PAD_HOME='/Users/k/src/0417/qmk_firmware/keyboards/my4pad/'
MY4PAD_HOME=$QMK_HOME/keyboards/my4pad/
alias 4cd='cd $MY4PAD_HOME'
alias 4e='vi $MY4PAD_HOME/keymaps/default/keymap.c'
alias 4ec='vi $MY4PAD_HOME/config.h'
alias 4ecc='vi $MY4PAD_HOME/keymaps/default/config.h'
alias 4c='4cd;qmk compile -kb my4pad -km default;cd ../../'
alias 4p='4cd;qmk flash   -kb my4pad -km default;cd ../../'
alias 4z='4cd;cd ../;zip -r my4pad.zip my4pad -x \*/.git/\* keymaps/.DS_Store;mv my4pad.zip $HOME/src/;echo "check src"'

## lmtkbd, July 15, 2023
LMT_HOME='/Users/k/src/0714/qmk_firmware/keyboards/lmt2/'
alias lmtcd='cd $LMT_HOME'
alias lmte='vi $LMT_HOME/keymaps/default/keymap.c'
alias lmtec='vi $LMT_HOME/config.h'
alias lmtecc='vi $LMT_HOME/keymaps/default/config.h'
alias lmtc='lmtcd;qmk compile -kb lmt2 -km default;'
alias lmtp='lmtcd;qmk flash   -kb lmt2 -km default;lmtz'
alias lmtz='lmtcd;cd ../;zip -r `date +%Y%m%d-%H%M-lmtkbd.zip` lmt2 -x \*/.git/\* keymaps/.DS_Store;mv *lmtkbd.zip ~/Dropbox/MyProjects/168*/LMT/LMT_rev3/firmware/;pwd'

# Web Browser
alias chrome='open -na "Google Chrome" --args'
alias chromenw='open -na "Google Chrome" --args --new-window'
alias primevideo='chrome "https://www.amazon.co.jp/Amazon-Video/b/?ie=UTF8&node=2351649051&ref_=nav_cs_prime_video"'

## zshrc
alias ez='pushd;vim ~/.zshrc;source ~/.zshrc;bdot;popd'
alias vz="vim ~/.zshrc"
alias rz="source ~/.zshrc"
# misc
alias gcqmk='git clone --recursive https://github.com/qmk/qmk_firmware.git'
alias finder='open .'
alias f='find ./ -name '
alias f3='find ./ -atime 3'
alias f2='find ./ -atime 2'
alias f1='find ./ -atime 1'
alias f3p='find ./ -atime +3' # three days before
alias f10='find ./ -atime -10' # within 10 days
alias ft='find ./ -mtime 0' # today
#
# git alias commands
#
# GitHUBH
#…or create a new repository on the command line
#echo "# p_tmp5" >> README.md
#git init
#git add README.md
#git commit -m "first commit"
#git branch -M main
#git remote add origin git@github.com:etalli/p_tmp5.git
#git push -u origin main
#
alias ga='git add .'
alias gcm='git commit -m "now"'
alias gp='git push -u origin main'
#
alias grv='git remote -v'
alias gr='git remote'
alias grso='git remote show origin'
#
alias gitls="alias | grep git"
alias gc="git checkout"
alias gcd="git checkout develop"
alias gpd="git push origin develop"
alias gpm="git push origin master"
alias grm="git rm --cached"
alias gdn="git diff --name-only"
alias grh="git reset --hard HEAD^"
alias gpl="git pull"
#
## dotfiles backup
alias bdot='cd /Users/k/etc/dotfiles;git add .;git commit -m "ok" .zshrc;git push'
alias bdot2='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles'
alias bdot3='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles/blob/main/.zshrc'
alias bdoti='bdot;/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/etalli/dotfiles/blob/main/install.sh'
#
## Google Chrome
alias w3='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1'
alias github='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://github.com/'
alias gmail='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome gmail.com/'
alias d='du -h -d=1'
#
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

### rust
export PATH="HOME/.cargo/bin/:$PATH"
alias cf='cargo fmt --check --verbose'
alias cb='cargo build'
alias cc='cargo clippy'
# restart shell without restating the terminal
alias relogin='exec $SHELL -l'
alias rss='echo "restarting shell.";exec $SHELL -l'
eval "$(pyenv init -)"

###  MyProjects short cuts
alias tt='cd ~/src/1216/qmk_firmware/'
alias 158='cd ~/Dropbox/MyProjects/158*'
alias 154='cd ~/Dropbox/MyProjects/154*'
alias 153='cd ~/Dropbox/MyProjects/153*'
alias 160='cd ~/Dropbox/MyProjects/160*'
alias 161='cd ~/Dropbox/MyProjects/161*'
alias 162='cd ~/Dropbox/MyProjects/162*'
alias 168='cd ~/Dropbox/MyProjects/168*'
alias 169='cd ~/Dropbox/MyProjects/169*'
alias 136='cd ~/Dropbox/MyProjects/136*'
alias 180='cd ~/Dropbox/MyProjects/180*'
alias 181='cd ~/Dropbox/MyProjects/181*' # pangaea firmware
alias 152='cd ~/Dropbox/MyProjects/152*' # pangaea thumb
alias 166='cd ~/Dropbox/MyProjects/166*' # pangaea pinkey, -0.25u

alias GIT_REMOVE='git filter-branch --force --index-filter git rm --cached --ignore-unmatch RileToRemove.md -- --all'
alias ze='source ~/zephyrproject/.venv/bin/activate'
