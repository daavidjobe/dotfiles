#DOTFILES

##INSTALL

1. Backpup your old dotfiles

2. Clone dotfiles into a bare repository in a "dot" folder of your $HOME:  
```git clone --bare <git-repo-url> $HOME/.cfg```

3. Checkout the actual content  
```config checkout```

4. Ignore untracked files  
```config config --local status.showUntrackedFiles no```
