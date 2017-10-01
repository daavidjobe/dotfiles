
# Setup


ZSH_THEME="agnoster"
export ZSH=/Users/david/.oh-my-zsh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"


# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="/Users/david/Projects/go"
export PATH="$PATH:$GOPATH/bin"


# Config
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export UPDATE_ZSH_DAYS=13

# Plugins
plugins=(git)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "/Users/david/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
source ~/.bashrc
source $ZSH/oh-my-zsh.sh
