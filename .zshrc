# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/popmaada/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="un"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -----------------------------------------------

# .env loading in the shell
# Inspired by http://stackoverflow.com/a/21831665/589391 and
# https://github.com/gchaincl/dotenv.sh, then re-inspired
# by the "set -a" trick from timwis and given me by gsf

dotenv() {
  set -a
  [ -f .env ] && source .env
  set +a
}

# Run dotenv on login
dotenv

# Run dotenv on every new directory
cd() {
  builtin cd $@
  dotenv
}

alias reload='source ~/.zshrc'

# git
alias coma="git checkout master"
alias fuckit="git reset --hard"
alias ga="git add"
alias gbr="git branch"
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

# android
alias adb="~/Library/Android/sdk/platform-tools/adb"

# k8s
alias kc="kubectl"

# terraform
alias tf="terraform"

# aws
source ~/repos/dotfiles/scripts/ct.sh
source ~/repos/dotfiles/scripts/aws_login.sh

# derp
alias xyzzy="echo 'Nothing happens.'"
