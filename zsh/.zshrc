# Hecho totalmente a manita con un poco de investigación para ya no
# depender de oh-my-zsh :333.

# Configuración del historial.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

# Aliases importantes.
alias ls='ls --color=auto'
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"

# Datos que deben ser mostrador por pfetch.
export PF_INFO="ascii title os kernel wm editor shell uptime pkgs memory palette"

# Navegación por el historial de zsh mediante las flechas del teclado.
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Navegación por palabra con ALT + flechas.
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified

# Sistema de autocompletado.
autoload -Uz compinit
compinit
# El autocompletado no distingue entre mayúsculas y minúsculas.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Selección por menú para coincidencias múltiples.
zstyle ':completion:*' menu select
# Margen de error para el autocompletado
zstyle ':completion:*' completer _complete _approximate

# Plugins.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autostart.
eval "$(starship init zsh)"
pfetch
