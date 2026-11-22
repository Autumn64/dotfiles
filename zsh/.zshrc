# Hecho totalmente a mano con un poco de investigación (y un dolor de cabeza bien fuerte), todo para ya no
# depender de oh-my-zsh :333.

# Permite actualizar dinámicamente el prompt y expandir las variables en este archivo.
setopt PROMPT_SUBST

# Configuración del historial.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

# Aliases que ocupo.
alias ls='ls --color=auto'
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"

# Datos que deben ser mostrador por pfetch.
export PF_INFO="ascii title os kernel wm editor shell uptime pkgs memory palette"

# Bindings del teclado (resulta que zsh no trae casi ningún binding por defecto).
# Para ver todos los comandos disponibles es con `zle -al`.
bindkey '^[[3~' delete-char
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
bindkey '\e[A' up-history
bindkey '\e[B' down-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Navegación por palabra (es útil sobre todo al trabajar con rutas).
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
# Margen de error para el autocompletado.
zstyle ':completion:*' completer _complete _approximate

# vcs_info es el plugin que lee la rama y los cambios cuando se hace `cd` sobre un repo de git.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats " %b%u%c"
zstyle ':vcs_info:git:*' actionformats " %b|%a%u%c"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr ' ✗'
zstyle ':vcs_info:git:*' stagedstr ' ✓'

precmd() {
# Verifica si hay archivos no trackeados en el repo, en cuyo caso coloca el signo `?`. También aplica
# el estilo al mensaje de vcs si está presente.
    vcs_info

    if [[ -n "${vcs_info_msg_0_}" ]]; then
        if [[ -n $(git ls-files --others --exclude-standard) ]]; then
            vcs_info_msg_0_+=" ?"
        fi
        vcs_info_msg_0_=$'%f\U00b7'" %F{155}${vcs_info_msg_0_}"
    fi
}

# Esta webada es el prompt que se va a mostrar al momento de que el usuario interactúe con el shell. En el caso de
# `RPROMPT` se imprime hasta la derecha del terminal.
#
# Cada expansión significa lo siguiente:
# - %F{color}: Pone el color del texto. Puede ser a 256 colores o HTML (si el terminal lo soporta).
# - %f: Reestablece el color del texto al predeterminado.
# - %n: Es el nombre del usuario actual.
# - %m: Es el nombre de la computadora.
# - %~: Imprime el nombre del directorio actual, o `~` si es la carpeta home.
# - %#: Imprime el caracter `%` si es un usuario normal, o `#` si es el usuario root (francamente me gustó más % que $).
# - %?: Imprime el código de estatus de salida del programa que se ejecutó inmediatamente antes de mostrar el shell.

PROMPT=$'\n╭─%F{183}\Uf09f1 %n@%m %f\U00b7 %F{211}\Uf07b %~ ${vcs_info_msg_0_} \n%f╰─%F{117}\Uf08c7 %f%# '
RPROMPT=$'%F{211}%?'

# Plugins.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autostart.
pfetch
