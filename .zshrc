
# Setup


ZSH_THEME="spaceship"
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
source $ZSH/oh-my-zsh.sh


# Aliases
alias config='/usr/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER'
alias v="~/.config/nvim/bin/nvim"


# Mirror vim configs
ln -sf .vim/ .config/nvim/
ln -f ~/.vimrc ~/.config/nvim/init.vim


# Work specific stuffs
alias bokus-dev="ssh creunadavidj@mobil-dev.bokus.com"

