#!/bin/sh
set -x

## zshrc
# make symbolic link
ln -sf /Users/k2/etc/dotfiles/.zshrc ~/.zshrc

## vimrc
# make symbolic link
ln -sf /Users/k2/etc/dotfiles/.vimrc ~/.vimrc

## alisaes
ln -sf /Users/k2/etc/dotfiles/.zsh_aliases ~/.zsh_aliases

set +x
echo "done"
