# zmodload zsh/zprof
skip_global_compinit=1
ZPLUG_HOME=~/.zplug
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update
fi
source $ZPLUG_HOME/init.zsh

autoload -U add-zsh-hook
autoload -U compinit; compinit

# options
setopt append_history \
  hist_ignore_dups \
  hist_reduce_blanks \
  inc_append_history \
  share_history

# apply and customize spaceship theme
zplug "denysdovhan/spaceship-prompt", as:theme
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

# load oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/chucknorris", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
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

# fnm
eval "$(fnm env)"

# custom sources
source ~/.shell/aliases
source ~/.shell/exports
source ~/.shell/functions

# google cloud sdk path and autocomplete
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# stern autocomplete
[[ /usr/local/bin/stern ]] && source <(stern --completion=zsh)
