# Aliases
alias ll="ls -lah"
alias ng="npm list -g --depth=0"
alias yg="yarn global list"
alias bcl="brew cask list"
alias bsl="brew services list"
alias buu="brew update && brew upgrade && brew cleanup"
alias dcl="docker ps -a"
alias dcu="docker-compose up"
alias dnl="docker network ls"
alias dsp="docker system prune -af"
alias ga="git add ."
alias gc="git commit -n"
alias gl="git log --graph --oneline --decorate"
alias gp="git pull"
alias gs="git status"
alias gca="git commit -n --amend --no-edit"
alias gcd="git checkout develop"
alias gcm="git checkout master"
alias gfo="git fetch origin develop:develop"
alias gfp="git push --force-with-lease"
alias gir="git rebase -i develop"
alias cdbit="cd ~/Repos/bitbucket.org"
alias cdhub="cd ~/Repos/github.com"
alias cdlab="cd ~/Repos/gitlab.com"

# Paths
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="/Users/chrisbradley/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export RUST_SRC_PATH="/usr/local/share/rust/rust_src"
export GOPATH="$HOME/Documents/go"
export PATH="$GOPATH/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
