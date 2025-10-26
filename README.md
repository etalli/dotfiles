
[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/badge/macOS-tools-blue)]()
[![](https://img.shields.io/github/last-commit/etalli/dotfiles)]()

# dotfiles

my dotfiles and macOS configuration memo

* [.zshrc](.zshrc)
* [.vimrc](.vimrc)
* [.zsh_aliases](.zsh_aliases)

## Installation scripts

* [install.sh](install.sh) - Creates symbolic links for dotfiles
* [brew.sh](brew.sh) - Homebrew package installation

## macOS installation notes

* [macOS installation note (Google Spreadsheet)](https://docs.google.com/spreadsheets/d/1nGlX5QW-kHIF5Evnk0yIMLczgUsKVIw4vEqRmW-1FRc/edit?usp=sharing)

## Contents

### Useful tools

* Chrome (Google Web Browser)
* [Homebrew](https://brew.sh/) (command line tool)
  + [brew.sh](brew.sh) (installation script)
  + pure (zsh prompt)
  + ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
  + ```bash
    brew doctor
    ```
* basic tools
  + ```bash
    brew install git zsh wget python@3
    brew install fzf ripgrep htop
    brew install --cask visual-studio-code iterm2 docker
    brew install tree node pnpm cmake bat jq
    ```
* rectangles (window arrangement tool)
* Visual Studio Code (Microsoft text editor)
  
  Make sure the extension is `*.md`. if not, it doesn't work.
  
  + Markdown All in One
    - preview by side: `cmd+k, v`
    - `Ctrl/Cmd + Shift + V`: Toggle preview
    - `Ctrl/Cmd + K V`: Toggle preview to side
  + Paste Image
  + set target image directory
    - `shift, alt(option), v`
  + [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
  + Prettier
  + Markdown Preview Github Styling
  + Git Graph
* xcode - Apple development environment
  + ```bash
    xcode-select --install
    xcode-select -p
    ```
    the output should be `/Library/Developer/CommandLineTools`

### Applications

* [GitHub Desktop](https://desktop.github.com/)
* [KiCAD](https://www.kicad.org/)
* [vscode](https://code.visualstudio.com/)
* [draw.io desktop](https://github.com/jgraph/drawio-desktop/releases/)

### Keyboard

* [QMK Firmware](https://docs.qmk.fm/)

## How to show the dot files in Finder

```bash
defaults write com.apple.finder AppleShowAllFiles true
```

and needs to restart Finder from Terminal by

```bash
killall Finder
```

To set the default setting,

```bash
defaults write com.apple.finder AppleShowAllFiles false
```

then,

```bash
killall Finder
```

## System setting

* how to active only external monitor?
  * set the mirroring mode
  * set your Mac brightness as low as possible from the touch bar, then the screen will be blacked and disabled.

## Sony Spresense build environment on macOS [Oct 26, 2025]

Needs to modify the unarchive option for bizp2.

```sh
% diff install-tools.sh install-tools.sh.fixed 
323c323
<     run_progress tar vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
---
>     run_progress tar --bzip2 vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
```

## misc.
* brew install pyenv
* brew install pure
* mkdir .vimbackup
 
# Apps
* Dropbox	https://www.dropbox.com/downloading

* System Setting	keyboard for intenal and external	Caps lock > control
	Desktop & DOck > hot corner (Launch pad, ..)	
* Google Japanese Input, https://www.google.co.jp/ime/	
* KiCAD	https://www.kicad.org/
  * Java Runtime, freerouting, jlcpcb toolkit
* Obsidian, https://obsidian.md/
* Kindle
* FDClone	https://github.com/knu/FDclone	$make
* ranger	brew install ranger	Filer	
* EIZO screen instyle	eizo	cmd alt D, H