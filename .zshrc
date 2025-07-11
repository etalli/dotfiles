# file location: /Users/k/etc/dotfiles/.zshrc
#
# dotfiles - how to link .dotfiles to home directory.
# example,  $ ln -nfs /Users/k/etc/dotfiles/.zshrc /Users/k/.zshrc
#
# ctrl+a: go to the begeinning of line
# ctrl+e: go to the end of line
# ctrl+u: delete the whole line
# ctrl+k: delete text to the end of line
# ctrl-r: search zsh historyy
#
# avoid logout with Ctrl+D
setopt IGNOREEOF
# use Japanese
export LANG=ja_JP.UTF-8
# aadd local path
export PATH="$HOME/bin:$PATH"
# share history with other terminal
setopt share_history
# zsh history configg
export HISTFILE=${HOME}/etc/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
function h-all { history -E 1}
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_all_dups
# Complement: Tab, Ctrl-i, Ctrl-d
autoload -U compinit
# prompt
autoload colors
colors
#PROMPT="%{${fg[green]}%}%n:%{${reset_color}%} %~ %# "
RPROMPT="[%W ]"
# pure, Feb 19, 2023-
#fpath+=("$(brew --prefix)/share/zsh/site-functions")
#autoload -U promptinit; promptinit
#prompt pure
# aliases
alias ls='ls --color=auto -F'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lst='ls -ltr --color=auto'
alias h='fc -lt '%F %T' 1'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias diff='diff -U1'
# text editor
#export EDITOR=nvim
export EDITOR=code
alias vi='vim'


# Pangaea 1.2 with QMK
alias gcp='git clone git@github.com:e3w2q/Pangaea-keyboard.git'
#export QMK_HOME='/Users/k/Dropbox/MyProjects/181_pangaea_config/qmk_firmware' # LATEST qmk 22.10
#export QMK_HOME='/Users/k/src/1116/qmk_firmware'
export QMK_HOME='/Users/k2/qmk_firmware'
export PANGAEA_HOME=$QMK_HOME'/keyboards/pangaea/'
alias pe="$EDITOR -g $QMK_HOME/keyboards/pangaea/keymaps/k2/keymap.c:228"
alias m2e="$EDITOR -g $QMK_HOME/keyboards/m2/keymaps/default/keymap.c"
alias peh="vi  $QMK_HOME/keyboards/pangaea/pangaea.h"
alias pev="vi  $QMK_HOME/keyboards/pangaea/keymaps/k2/keymap.c -c 228"
alias pecb="vi $QMK_HOME/keyboards/pangaea/keymaps/k2/combo.c"
alias pcd="cd  $PANGAEA_HOME;echo "";echo QMK_HOME is $QMK_HOME;echo PANGAEA_HOME is $PANGAEA_HOME"
alias pcdk="cd $QMK_HOME/keyboards/pangaea/keymaps/k2/;pwd"
alias pei="vi  $QMK_HOME/keyboards/pangaea/info.json"
alias per="vi  $QMK_HOME/keyboards/pangaea/rules.mk"
alias perk="vi $QMK_HOME/keyboards/pangaea/keymaps/k2/rules.mk"
alias pec="vi  $QMK_HOME/keyboards/pangaea/config.h"
alias pem="vi  $QMK_HOME/keyboards/pangaea/matrix.c"
alias pc="cd   $QMK_HOME;pwd;/usr/bin/time qmk --log-file-level info --color compile -kb pangaea -km k2"
alias pf="cd   $QMK_HOME;qmk --log-file-level critical flash -kb pangaea -km k2"
#
alias m2c="cd   $QMK_HOME;pwd;/usr/bin/time qmk --log-file-level info --color compile -kb m2 -km default"
alias m2f="cd   $QMK_HOME;pwd;/usr/bin/time qmk --log-file-level info --color flash -kb m2 -km default"
alias m2ac="cd   $QMK_HOME;pwd;/usr/bin/time qmk compile -kb m2a -km default"
alias m2af="cd   $QMK_HOME;pwd;/usr/bin/time qmk flash -kb m2a -km default"
#
alias qc="cd $QMK_HOME;qmk clean -a"
# tests
alias pfpi="cd $QMK_HOME;qmk --log-file-level critical flash -c -kb pangaea -km k2 -e CONVERT_TO=elite_pi"
alias pfkb="cd $QMK_HOME;qmk --log-file-level critical flash -c -kb pangaea -km k2 -e CONVERT_TO=kb2040"
alias pfkb2="cd $QMK_HOME;qmk flash -c -kb crkbd -km default -e CONVERT_TO=kb2040"
#
# Archives pangaea project, but excludes .git directory and p.h, then copy the file to src for backup.
#alias pzip="pcd;cd ../;zip -r `date +%m%d-pangaea`.zip pangaea -x \*/.git/\* pangaea/keymaps/k2/p.h;mv `date +%m%d-pangaea`.zip $HOME/src/backup/;cd ~/src/backup;ls -l"
#alias ptar="pcd;cd ../;tar --exclude pangaea/.git --exclude p.h -hzcvf `date +%Y%m%d-%H%M%S-pangaea`.tar.gz $PANGAEA_HOME;ls -l *pang4ea.tar.gz;mv *.tar.gz ~/src/backup;cd ~/src/backup/;ls -l"
#
#alias tt="touch my_text-`date "+%Y-%m-%d__%H:%M:%S"`.txt;ls *.txt"
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
##
## lmtkbd, July 15, 2023
LMT_HOME='/Users/k/src/0714/qmk_firmware/keyboards/lmt2/'
alias lmtcd='cd $LMT_HOME'
alias lmte='vi $LMT_HOME/keymaps/default/keymap.c'
alias lmtec='vi $LMT_HOME/config.h'
alias lmtecc='vi $LMT_HOME/keymaps/default/config.h'
alias lmtc='lmtcd;qmk compile -kb lmt2 -km default;'
alias lmtp='lmtcd;qmk flash   -kb lmt2 -km default;lmtz'
alias lmtz='lmtcd;cd ../;zip -r `date +%Y%m%d-%H%M-lmtkbd.zip` lmt2 -x \*/.git/\* keymaps/.DS_Store;mv *lmtkbd.zip $DROPBOX/MyProjects/168*/LMT/LMT_rev3/firmware/;pwd'

