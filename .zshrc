
# Setup


ZSH_THEME="spaceship"
export ZSH=/Users/$USER/.oh-my-zsh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/Projects/rust/src"


# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="/Users/$USER/Projects/go"
export PATH="$PATH:$GOPATH/bin"


# Config
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export UPDATE_ZSH_DAYS=13

# Plugins
plugins=(git)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "/Users/$USER/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
source $ZSH/oh-my-zsh.sh


# Aliases
alias config='/usr/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER'
alias v="/usr/local/bin/nvim"


# Work specific stuffs
alias bokus-dev="ssh netdavidj@mobil-dev.bokus.com"

# Squash last X commits with a Commit message.
# Usage: squash X 'COMMIT_MSG'
# where X= Number of last commits.
# where COMMIT_MSG= New commit msg.
function squash () {
  if [ -z "${1}" -o -z "${2}" ]; then
    return 1
  fi
  git reset --soft HEAD~"$1"
  git add -A && git commit -m "$2" # With 100 emoji
  git push --force
}
