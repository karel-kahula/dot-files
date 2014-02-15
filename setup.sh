#!/bin/bash
set -e
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

# setup powerline symbols.
mkdir -p ~/.fonts
mkdir -p ~/.fonts.conf.d
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf ~/.fonts/PowerlineSymbols.otf
fc-cache -vf ~/.fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf ~/.fonts.conf.d/10-powerline-symbols.conf

