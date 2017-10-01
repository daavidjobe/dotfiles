#DOTFILES

##INSTALL

1. Backpup your old dotfiles

2. Clone dotfiles into a bare repository in a "dot" folder of your $HOME:  
```git clone --bare git@bitbucket.org:daavidjobe/dotfiles.git $HOME/.cfg```

3. Set config alias
```alias config='/usr/bin/git --git-dir=/Users/$USER/.cfg/ --work-tree=/Users/$USER'```  

4. Checkout the actual content  
```config checkout```

5. Ignore untracked files  
```config config --local status.showUntrackedFiles no```