# Web Browser
alias chrome='open -na "Google Chrome" --args'
alias chromenw='open -na "Google Chrome" --args --new-window'

## zshrc
alias ez='vim ~/.zshrc;source ~/.zshrc'
alias vz="vim ~/.zshrc"
alias rz="source ~/.zshrc"
# misc
# keyboard firmware, qmk
alias gcqmk='git clone --recursive https://github.com/qmk/qmk_firmware.git'
#
alias finder='open .'
alias f='find ./ -name '
alias f3='find ./ -atime 3'
alias f2='find ./ -atime 2'
alias f1='find ./ -atime 1'
alias f3p='find ./ -atime +3' # three days before
alias f10='find ./ -atime -10' # within 10 days
alias ft='find ./ -mtime 0' # today
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
alias bdot='cd /Users/k2/etc/dotfiles;git add .;git commit -m "ok" .zshrc;git push'
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
##
# how to remove (base) on prompt
# conda deactivate
# conda config --set auto_activate_base False

### rust
export PATH="HOME/bin:$PATH"
export PATH="HOME/.cargo/bin/:$PATH"
alias cf='cargo fmt --check --verbose'
alias cb='cargo build'
alias cc='cargo clippy'
# restart shell without restating the terminal
alias relogin='exec $SHELL -l'
alias rss='echo "restarting shell.";exec $SHELL -l'
#eval "$(pyenv init -)"
#
###  MyProjects short cuts
export DROPBOX='/Users/k2/Dropbox'
alias tt='cd ~/src/1216/qmk_firmware/'
alias 158='cd $DROPBOX/MyProjects/158*'
alias 154='cd $DROPBOX/MyProjects/154*'
alias 153='cd $DROPBOX/MyProjects/153*'
alias 160='cd $DROPBOX/MyProjects/160*'
alias 161='cd $DROPBOX/MyProjects/161*'
alias 162='cd $DROPBOX/MyProjects/162*'
alias 169='cd $DROPBOX/MyProjects/169*'
alias 136='cd $DROPBOX/MyProjects/136*'
alias 152='cd $DROPBOX/MyProjects/152*' # pangaea thumb
alias 166='cd $DROPBOX/MyProjects/166*' # pangaea pinkey, -0.25u
alias 180='cd $DROPBOX/MyProjects/180*'
alias 168='cd $DROPBOX/MyProjects/168*' # LMT
alias 181='cd $DROPBOX/MyProjects/181*' # pangaea firmware
alias 182='cd $DROPBOX/MyProjects/182*' # Wireless ZMK, TOTEM etc.
alias 170='cd $DROPBOX/MyProjects/170*' # Continuity Tester
alias 189='cd $DROPBOX/MyProjects/189*' # Hot Notifier
alias 191='cd $DROPBOX/MyProjects/191*' # Raspbery Pi Pico W, BLE keyboard Dev Env
alias 195='cd $DROPBOX/MyProjects/195*' # Kasumigasane
alias 199='cd ~/qmk_firmware;cd keyboards/m2;pwd'
#
alias 205='cd $DROPBOX/MyProjects/205*' # one key password manager
alias 205cd='cd $HOME/src/2024-0917/qmk_firmware/'
alias 205e='cd $HOME/src/2024-0917/qmk_firmware/keyboards/handwired/onekey'
alias 205c='205c;qmk compile -km default -kb handwired/onekey/kb2040'
alias 205f='205c;qmk flash   -km default -kb handwired/onekey/kb2040'
#
alias 211='cd $DROPBOX/MyProjects/211_*' # Pangaea Dev Guide
alias 215='cd $DROPBOX/MyProjects/215*'  # Blender
alias 218='cd $DROPBOX/MyProjects/218*'  # Othello
alias 217='cd $DROPBOX/MyProjects/217*/2*' # spice simulaiton
alias 221='cd $DROPBOX/MyProjects/221*'  # misc
alias 222='cd $DROPBOX/MyProjects/222*'  # ZMK Split test
alias 223='cd $DROPBOX/MyProjects/223*'  # KiCAD Plugins
alias kc='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad'
alias 224='cd $DROPBOX/MyProjects/224*'  # ZMK MacroPad_2x3
alias 225='cd $DROPBOX/MyProjects/225*'  # ZMK totem keyboard
#
export PICO_SDK_PATH='/Users/k/Library/CloudStorage/Dropbox/MyProjects/191_Wireless_KBD_Dongle/pico-sdk'
alias bledongle='cp picow_ble_hid_keyboard.uf2 /Volumes/RPI-RP2'
alias GIT_REMOVE='git filter-branch --force --index-filter git rm --cached --ignore-unmatch RileToRemove.md -- --all'
#
alias ze='source ~/zephyrproject/.venv/bin/activate'
export TODAY=`date +%m%d`
#
# QMKs
alias sinfo='find ./ -name 'info.json' | xargs grep'
alias mikke='(){find ./ -type f -print | xargs grep $1 | less}'
# web browser
alias ff='./mach run >& /dev/null '
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
