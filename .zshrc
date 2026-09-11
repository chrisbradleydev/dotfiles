#!/usr/bin/env zsh

# zsh modules
# https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html
# uncomment zmodload and zprof to enable profiling
# zmodload zsh/zprof

# %x → path of the file being executed (.zshrc)
# :A → resolve symlinks / canonical path
# :h → parent directory (the repo root)
export DOTFILES="${${(%):-%x}:A:h}"

skip_global_compinit=1
HISTFILE=$HOME/.zsh_history
HISTSIZE=30000
SAVEHIST=30000

# zsh options
# https://zsh.sourceforge.io/Doc/Release/Options-Index.html
# navigation
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
# history
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# spaceship-prompt options
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

# fzf options
export FZF_DEFAULT_OPTS="--border --layout=reverse --no-sort --prompt=\"ಠ_ಠ \""

# functions
# https://zsh.sourceforge.io/Doc/Release/Functions-Index.html
autoload -Uz add-zsh-hook
autoload -Uz compinit

# platform detection and have() helper
source $DOTFILES/.platform

# order matters
# exports first, then aliases, colors, and functions
# each shared file may have an optional .$DOTFILES_OS sibling
for f in exports aliases colors functions; do
    source $DOTFILES/.$f
    [[ -r $DOTFILES/.$f.$DOTFILES_OS ]] && source $DOTFILES/.$f.$DOTFILES_OS
done

# load plugins
export SHELDON_PROFILE=$DOTFILES_OS
eval "$(sheldon source)"

# completions: your own overrides first, then brew formulas, then system.
# $HOMEBREW_PREFIX is set by the .exports.$os sibling above; compinit reads
# fpath below. (N-/) drops entries whose directory doesn't exist.
typeset -U fpath FPATH
fpath=(
    $HOME/.local/share/zsh/functions(N-/)
    $HOMEBREW_PREFIX/share/zsh/site-functions(N-/)
    $fpath
)

# compinit
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit
compinit -u

# https://github.com/Schniz/fnm
have fnm && eval "$(fnm env)"

# https://github.com/jenv/jenv
have jenv && eval "$(jenv init -)"

# https://github.com/cantino/mcfly
have mcfly && eval "$(mcfly init zsh)"

# https://github.com/pyenv/pyenv
have pyenv && eval "$(pyenv init -)"

# https://github.com/pyenv/pyenv-virtualenv
have pyenv && eval "$(pyenv virtualenv-init -)"

# https://github.com/rbenv/rbenv
have rbenv && eval "$(rbenv init - zsh)"

# https://github.com/ajeetdsouza/zoxide
have zoxide && eval "$(zoxide init zsh)"

# bun completions
[[ -s $HOME/.bun/_bun ]] && source $HOME/.bun/_bun

# os-specific and per-machine overrides
[[ -r $DOTFILES/.zshrc.$DOTFILES_OS ]] && source $DOTFILES/.zshrc.$DOTFILES_OS
[[ -r $DOTFILES/.zshrc.local ]] && source $DOTFILES/.zshrc.local

# uncomment zmodload and zprof to enable profiling
# zprof
