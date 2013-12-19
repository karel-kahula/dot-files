#!/bin/bash
files="bashrc gitconfig gitignore vimrc vim"
dotfilesdir=$(pwd)

cd ~
for file in $files; do
  rm ~/.$file
  ln -s $dotfilesdir/$file ~/.$file
done

