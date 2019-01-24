#!/bin/bash

DOT_FILES=(.vim .vimrc .gvimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
