#!/bin/zsh
set -x

## symbolic link to ~/.zshrc
ln -sf $HOME/etc/dotfiles/.zshrc ~/.zshrc

## vimrc
# make symbolic link
ln -sf $HOME/etc/dotfiles/.vimrc ~/.vimrc
mkdir ~/.vimbackup

## aliases
ln -sf $HOME/etc/dotfiles/.zsh_aliases ~/.zsh_aliases

set +x
echo "done"
# if shell is zsh
if [[ -n "$ZSH_VERSION" ]]; then
   source "$HOME/.zshrc"
else
  exec zsh -l
fi
