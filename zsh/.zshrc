# Esta configuración fue en gran medida generada automáticamente por ohmyzsh y por herramientas como node o deno, 
# con muchas modificaciones que hice a mano. Es decir, este entorno es en gran medida predeterminado,
# con clara excepción de las adiciones al PATH y los aliases, y además le quité toda la bola de comentarios que
# pone en automático y que hacen que el archivo sea innecesariamente grande.

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/autumn64/.zsh/completions:"* ]]; then export FPATH="/home/autumn64/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)
# Este es para la información  que se debe de mostrar con pfetch
export PF_INFO="ascii title os kernel wm editor shell uptime pkgs memory palette"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"
alias cdgit="cd /mnt/hdd/Documents/Git"

# Created by `pipx` on 2024-10-18 23:35:38
export PATH="$PATH:/home/autumn64/.local/bin"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
. "/home/autumn64/.deno/env"

# Neovim
export PATH=$PATH:/opt/nvim/

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

pfetch
