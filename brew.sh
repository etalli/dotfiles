#!/usr/bin/env bash
# install command-line tools using Homebrew

# Update to the latest Homebrew
brew update
# Upgrade any already-installed formula
brew upgrade

# Save Homebrew's installed location
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
# Install some other useful utilities like `sponge`.
brew install moreutils
# install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# install essential development tools.
brew install git
brew install zsh
brew install vim
brew install grep
brew install wget
brew install gnupg
brew install screen
brew install imagemagick
brew install ranger

# install modern command-line tools.
brew install fzf
brew install ripgrep
brew install htop
brew install tree
brew install node
brew install pnpm
brew install cmake
brew install bat
brew install jq

# install shell and development tools.
brew install pure
brew install pyenv
brew install python@3

# Remove outdated versions from the cellar.
brew cleanup

