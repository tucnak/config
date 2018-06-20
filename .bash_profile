# Prompt
PS1="\u@$(scutil --get ComputerName):\W\\$ "

# Aliases
alias outpost="lsof -nP -i4TCP:\$PORT | grep LISTEN"
alias termbin="nc termbin.com 9999"
alias stat="stat -x"
alias ls="ls -G"
alias ll="ls -l"

# Clang
export CPLUS_INCLUDE_PATH=/usr/local/include/
export LIBRARY_PATH="/usr/local/lib"

# Locale fix for SSH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Go
export OROOT="$HOME/Dev/go/git/"
export GOPATH="$HOME/Dev/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"


export GREP_OPTIONS='--color=auto'
export GPG_TTY=(tty)
