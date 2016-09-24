# Fisherman config
set fisher_home ~/Sofware/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# Convenience
set -x PATH $HOME/bin $PATH

# MacPorts
set -x PATH /opt/local/bin /opt/local/sbin $PATH
# Node.js
set -x NODE_PATH /usr/local/lib/node_modules
# Qt 5.7
set -x PATH $HOME/Qt/5.7/clang_64/bin $PATH

# Clang, ccache and ld
set -x PATH /usr/local/Cellar/ccache/3.2.1/libexec $PATH
set -x CPLUS_INCLUDE_PATH /usr/local/include
set -x LIBRARY_PATH /usr/local/lib
set -x CC "ccache clang"
set -x CXX "ccache clang++"
set -x CCACHE_CPP2 YES

# Locale fix for SSH
set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# A bit of coloring da shell!
set -x CLICOLOR 1
set -x LSCOLORS ExFxCxDxBxegedabagacad

# Ansible
set -x ANSIBLE_INVENTORY ~/ansible_hosts

# Go
set -x GOROOT $HOME/Development/gopher/git
set -x GOPATH $HOME/Development/gopher
set -x PATH $GOROOT/bin $PATH $GOPATH/bin

function reload
    source ~/.config/fish/config.fish
end

function config
    vim ~/.config/fish/config.fish
end

function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    echo ' '
end

fish_vi_key_bindings
