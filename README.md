# zsh vimrc setting


install zsh && oh-my-zsh
```
brew install zsh
chsh -s /usr/local/bin/zs
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

<<<<<<< HEAD
setup my environment
```
git clone https://github.com/michaelchen110/Environment.git 
mv Environment/.* . && rm -r Environment
=======
zsh-autosuggestions
```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# add this line into .zshrc
plugins=(zsh-autosuggestions)
# add this line into this file
bindkey '^l' autosuggest-accept
$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Add into ~/.vimrc
```
"autocmd BufEnter * silent! lcd %:p:h
set autochdir
set tags+=tags;/
```

Powerline
```
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

setup my environment
```
git clone https://github.com/michaelchen110/Environment.git 
mv Environment/.* . || rm -r Environment
>>>>>>> dd5f6ebd7291185119b510f5e3a808cd217616fa
source ~/.zshrc
```

install vundle plugins
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install vim --with-lua
```
