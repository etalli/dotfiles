[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/badge/macOS-tools-blue)]()
[![](https://img.shields.io/github/last-commit/etalli/dotfiles)]()

# dotfiles

my dotfiles and macOS configuration memo

## Dotfiles

* [.zshrc](.zshrc), [.zsh_aliases](.zsh_aliases), [.vimrc](.vimrc)

## Installation Scripts

* [install.sh](install.sh) - Creates symbolic links for dotfiles from `$HOME/etc/dotfiles` to `$HOME/`
* [brew.sh](brew.sh) - Homebrew package installation

---

## Installation Order

0. Change the directory, yourhome/etc

   ```bash
   cd ~/etc
   ```

1. Clone this repository:

   ```bash
   git clone https://github.com/etalli/dotfiles.git
   ```

2. Run the installation script:

   ```bash
   cd ~/etc/dotfiles
   ./install.sh
   ```

---

## Development Setup

### Command Line Tools

#### [Homebrew](https://brew.sh/)

Installation:

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Check status:

```bash
$ brew doctor
```

#### Essential Tools

* Xcode Command Line Tools:

  ```bash
  $ xcode-select --install
  $ xcode-select -p
  ```

  Output should be: `/Library/Developer/CommandLineTools`

* Core utilities (via [brew.sh](brew.sh)):

  ```bash
  $ brew install coreutils moreutils findutils gnu-sed
  ```

* macOS tools:

  ```bash
  $ brew install vim grep wget gnupg screen imagemagick
  ```

* Essential development tools:

  ```bash
  $ brew install git zsh python@3
  ```

* Modern command-line tools:

  ```bash
  $ brew install fzf ripgrep htop tree node pnpm cmake bat jq
  ```

* Shell and development tools:

  ```bash
  $ brew install pure pyenv ranger
  $ mkdir .vimbackup
  ```

* Applications (cask):

  ```bash
  $ brew install --cask visual-studio-code iterm2 docker rectangles
  ```

* Specialized tools:

  * [FDClone](https://github.com/knu/FDclone) - `$ make`

### Applications

* [Chrome](https://www.google.com/chrome/)
* [Dropbox](https://www.dropbox.com/downloading)
* [GitHub Desktop](https://desktop.github.com/)
* [Draw.io Desktop](https://github.com/jgraph/drawio-desktop/releases/)
* [Obsidian](https://obsidian.md/)
* Kindle
* [KiCAD](https://www.kicad.org/)
  * Java Runtime
  * freerouting
  * jlcpcb toolkit
* [Visual Studio Code](https://code.visualstudio.com/)
  * Extensions:
    * **Markdown All in One**
      * Preview by side: `cmd+k, v`
      * Toggle preview: `Ctrl/Cmd + Shift + V`
      * Toggle preview to side: `Ctrl/Cmd + K V`
    * **Paste Image** - `shift, alt(option), v` to set target image directory
    * [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
    * **Prettier**
    * **Markdown Preview Github Styling**
    * **Git Graph**

### Keyboard & Hardware

* [QMK Firmware](https://docs.qmk.fm/)
* [Google Japanese Input](https://www.google.co.jp/ime/)
* EIZO screen instyle - `cmd alt D, H`

---

## macOS Configuration

### Finder Settings

Show hidden files:

```bash
defaults write com.apple.finder AppleShowAllFiles true
killall Finder
```

Hide hidden files:

```bash
defaults write com.apple.finder AppleShowAllFiles false
killall Finder
```

### System Settings

* **Keyboard** (internal and external):
  * Caps Lock → Control
* **Desktop & Dock**:
  * Hot corner (Launch pad, etc.)
* **Display**:
  * How to activate only external monitor:
    * Set to mirroring mode
    * Set Mac brightness as low as possible from the touch bar (screen will be disabled)

---

## Special Projects

### Sony Spresense Build Environment on macOS [Oct 26, 2025]

Needs to modify the unarchive option for bzip2:

```sh
% diff install-tools.sh install-tools.sh.fixed 
323c323
<     run_progress tar vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
---
>     run_progress tar --bzip2 vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
```
