#!/bin/sh
# make symbolic link
ln -sf /Users/k/etc/dotfiles/.zshrc ~/.zshrc
# check link
ls -al ~/.zshrc
# check file
head ~/.zshrc

#ln -s .vimrc ~/.vimrc

# keep git password for a day.
git config --global credential.helper cache 'cache --timeout=86400'
