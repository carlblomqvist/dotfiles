# Uncomment this + the last line to debug ZSH
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Check if connecting from tramp, is so; ignore config
[[ $TERM == "tramp" ]] && unsetopt zle && PS1='$ ' && return

# Make emacs realize it can use 256 colors
[[ $TERM == "eterm-color" ]] && export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=/home/carlb/.oh-my-zsh
export VISUAL="emacsclient -t --socket-name spacemacs"
export EDITOR="emacsclient -t --socket-name spacemacs"
alias e="emacsclient -t --socket-name spacemacs"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export TERM="xterm-256color"
# export LC_ALL="C"

# Powerline
# powerline-daemon -q
# . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history vi_mode)
# export DEFAULT_USER=carlb
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# POWERLEVEL9K_VI_INSERT_MODE_STRING="INS"
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="NOR"

# Set keyboard repeat rate
xset r rate 180 30

# Change dir when leaving vifm
# vicd()
# {
#     local dst="$(command vifm --choose-dir -)"
#     if [ -z "$dst" ]; then
#         echo 'Directory picking cancelled/failed'
#         return 1
#     fi
#     cd "$dst"
# }

# Vi-mode incicator
# PS1+='${VIMODE}'
# #   '$' for normal insert mode
# #   a big red 'I' for command mode - to me this is 'NOT insert' because red
# function zle-line-init zle-keymap-select {
#     DOLLAR='%B%F{green}$%f%b '
#     GIANT_I='%B%F{red}I%f%b '
#     VIMODE="${${KEYMAP/vicmd/$GIANT_I}/(main|viins)/$DOLLAR}"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# Add thefuck alias
# eval $(thefuck --alias)

# powerline theme
# ZSH_THEME="powerlevel9k/powerlevel9k"

# geometry
GEOMETRY_PROMPT_PLUGINS=(exec_time git hg +vi-mode)
source ~/git/geometry/geometry.zsh

# use zmv
autoload zmv
alias mv="zmv"

# Reduce waittime when switching modes in vi-mode
export KEYTIMEOUT=1

# Fix ZSH vi mode backspace
bindkey "^?" backward-delete-char

#Export LC_CTYPE
export LANG="en_US.utf8"
export LC_CTYPE="en_US.UTF-8"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
  colored-man-pages
  command-not-found
  common-aliases
  fancy-ctrl-z
  # git
  history-substring-search
  vi-mode
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

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

# activate fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Uncomment this + the first line to debug ZSH
# zprof
