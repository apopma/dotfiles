# ruby enterprise settings
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# git
alias coma="git checkout master"
alias ga="git add"
alias gbl="git blame"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gish="git stash"
alias gp="git pull"
alias gs="git status"

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

# docker
# eval "$(docker-machine env default)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# derp
alias xyzzy="echo 'Nothing happens.'"
