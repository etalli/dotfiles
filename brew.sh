#!/usr/bin/env bash
# install command-line tools using Homebrew.

# Update to the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Save Homebrew's installed location
BREW_PREFIX=$(brew --prefix)

# install GNU core utilities
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
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

# install essential development tools.
brew install git
brew install zsh
brew install python@3

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
brew install ranger

# Remove outdated versions from the cellar.
brew cleanup

