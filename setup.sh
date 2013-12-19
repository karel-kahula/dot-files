#!/bin/bash
files="bashrc gitconfig gitignore vimrc vim"
dotfilesdir=$(pwd)

# pull all latest bundles
git submodule update --init

# copy dot files and directories
cd ~
for file in $files; do
  rm  -f ~/.$file
  ln -s $dotfilesdir/$file ~/.$file
done

