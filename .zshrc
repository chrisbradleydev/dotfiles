#!/usr/bin/env zsh

# zsh modules
# https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html
# uncomment zmodload and zprof to enable profiling
# zmodload zsh/zprof

# %x → path of the file being executed (.zshrc)
# :A → resolve symlinks / canonical path
# :h → parent directory (the repo root)
export DOTFILES="${${(%):-%x}:A:h}"

fpath=($HOME/.local/share/zsh/functions $fpath)
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

# order matters
# exports first, then aliases, colors, and functions
source $DOTFILES/.exports
source $DOTFILES/.aliases
source $DOTFILES/.colors
source $DOTFILES/.functions

# load plugins
eval "$(sheldon source)"

# compinit
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit
compinit -u

# bind after deferred history-substring-search loads
zsh-defer bindkey '^[[A' history-substring-search-up
zsh-defer bindkey '^[[B' history-substring-search-down

# bind option + left and option + right
# terminal
bindkey '^[b' backward-word
bindkey '^[f' forward-word
# vscode
bindkey '\e[1;3D' backward-word
bindkey '\e[1;3C' forward-word

# bind shift + tab
# https://github.com/zsh-users/zsh-autosuggestions#key-bindings
bindkey '^[[Z' autosuggest-execute

# https://docs.docker.com/engine/cli/completion/#zsh
source <(docker completion zsh)

# https://github.com/Schniz/fnm
eval "$(fnm env)"

# https://cli.github.com
source <(gh completion -s zsh)

# https://gitlab.com/gitlab-org/cli
source <(glab completion -s zsh)

# https://github.com/helm/helm
source <(helm completion zsh)

# https://github.com/herdrdev/herdr
source <(herdr completion zsh)

# https://github.com/istio/istio
source <(istioctl completion zsh)

# https://github.com/jenv/jenv
eval "$(jenv init -)"

# https://github.com/kubernetes-sigs/kind
source <(kind completion zsh)

# https://github.com/kubernetes/kubernetes
source <(kubectl completion zsh)

# https://github.com/iximiuz/labctl
source <(labctl completion zsh)

# https://github.com/cantino/mcfly
eval "$(mcfly init zsh)"

# https://github.com/pyenv/pyenv
eval "$(pyenv init -)"

# https://github.com/pyenv/pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# https://github.com/rbenv/rbenv
eval "$(rbenv init - zsh)"

# https://github.com/regclient/regclient
eval "$(regctl completion zsh)"

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# bun completions
[[ -s $HOME/.bun/_bun ]] && source $HOME/.bun/_bun

# google cloud sdk completions
GC_SDK=$HOMEBREW_PREFIX/share/google-cloud-sdk
[[ -s $GC_SDK/completion.zsh.inc ]] && source $GC_SDK/completion.zsh.inc
[[ -s $GC_SDK/path.zsh.inc ]] && source $GC_SDK/path.zsh.inc

if [[ "$(whoami)" == "chris_bradley" ]]; then
    BREWBIN=$HOMEBREW_PREFIX/bin

    # CHANGIE=$BREWBIN/changie-git-analyzer
    # CHANGIE=$GOBIN/changie-git-analyzer
    [[ -s $CHANGIE ]] && source <($CHANGIE completion zsh)

    PLATCTL=$BREWBIN/platctl
    PLATCTL=$GOBIN/platctl
    [[ -s $PLATCTL ]] && source <($PLATCTL completion zsh)

    SWEETCTL=$BREWBIN/sweetctl
    # SWEETCTL=$GOBIN/sweetctl
    [[ -s $SWEETCTL ]] && source <($SWEETCTL completion zsh)
fi

# uncomment zmodload and zprof to enable profiling
# zprof
