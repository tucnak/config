#!/usr/local/bin/fish
cp $HOME/.vimrc .
cp $HOME/.gitconfig .
cp $HOME/.tmux.conf .
rsync -av --progress $HOME/.vim . --exclude plugged
rsync -av --progress $HOME/.config/fish .
gpg --armor --export badt@veritas.icu > badt.gpg
