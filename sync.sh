#!/bin/bash

# Se supone que hay varias herramientas para manejar dotfiles mediante enlaces simbólicos, tipo GNU Stow y así.
# Honestamente siento que usar algo así para mi caso de uso es como intentar matar una mosca con una bazuca. Es demasiado
# rollo para 3 dotfiles, por eso preferí usar el bueno y confiable rsync; igual no me importa sincronizar manualmente
# los archivos cuando me acuerde de actualizar este repo.

# Dotfiles de Neovim
rsync -avzP ~/.config/nvim ./

# Realmente ya no uso esta configuración de Vim (porque ahora uso Neovim), pero igual quise agregarla
# por si a alguien le sirve, y por si yo misma llego a utilizarla en el futuro.
rsync -avzP ~/.vimrc ./vim/

# Configuración de Zsh
rsync -avzP ~/.zshrc ./zsh/

# Archivos de Konsole. Realmente sólo uso un perfil con un colorscheme, si bien me prevengo por si en el futuro
# decido guardar algo más.
rsync -avzP ~/.local/share/konsole/*.profile ./konsole/
rsync -avzP ~/.local/share/konsole/*.colorscheme ./konsole/

# Configuración de GNUstep (incluyendo Window Maker)
rsync -avzP ~/GNUstep ./