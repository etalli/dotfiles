# prompt
# test1
autoload -U compinit
autoload colors
colors
compinit
#PROMPT='[%W %T %d] % '
PROMPT="${fg[white]}${bg[black]}%W %T %d] % %{${reset_color}%}"


# gfortran
# add  the stdlib to your $LIBRARY_PAT to avoid this error: "ld: library not found for -lSystem"
export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"

# dotfiles - how to link. example
# ln -nfs /Users/k/foo/dotfiles/.zshrc /Users/k/.zshrc
# ln -nfs /Users/k/foo/dotfiles/.vimrc /Users/k/.vimrc

##autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:*' formats '%F{blue}%b%f' '%S'
#zstyle ':vcs_info:*' actionformats '%b%F{cyan}:%F{red}%a%f'
#zstyle ':vcs_info:svn:*' branchformat '%F{blue}%b%F{cyan}:%fr%r'
#zstyle ':vcs_info:*' enable git svn hg bzr cvs
#RPROMPT=$RPROMPT’${vcs_info_msg_0_}’

alias ls='ls -aF'
alias ll='ls -l'
alias ll='ls -l'

alias cdd='cd desktop'
#alias pf='qmk flash -kb pangaea -km defaulta'
# Pangaea
alias cdk="cd /Users/k/src/1004/qmk_firmware"
alias pCD='cd $HOME/src/1004/qmk_firmware'
alias pe="vi +146 /Users/k/src/1004/qmk_firmware/keyboards/pangaea/keymaps/default/keymap.c"
alias ped="vi +10 /Users/k/src/1004/qmk_firmware/keyboards/pangaea/keymaps/default/MyDefines.h"
alias pc='pCD;pwd;make pangaea:default'
alias pf='pCD;pwd;qmk flash -kb pangaea -km default'
# zshrc
alias rz='source ~/.zshrc'
alias ez='vi ~/.zshrc;source ~/.zshrc'

# pass phase: hogehoge
alias gitclone='git clone ssh://github.com/etalli/keyboard.git'


# docker
alias dup='docker-compose up -d'
alias dps='docker-compose ps'
alias ddown='docker-compose down'

# zsh aliases
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
#alias rmf="rm -rf"

# Firebase aliases
alias fl="firebase login"
alias fi="firebase init"
alias fs="sudo firebase serve"
alias fd="firebase deploy"
alias fdf="firebase deploy --only functions"

# npm commands
alias nig="npm install -g"
alias nis="npm install --save"
alias nui="npm uninstall"
alias nuis="npm uninstall --save"
alias nls="npm ls"
alias niy="npm init -y"
alias nid="npm install --save-dev"
nvv() { npm view $1 version }

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


