#!/bin/bash
files="bashrc gitconfig gitignore vimrc vim git-prompt.sh"
dotfilesdir=$(pwd)

# pull all latest bundles
git submodule update --init

# copy dot files and directories
cd ~
for file in $files; do
  rm  -rf ~/.$file
  ln -s $dotfilesdir/$file ~/.$file
done

