#!/usr/local/bin/fish
cp $HOME/.vimrc .
cp $HOME/.gvimrc .
cp $HOME/.gitconfig .
cp $HOME/.tmux.conf .
rsync -av --progress $HOME/.vim . --exclude plugged --exclude .DS_Store
rsync -av --progress $HOME/.config/fish . --exclude .DS_Store --exclude fishd.*
gpg --armor --export badt@veritas.icu > badtrousers.gpg
brew list > brewlist
