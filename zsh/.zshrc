# Check if connecting from tramp, is so; ignore config
[[ $TERM == "tramp" ]] && unsetopt zle && PS1='$ ' && return

# Make emacs realize it can use 256 colors
[[ $TERM == "eterm-color" ]] && export TERM=xterm-256color

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
PATH="$HOME/.local/bin:$PATH"
source ~/.zprofile

# Set directory for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# fzf
if [ ! -d "${HOME}/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
if [ ! -f "${HOME}/.local/bin/zoxide" ]; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Add in Powerlevel 10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion) # try to suggest from history, otherwise from completion

zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::sudo

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char
bindkey "^W" forward-word # ctrl+w to partially accept suggestions from zsh-autosuggestions
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
zstyle ':autocomplete:tab:*' completion fzf
bindkey -M viins '^[j' down-line-or-select
bindkey -M viins '^[k' up-line-or-search
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history

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

# History
# Nof commands to be saved
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# Erase duplicates
HISTDUP=erase
# Append instead of overwrite
setopt extended_history        # record timestamp of command in HISTFILE
setopt hist_verify             # show command with history expansion to user before running it
setopt inc_append_history_time # add commands to HISTFILE in order of execution
setopt appendhistory           # append instead of overwrite
setopt sharehistory            # Share history between terminals
setopt hist_ignore_space       # Space in front of command will not append to history
setopt hist_ignore_all_dups    # No duplicates!!
setopt hist_save_no_dups       # No duplicates!!
setopt hist_ignore_dups        # No duplicates!!

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # ignore case
zstyle ':completion:*' list-colors '${(s.:.)LSCOLORS}' # colors in completion
zstyle ':completion:*' menu no #disable default completion menu (use fzf instead)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' #preview directory in completions
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' #preview directory for zoxide

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

# Stuff
export VISUAL="nvim"
export EDITOR="nvim"

# Alises
alias vim="nvim"
alias ranger="source ranger"
alias grep=rg
alias ls="exa"
alias la="exa -la"
alias bat="bat --color always"
alias kdiff="kitty +kitten diff"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# Git
alias gd="git diff"
alias gs="git status" # conflicts Ghostscript
alias gc="git commit" # conflicts graphviz
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias ga="git add"
alias gau="git add -u"
alias gp="git push"
alias gl="git log"
alias glo="git log origin/master"
alias gf="git fetch"
alias gr="git rebase"
alias gro="git rebase origin/master"
alias grio="git rebase -i origin/master"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gall="gau && gcan && gf && gro && gp"

# import automatically generated aliases for shortcuts
source ~/.shortcuts
