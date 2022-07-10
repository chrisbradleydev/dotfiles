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

autoload -Uz add-zsh-hook
autoload -Uz compinit; compinit

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
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

# load oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
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

# load miscellaneous
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ensure packages are installed then load
zplug check || zplug install
zplug load # --verbose

# bind up and down arrow keys
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# https://github.com/Schniz/fnm
eval "$(fnm env)"

# https://github.com/jenv/jenv
eval "$(jenv init -)"

# https://github.com/cantino/mcfly
eval "$(mcfly init zsh)"

# bun completions
[[ -s $HOME/.bun/_bun ]] && source $HOME/.bun/_bun

# google cloud sdk completions
[[ -s $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]] \
  && source $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
[[ -s $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]] \
  && source $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# stern completions
[[ -s /usr/local/bin/stern ]] && source <(stern --completion=zsh)

# profiling with zprof
# zprof
