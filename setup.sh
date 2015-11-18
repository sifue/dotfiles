#!/bin/bash

DOT_FILES=(.screenrc .vim .vimrc .gvimrc .emacs .emacs.d .tmux.conf .sbtconfig .ideavimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
