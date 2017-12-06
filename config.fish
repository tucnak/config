set -e GOROOT


# package manager
set fisher_home ~/Sofware/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# alias stone!
alias termbin  "nc termbin.com 9999"
alias stat     "stat -x"
alias ll       "ls -l"

# FIRST CLASS
set -x PATH $HOME/bin
set -x PATH $PATH /usr/local/opt/ccache/libexec /usr/local/opt/llvm/bin
set -x PATH $PATH /bin /usr/bin /usr/sbin /sbin /usr/local/bin
set -xg LIBRARY_PATH "/opt/local/lib:/usr/local/lib:/usr/local/opt/llvm/lib"
set -xg DYLD_LIBRARY_PATH $HOME/lib /opt/local/lib /usr/local/lib /lib /usr/lib
set -xg CPLUS_INCLUDE_PATH "/usr/local/include:/usr/local/opt/ccache/libexec"
set -xg PKG_CONFIG_PATH "/opt/local/lib/pkgconfig:/usr/local/lib/pkgconfig"

# SECOND CLASS
set -xg GOPATH $HOME/Development/gopher
set -xg PATH $GOPATH/bin $PATH
set -xg NODE_PATH /usr/local/lib/node_modules

set -xg CC "clang"
set -xg CXX "clang++"
set -xg CCACHE_CPP2 YES

# THIRD CLASS
set -xg LANG en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg CLICOLOR 1
set -xg LSCOLORS ExFxCxDxBxegedabagacad

function reload
    source ~/.config/fish/config.fish
end

function config
    vim ~/.config/fish/config.fish
end

function fish_prompt
    set_color $fish_color_cwd
    printf "%s " (prompt_pwd)
    set_color normal
end

set -xg PATH $PATH
