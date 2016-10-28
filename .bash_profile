# ruby enterprise settings
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# git
alias coma="git checkout master"
alias fuckit="git reset --hard"
alias ga="git add"
alias gib="git blame"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gish="git stash"
alias gp="git pull"
alias gs="git status"
alias todos="git grep -n --ignore-case todo"
alias repomasters="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"


# bundler
alias be="bundle exec"
alias bi="bundle install"

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
alias adb="~/Library/Android/sdk/platform-tools/adb"

# version managers
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# derp
alias xyzzy="echo 'Nothing happens.'"
