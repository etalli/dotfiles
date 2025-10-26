# my configuraton for MacOS

[Google spreadsheeta](
https://docs.google.com/spreadsheets/d/1nGlX5QW-kHIF5Evnk0yIMLczgUsKVIw4vEqRmW-1FRc/edit?usp=sharing)

## Useful tools

* Chrome (Google Web Browser)
* [Homebrew](https://brew.sh/) (command line tool)
  + [brew.sh](brew.sh) (installation script)
  + pure (zsh prompt)
  + $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  + $ brew doctor
* basic tools
  + $ brew install git zsh wget python@3
  + $ brew install fzf ripgrep htop
  + $ brew install --cask visual-studio-code iterm2 docker
  + $ brew install tree node pnpm camke bat jq 
* rectangles (window arrangement tool)
* Visual Source Code (Microsoft text editor)
  Make sure the exteions is *.md. if not, it doesn't work.
  + Markdown All in One
    - preview by side: cmd+k, v
    - Ctrl/Cmd + Shift + V, Toggle preview
    - Ctrl/Cmd + K V, Toggle preview to side
  + Paste Image
  + set target image directory
    - shift, alt(option), v
  + [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
  + Prettier
  + Markdown Preview Github Styling
  + Git Graph
* xcode - Apple development environment
 + $ xcode-select --install
 + $ xcode-select -p
   + the output should be "/Library/Developer/CommandLineTools"

## Applications

* [GitHub Desktop](https://desktop.github.com/)
* [KiCAD](https://www.kicad.org/)
* [vscode](https://code.visualstudio.com/)
* [draw.io desktop](https://github.com/jgraph/drawio-desktop/releases/)
* [X]
* [Slack]

## Keyboard

* [QMK Firmware](https://docs.qmk.fm/)


## How to show the dot files in Finder

$ defaults write com.apple.finder AppleShowAllFiles true

and needs to restart Finder from Terminal by
$ killall Finder

To set the default setting,
$ defaults write com.apple.finder AppleShowAllFiles false
then,
$ killall Finder


## System setting

* how to active only external monitor?
  * set the mirroring mode
  * set your Mac brightness as low as possible from the touch bar, then the screen will be blacked and disabled.


## Sony Spresense build environment

Need to modify the unarchive option for bizp2.

```sh
% diff install-tools.sh install-tools.sh.fixed 
323c323
<     run_progress tar vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
---
>     run_progress tar --bzip2 vjxf ${_fn}  --strip-components=1 -C ${SPRROOT}/usr
```
