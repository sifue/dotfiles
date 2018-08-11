#!/bin/bash

DOT_FILES=(.vim .vimrc .gvimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
