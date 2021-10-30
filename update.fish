#!/usr/local/bin/fish
cp $HOME/.vimrc .
cp $HOME/.gvimrc .
cp $HOME/.gitconfig .
cp $HOME/.tmux.conf .
rsync -av --progress $HOME/.vim . --exclude .DS_Store --exclude .netrwhist --exclude node_modules
rsync -av --progress $HOME/.config/nvim . --exclude .DS_Store --exclude .netrwhist --exclude node_modules
cp $HOME/.config/fish/config.fish fish
cp $HOME/.config/fish/public.fish fish
brew list > brewlist
