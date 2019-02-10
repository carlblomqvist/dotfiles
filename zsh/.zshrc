# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Check if connecting from tramp, is so; ignore config
[[ $TERM == "tramp" ]] && unsetopt zle && PS1='$ ' && return

# Make emacs realize it can use 256 colors
[[ $TERM == "eterm-color" ]] && export TERM=xterm-256color
# Path to your oh-my-zsh installation.
export ZSH=/home/carlb/.oh-my-zsh
export VISUAL="emacsclient -t"
export EDITOR="emacsclient -t"
alias e="emacsclient -t"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export TERM="xterm-256color"
# export LC_ALL="C"

# Powerline
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Set keyboard repeat rate
xset r rate 180 30

vicd()
{
    local dst="$(command vifm --choose-dir -)"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

bindkey -v
# PS1+='${VIMODE}'
# #   '$' for normal insert mode
# #   a big red 'I' for command mode - to me this is 'NOT insert' because red
# function zle-line-init zle-keymap-select {
#     DOLLAR='%B%F{green}$%f%b '
#     GIANT_I='%B%F{red}I%f%b '
#     VIMODE="${${KEYMAP/vicmd/$GIANT_I}/(main|viins)/$DOLLAR}"
#     zle reset-prompt
# }
zle -N zle-line-init
zle -N zle-keymap-select

# Add thefuck alias
eval $(thefuck --alias)
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
export LANG="en_US.utf8"

ZSH_THEME="powerlevel9k/powerlevel9k"

autoload zmv

# Fix ZSH vi mode backspace
bindkey "^?" backward-delete-char

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

#Export LC_CTYPE
export LC_CTYPE="en_US.UTF-8"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  command-not-found
  common-aliases
  fancy-ctrl-z
  git
  web-search
  # zsh-256color
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias load="sudo md407 load debug/code.s19"
alias mdgo="sudo md407 go"
# render images in terminal
alias icat="kitty +kitten icat"
# cd to current folder when exiting ranger
alias ranger="source ranger"
# alias ix=ix_wrapper

# import automatically generated aliases for shortcuts
source ~/.shortcuts

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
