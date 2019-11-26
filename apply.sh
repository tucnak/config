#!/bin/bash
set -e -x

git clone https://github.com/tucnak/config.git config
cd config

cp .gitconfig $HOME
cp .tmux.conf $HOME
tmux source-file $HOME/.tmux.conf
cp .vimrc $HOME
mkdir -p $HOME/.vim && cp -r .vim $HOME

sudo apt install fish
mkdir -p /usr/local/bin
sudo ln -s /usr/bin/fish /usr/local/bin
curl -L https://get.oh-my.fish | fish
mkdir -p $HOME/.config && cp -r fish $HOME/.config
