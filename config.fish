# fish
fish_vi_key_bindings
set -x GPG_TTY (tty)

# alias stone!
alias outpost "lsof -nP -i4TCP:\$PORT | grep LISTEN"
alias termbin "nc termbin.com 9999"
alias stat    "stat -x"
alias ls      "ls -G"
alias ll      "ls -l"

# FIRST CLASS
set -x PATH $HOME/bin
set -x PATH $PATH /bin /usr/bin /usr/sbin /sbin /usr/local/bin

# SECOND CLASS
set -xg GOPATH $HOME/Devel/go
set -e  GOROOT
set -xg PATH $GOPATH/bin ~/Devel/google-cloud-sdk/bin $PATH

set -xg CC "clang"
set -xg CXX "clang++"
set -xg CCACHE_CPP2 YES

# THIRD CLASS
set -xg DYLD_LIBRARY_PATH $HOME/lib /opt/local/lib /usr/local/lib /lib /usr/lib
set -xg LIBRARY_PATH "/opt/local/lib:/usr/local/lib:/usr/local/opt/llvm/lib"
set -xg CPLUS_INCLUDE_PATH "/usr/local/include:/usr/local/opt/ccache/libexec"
set -xg PKG_CONFIG_PATH "/opt/local/lib/pkgconfig:/usr/local/lib/pkgconfig"

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
    printf "%s\$ " (prompt_pwd)
    set_color normal
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/badt/Devel/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/badt/Devel/google-cloud-sdk/path.fish.inc'; else; . '/Users/badt/Devel/google-cloud-sdk/path.fish.inc'; end; end
