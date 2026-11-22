# Dotfiles

## Introduction

These are my dotfiles for the very few terminal tools I actually customize. This customization is not very deep and is still not automated.

Except for GNUstep, these dotfiles should work on any GNU/Linux distribution (and maybe even on macOS, BSD and any Unix[-like] operating system) as long as all the requirements are successfully met. Also, they have comments so that I and other people can understand what's going on, but be aware that everything is in Spanish.

Even so, everyone is free to copy and modify my dotfiles for any purpose. Be aware that, since there's currently no way to install these dotfiles automatically, you'll have to set them up by yourself and at your own risk.

Credit is not necessary though appreciated!

## Requirements

- General requirements:
    * Either [cURL](https://github.com/curl/curl) or [GNU Wget](https://www.gnu.org/software/wget/).
    * [FiraCode](https://github.com/tonsky/FiraCode).
    * FiraCode's [nerdfont](https://www.nerdfonts.com/).
    * [git](https://git-scm.com/).
    * [Node.js](https://nodejs.org) and [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).
    * [Powerline fonts](https://github.com/powerline/fonts).
- Neovim: 
    * Must be version `>= 0.12.6`.
- Vim: 
    * Must be version `>= 9.0.0438`.
    * [vim-plug](https://github.com/junegunn/vim-plug).
- Window Maker:
    * Check `GNUstep/Library/WindowMaker/Utils/autostart-list.txt` and modify it according to your needs, or install the software in that list.
    * The startup/shutdown sounds, as well as the shutdown dialog, require Tk, ttk, [playsound3](https://pypi.org/project/playsound3/) and [ttkthemes](https://pypi.org/project/ttkthemes/).
- Zsh: 
    * [pfetch](https://github.com/dylanaraps/pfetch).
    * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
    * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).

## Screenshots

### Zsh

![A screenshot of Xfce Terminal + Zsh using the dotfiles.](res/zsh.png)

### Neovim

![A screenshot of Neovim using the dotfiles.](res/nvim.png)

### Vim

![A screenshot of Vim using the dotfiles.](res/vim.png)

### Window Maker

![A screenshot of Window Maker in Debian 13 using the dotfiles.](res/wmaker.png)

## Author

| [![Autumn64](https://gravatar.com/avatar/c44db6ba631ec60aac70250f37cb8510c975091ef026aa63f885a1f3b46a8c21?s=70)](https://openfollow.social/@autumn64@mast.lat "Follow @autumn64@mast.lat on Mastodon") |
|---|
| [Mónica Gómez (Autumn64)](https://autumn64.neocities.org) |
