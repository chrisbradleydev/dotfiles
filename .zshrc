# zmodload zsh/zprof
skip_global_compinit=1
ZPLUG_HOME=~/.zplug
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000

# check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update
fi
source $ZPLUG_HOME/init.zsh

fpath=(~/.local/share/zsh/functions $fpath)
autoload -Uz add-zsh-hook
autoload -Uz compinit
compinit -u

# aliases, exports, and functions
source ~/.shell/aliases
source ~/.shell/exports
source ~/.shell/functions

# options
setopt append_history \
  hist_ignore_dups \
  hist_reduce_blanks \
  inc_append_history

# apply and customize spaceship theme
zplug "denysdovhan/spaceship-prompt", as:theme
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

# oh-my-zsh plugins
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/chucknorris", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "plugins/fnm", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/macos", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh

# miscellaneous plugins
zplug "Aloxaf/fzf-tab"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# plugin options
export FZF_DEFAULT_OPTS="--border --layout=reverse --no-sort --prompt=\"ಠ_ಠ \""

# ensure packages are installed then load
zplug check || zplug install
zplug load # --verbose

# bind up and down arrow keys
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# bind option + left and option + right
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

# https://github.com/Schniz/fnm
eval "$(fnm env)"

# https://github.com/helm/helm
source <(helm completion zsh)

# https://github.com/istio/istio
source <(istioctl completion zsh)

# https://github.com/jenv/jenv
eval "$(jenv init -)"

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

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# bun completions
[[ -s $HOME/.bun/_bun ]] && source $HOME/.bun/_bun

# google cloud sdk completions
GC_SDK=$HOMEBREW_PREFIX/share/google-cloud-sdk
[[ -s $GC_SDK/completion.zsh.inc ]] && source $GC_SDK/completion.zsh.inc
[[ -s $GC_SDK/path.zsh.inc ]] && source $GC_SDK/path.zsh.inc

# platform-operator completions
[[ -s $HOME/go/bin/platctl ]] && source <($HOME/go/bin/platctl completion zsh)

# profiling with zprof
# zprof
