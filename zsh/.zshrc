# Uncomment this + the last line to debug ZSH
# zmodload zsh/zprof

# Check if connecting from tramp, is so; ignore config
[[ $TERM == "tramp" ]] && unsetopt zle && PS1='$ ' && return

# Make emacs realize it can use 256 colors
[[ $TERM == "eterm-color" ]] && export TERM=xterm-256color

export VISUAL="emacs -nw"
export EDITOR="emacs -nw"
#alias e="emacsclient -c --socket-name doom"

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

# lf change-dir and remove mounted archives
lfcd () {
    tmp="$(mktemp)"
    fid="$(mktemp)"
    lf -command '$printf $id > '"$fid"'' -last-dir-path="$tmp" "$@"
    id="$(cat "$fid")"
    archivemount_dir="/tmp/__lf_archivemount_$id"
    if [ -f "$archivemount_dir" ]; then
        cat "$archivemount_dir" | \
            while read -r line; do
                sudo umount "$line"
                rmdir "$line"
            done
        rm -f "$archivemount_dir"
    fi
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# vifm change-dir
function vicd()
{
    local dst="$(command vifmrun --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# geometry
GEOMETRY_PROMPT_PLUGINS=(virtualenv exec_time git hg +vi-mode)
source ~/git/geometry/geometry.zsh

# use vi-mode
bindkey -v

# use zmv
autoload zmv
alias mv="zmv"

# Auto completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

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

# oh-my-zsh plugins??
# plugins=(
#   colored-man-pages
#   command-not-found
#   common-aliases
#   fancy-ctrl-z
#   # git
#   history-substring-search
#   vi-mode
#   web-search
#   zsh-autosuggestions
#   zsh-syntax-highlighting
# )

# source $ZSH/oh-my-zsh.sh

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
# cd to current folder when exiting file manager
alias lf=lfcd
alias ranger="source ranger"
#use ripgrep
alias grep=rg
alias ls="exa"
alias la="exa -la"
alias bat="bat --color always"
# alias ix=ix_wrapper
alias doomr="systemctl --user restart doom"
alias kdiff="kitty +kitten diff"
alias dwmt="dm-tool add-nested-seat --fullscreen"
alias java10="/usr/lib/jvm/java-10-openjdk/bin/java"
alias javac10="/usr/lib/jvm/java-10-openjdk/bin/javac"
alias picom="picom -bc --unredir-if-possible --config ~/.config/compton/config"
alias vifm=vicd
alias midi="fluidsynth -a alsa -m alsa_seq -l -i /usr/share/soundfonts/FluidR3_GM.sf2"
alias make="make -j10"
vscode() { command emacs "$@" > /dev/null 2>&1 & }
# my favourite alias
alias ..="cd .."

# import automatically generated aliases for shortcuts
source ~/.shortcuts

# import secrets
source ~/.secrets/.secrets

# activate fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/fzf

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

## History command configuration
SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history
setopt extended_history        # record timestamp of command in HISTFILE
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups        # ignore duplicated commands history list
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_verify             # show command with history expansion to user before running it
setopt inc_append_history_time # add commands to HISTFILE in order of execution
setopt share_history           # share command history data


# Uncomment this + the first line to debug ZSH
# zprof
