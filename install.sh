#!/bin/bash
set -e -x

git clone https://github.com/tucnak/config.git config
cd config

cp .gitconfig $HOME
cp .tmux.conf $HOME
cp .vimrc $HOME
mkdir -p $HOME/.vim && cp -r .vim $HOME
mkdir -p $HOME/.config && cp -r fish $HOME/.config

sudo apt install fish
chsh -s `which fish`
