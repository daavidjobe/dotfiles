
# Setup


ZSH_THEME="spaceship"
export ZSH=/Users/$USER/.oh-my-zsh

# Rust
export RUST_SRC_PATH="$HOME/.src/rust/src"
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="/Users/$USER/Projects/go"
export PATH="$PATH:$GOPATH/bin"


# Config
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export UPDATE_ZSH_DAYS=13

export TERM=xterm-256color

# Plugins
plugins=(git)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "/Users/$USER/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


# Aliases
alias config='/usr/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER'
alias v="/usr/local/bin/nvim"
alias v-conf="v ~/.config/nvim/init.vim"

alias bokus-dev="ssh netdavidj@mobil-dev.bokus.com"
alias bokus-test="ssh davjob@test.bokus.com"
alias tfat-dev="ssh tfat@167.99.250.63"
alias trs-dev="ssh transportsedeln@31.216.36.106"
alias ipeer="ssh ???"
alias nessus="ssh root@209.97.136.189"

# Squash last X commits with a Commit message.
# Usage: squash X 'COMMIT_MSG'
# where X= Number of last commits.
# where COMMIT_MSG= New commit msg.
function squash () {
  if [ -z "${1}" -o -z "${2}" ]; then
    return 1
  fi
  git reset --soft HEAD~"$1"
  git commit -am "$2"
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
