#!/usr/local/bin/fish
cp $HOME/.vimrc .
cp $HOME/.gvimrc .
cp $HOME/.gitconfig .
cp $HOME/.tmux.conf .
rsync -av --progress $HOME/.vim . --exclude .DS_Store --exclude .netrwhist
cp $HOME/.config/fish/config.fish fish
cp $HOME/.config/fish/public.fish fish
gpg --armor --export badt@veritas.icu > badtrousers.gpg
brew list > brewlist
