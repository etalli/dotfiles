# my configuraton for MacOS

## Useful tools

* Chrome (Google web browser)
* [Homebrew](https://brew.sh/) (command line tool)
  + [brew.sh](brew.sh) (installation script)
  + pure (zsh prompt)
* rectangles (window arrangement tool)
* iterm (terminal)
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

## Applications

* [GitHub Desktop](https://desktop.github.com/)
* [KiCAD 7.0.8](https://www.kicad.org/)
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
