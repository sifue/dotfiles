#!/bin/bash

DOT_FILES=(.gitconfig .gitignore .screenrc .vim .vimrc .gvimrc .emacs .emacs.d .tmux.conf)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
