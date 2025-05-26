# zmodload zsh/zprof
skip_global_compinit=1
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000

# spaceship-prompt options
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

# fzf options
export FZF_DEFAULT_OPTS="--border --layout=reverse --no-sort --prompt=\"ಠ_ಠ \""

# load plugins
eval "$(/opt/homebrew/bin/sheldon source)"

fpath=(~/.local/share/zsh/functions $fpath)
autoload -Uz add-zsh-hook
autoload -Uz compinit
compinit -u

# aliases, exports, and functions
source ~/.dotfiles/.aliases
source ~/.dotfiles/.exports
source ~/.dotfiles/.functions

# options
setopt append_history \
    hist_ignore_all_dups \
    hist_ignore_space \
    hist_reduce_blanks \
    inc_append_history

# bind up and down arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind option + left and option + right
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

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

# https://github.com/istio/istio
source <(istioctl completion zsh)

# https://github.com/jenv/jenv
eval "$(jenv init -)"

# https://github.com/kubernetes-sigs/kind
source <(kind completion zsh)

# https://github.com/kubernetes/kubernetes
source <(kubectl completion zsh)

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
    # platform-operator completions
    [[ -s $HOME/go/bin/platctl ]] && source <($HOME/go/bin/platctl completion zsh)
    # sweetctl completions
    [[ -s $HOME/go/bin/sweetctl ]] && source <($HOME/go/bin/sweetctl completion zsh)
fi

# profiling with zprof
# zprof
