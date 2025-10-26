[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/badge/macOS-tools-blue)]()
[![](https://img.shields.io/github/last-commit/etalli/dotfiles)]()

# dotfiles

my dotfiles and macOS configuration memo

## Dotfiles

* [.zshrc](.zshrc)
* [.vimrc](.vimrc)
* [.zsh_aliases](.zsh_aliases)

## Installation Scripts

* [install.sh](install.sh) - Creates symbolic links for dotfiles
* [brew.sh](brew.sh) - Homebrew package installation

---

## Development Setup

### Command Line Tools

#### Homebrew

* [Homebrew](https://brew.sh/)

Installation:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Check status:

```bash
brew doctor
```

#### Essential Tools

* Xcode Command Line Tools:

  ```bash
  xcode-select --install
  xcode-select -p
  ```

  Output should be: `/Library/Developer/CommandLineTools`

* Basic development tools (via [brew.sh](brew.sh)):

  ```bash
  brew install git zsh wget python@3 coreutils moreutils findutils gnu-sed
  brew install fzf ripgrep htop tree node pnpm cmake bat jq
  brew install vim grep wget gnupg screen imagemagick
  brew install --cask visual-studio-code iterm2 docker
  ```

* Additional tools:

  ```bash
  brew install pure pyenv ranger
  mkdir .vimbackup
  ```

### Applications

* [Visual Studio Code](https://code.visualstudio.com/)
  * Make sure the extension is `*.md`. If not, it doesn't work.
  * Extensions:
    * **Markdown All in One**
      * Preview by side: `cmd+k, v`
      * `Ctrl/Cmd + Shift + V`: Toggle preview
      * `Ctrl/Cmd + K V`: Toggle preview to side
    * **Paste Image** - `shift, alt(option), v` to set target image directory
    * [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
    * **Prettier**
    * **Markdown Preview Github Styling**
    * **Git Graph**
* [GitHub Desktop](https://desktop.github.com/)
* [Chrome](https://www.google.com/chrome/)
* [Draw.io Desktop](https://github.com/jgraph/drawio-desktop/releases/)
* [Dropbox](https://www.dropbox.com/downloading)
* [Obsidian](https://obsidian.md/)
* [KiCAD](https://www.kicad.org/) (PCB design)
  * Java Runtime
  * freerouting
  * jlcpcb toolkit
* Kindle
* [Rectangles](https://github.com/rxhanson/Rectangle) (window arrangement tool)
* [FDClone](https://github.com/knu/FDclone) - `$make`
* ranger (file manager) - `brew install ranger`

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
