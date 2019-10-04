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
export VISUAL="emacsclient -c --socket-name doom"
export EDITOR="emacsclient -c --socket-name doom"
alias e="emacsclient -c --socket-name doom"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export TERM="xterm-256color"
# export LC_ALL="C"

setxkbmap `cat .Xkbmap`
# emacs or emacsclient to use
function _emacsfun
{
    # Replace with `emacs` to not run as server/client
    emacsclient -c --socket-name doom $@
}

# An emacs 'alias' with the ability to read from stdin
function em
{
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile.
    if [[ $1 == - ]]; then
        tempfile=$(mktemp emacs-stdin-$USER.XXXXXXX --tmpdir)
        cat - > $tempfile
        _emacsfun -e "(progn (find-file \"$tempfile\")
                             (set-visited-file-name nil)
                             (rename-buffer \"*stdin*\" t))
                 " 2>&1 > /dev/null
    else
        _emacsfun "$@"
    fi
}

# geometry
GEOMETRY_PROMPT_PLUGINS=(virtualenv exec_time git hg +vi-mode)
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
alias doomr="systemctl --user restart doom"
alias kdiff="kitty +kitten diff"
alias dwmt="dm-tool add-nested-seat --fullscreen"

# import automatically generated aliases for shortcuts
source ~/.shortcuts

# activate fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/fzf

export PATH=$PATH:/home/carlb/courses/tda384_concurrent_programming/tsim/world/bin

# Uncomment this + the first line to debug ZSH
# zprof
