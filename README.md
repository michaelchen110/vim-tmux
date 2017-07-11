# zsh vimrc setting


install zsh && oh-my-zsh
```
brew install zsh
chsh -s /usr/local/bin/zs
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

setup my environment
```
git clone https://github.com/michaelchen110/Environment.git 
mv Environment/.* . && rm -r Environment
source ~/.zshrc
```

install vundle plugins
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install vim --with-lua
```