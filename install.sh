#!/bin/sh

## ZSHRC
# make symbolic link
ln -sf /Users/k/etc/dotfiles/.zshrc ~/.zshrc

# check link
ls -al ~/.zshrc

# check file
head ~/.zshrc


## VIMRC
# make symbolic link
ln -sf /Users/k/etc/dotfiles/.vimrc ~/.vimrc
# check link
ls -al ~/.vimrc

head ~/.vimrc


## config
# keep git password for a day.
git config --global credential.helper cache 'cache --timeout=86400'
#
#gh auth login

