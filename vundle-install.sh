#!/bin/bash

#install from professor example

mkdir -p ~/.vim/bundle
#Clone Vundle repository
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#create backup of current .vimrc file
if [ -f ~/.vimrc ]; then
	    mv ~/.vimrc ~/.vimrc.backup
fi
echo "Vundle has been successfully installed"
echo "Removed Vundle default vimrc"

ln -s ~/dotfiles/vimrc ~/.vimrc
echo "Replaced with repo vimrc"

vim +PluginInstall +qall
echo "Installed plugin list in vim"


