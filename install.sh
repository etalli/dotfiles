#!/bin/sh
set -x

## zshrc
# make symbolic link
ln -sf $HOME/etc/dotfiles/.zshrc ~/.zshrc

## vimrc
# make symbolic link
ln -sf $HOME/etc/dotfiles/.vimrc ~/.vimrc

## aliases
ln -sf $HOME/etc/dotfiles/.zsh_aliases ~/.zsh_aliases

set +x
echo "done"
