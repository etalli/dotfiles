#!/bin/sh
set -x

## zshrc
# make symbolic link
ln -sf /Users/k2/etc/dotfiles/.zshrc ~/.zshrc

## vimrc
# make symbolic link
ln -sf /Users/k2/etc/dotfiles/.vimrc ~/.vimrc

## aliases
ln -sf /Users/k2/etc/dotfiles/.zsh_aliases ~/.zsh_aliases

set +x

#!/usr/bin/env bash
# install command-line tools using Homebrew.

# Update to the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

# install GNU core utilities
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# install some other useful utilities like `sponge`.
brew install moreutils
# install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install wget
brew install gnupg
brew install screen
brew install imagemagick
# Remove outdated versions from the cellar.
brew cleanup
echo "done"
