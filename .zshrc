export ZSH="/Users/popmaada/.oh-my-zsh"
ZSH_THEME="un"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------

alias reload='source ~/.zshrc'

# git
alias be="bundle exec"
alias bi="bundle install"
alias coma="git checkout master"
alias fuckit="git reset --hard"
alias ga="git add"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gib="git blame"
alias gish="git stash"
alias gp="git pull"
alias gs="git status"
alias ll="ls -al"
alias todos="git grep -n --ignore-case todo"
alias repomasters="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

# sweber's git dotfiles
pretty='--pretty=format:%C(green)%h%C(yellow)%d%Creset %s %C(cyan)%an, %ar%Creset'
prettylong='--pretty=format:%C(green)%H%C(yellow)%d%Creset %s %C(cyan)%an, %ar%Creset'

alias gl='git log "$pretty" --graph -n 12'
alias gll='git log "$prettylong" --graph -n 12'
alias gosh="git rev-parse head | xargs echo -n | pbcopy" # copy current HEAD sha

function git-files() {
  git ls-tree --full-tree -r --name-only HEAD
}

function pullem() {
  REPOS_DIR=$(pwd)
  find . -name .git -type d -prune | while read repo; do
    cd ${repo}/..
    echo "Pulling $(pwd)..."
    git checkout master
    git pull
    echo
    cd $REPOS_DIR
  done

  cd $REPOS_DIR; unset REPOS_DIR
}

# docker
# eval "$(docker-machine env default)"

# vbox
alias vbm="vboxmanage"

# android
alias adb="~/Library/Android/sdk/platform-tools/adb"

# k8s
alias kc="kubectl"

# terraform
alias tf="terraform"

# aws
source ~/repos/dotfiles/.aws_secrets.sh
export SAM_CLI_TELEMETRY=0

# python
export PATH=$PATH:~/.poetry/bin
eval "$(pyenv init -)"

# derp
alias xyzzy="echo 'Nothing happens.'"
