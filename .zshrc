
### Setup

export ZSH=/Users/david/.oh-my-zsh

ZSH_THEME="agnoster"


source ~/.bashrc
source $ZSH/oh-my-zsh.sh

### Paths

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="/Users/david/Projects/go"
export PATH="$PATH:$GOPATH/bin"



source "/Users/david/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
