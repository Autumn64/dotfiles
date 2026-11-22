#!/bin/bash

# Se supone que hay varias herramientas para manejar dotfiles mediante enlaces simbólicos, tipo GNU Stow y así.
# Honestamente siento que usar algo así para mi caso de uso es como intentar matar una mosca con una bazuca. Es demasiado
# rollo para 3 dotfiles, por eso preferí usar el bueno y confiable rsync; igual no me importa sincronizar manualmente
# los archivos cuando me acuerde de actualizar este repo.

# Dotfiles de Neovim
if [ -e ~/.config/nvim ]; then
rsync -avzP ~/.config/nvim ./
fi

# Realmente ya no uso esta configuración de Vim (porque ahora uso Neovim), pero igual quise agregarla
# por si a alguien le sirve, y por si yo misma llego a utilizarla en el futuro.
if [ -e ~/.vimrc ]; then
rsync -avzP ~/.vimrc ./vim/
fi

# Configuración de Zsh
if [ -e ~/.zshrc ]; then
rsync -avzP ~/.zshrc ./zsh/
fi

# Ya no uso konsole por lo que estos archivos ya no se actualizan.
if [ -e ~/.local/share/konsole ]; then
rsync -avzP ~/.local/share/konsole/*.profile ./konsole/
rsync -avzP ~/.local/share/konsole/*.colorscheme ./konsole/
fi

# Configuración de GNUstep (incluyendo Window Maker)
if [ -e ~/GNUstep ]; then
rsync -avzP ~/GNUstep ./
fi