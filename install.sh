sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

gem install solargraph
curl https://sh.rustup.rs -sSf | sh
rustup component add rls-preview rust-analysis rust-src
