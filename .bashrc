# brew
alias b="brew"
alias bc="brew cask"
alias bs="brew services"
alias buu="brew update && brew upgrade && brew cleanup"

# composer
alias c="composer"
alias ci="composer install"

# directory
alias cd..="cd .."
alias cdbin="cd /usr/local/bin"
alias cdbit="cd ~/Repos/bitbucket.org"
alias cdhub="cd ~/Repos/github.com"
alias cdlab="cd ~/Repos/gitlab.com"
alias ll="ls -lah"
alias o="open ."

#docker
alias d="docker"
alias db="docker build"
alias dc="docker-compose"
alias dcl="docker ps -a"
alias dcu="docker-compose up"
alias dil="docker images"
alias dir="docker image rm"
alias dnl="docker network ls"
alias dp="docker push"
alias ds="docker stop"
alias dsp="docker system prune -af"

# git
alias ga="git add ."
alias gc="git commit -n"
alias gca="git commit -n --amend --no-edit"
alias gcb="git checkout -b"
alias gcd="git checkout develop"
alias gcm="git checkout master"
alias gcp="git checkout -"
alias gfo="git fetch origin develop:develop"
alias gfp="git push --force-with-lease"
alias gl="git log --graph --oneline --decorate"
alias gm="git merge"
alias gp="git pull"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grd="git rebase -i develop"
alias gs="git status"
alias gsc="git stash clear"
alias gsd="git stash drop"
alias gsl="git stash list"
alias gsp="git stash pop"

# helm
alias h="helm"
alias hc="helm create"
alias hg="helm get"
alias hi="helm install"
alias hid="helm install --debug --dry-run"
alias hl="helm lint"
alias hp="helm package"
alias hs="helm search"
alias hu="helm uninstall"

# history
alias hg="history | grep"

# kubernetes
alias k="kubectl"
alias ka="kubectl apply"
alias kc="kubectl create"
alias kcg="kubectl config get-contexts"
alias kcu="kubectl config use-context"
alias kd="kubectl describe"
alias ked="kubectl edit"
alias kex="kubectl exec -it"
alias kg="kubectl get"
alias kgi="kubectl get ingress"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kp="kubectl proxy"
alias ks="kubectl scale"

# minikube
alias mk="minikube"
alias mka="minikube addons"
alias mks="minikube service"

# node
alias nv="node -v"

# npm
alias naf="npm audit fix"
alias nc="npm ci"
alias ng="npm list --global --depth=0"
alias nh="npm home"
alias ni="npm install"
alias nid="npm install --global"
alias nig="npm install --save-dev"
alias no="npm outdated"
alias nr="npm repo"
alias nrb="npm run build"
alias nrd="npm run dev"
alias nrl="npm run lint"
alias nrs="npm run serve"
alias nrsb="npm run ssr:build"
alias nrss="npm run ssr:serve"
alias nrst="npm run start"
alias nrt="npm run test"
alias nrw="npm run watch"
alias nu="npm uninstall"

# sublime text
alias stb="st ~/.bashrc"
alias sth="st /etc/hosts"
alias stz="st ~/.zshrc"
alias stzh="st ~/.zsh_history"

# vscode
alias vs="code ."

# yarn
alias yb="yarn build"
alias yd="yarn dev"
alias yg="yarn global list"
alias ys="yarn serve"

# environment variables
export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export RUST_SRC_PATH="/usr/local/share/rust/rust_src"
export GOPATH="$HOME/Documents/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="/Users/chrisbradley/.composer/vendor/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
