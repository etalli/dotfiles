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
# install shells
brew install zsh
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# install more recent versions of some macOS tools.
brew install wget
brew install gnupg
brew install vim
brew install grep
brew install screen
brew install php
brew install gmp
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install woff2
brew install imagemagick
# Remove outdated versions from the cellar.
brew cleanup
