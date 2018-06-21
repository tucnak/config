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
export GOPATH="$HOME/Devel/go"
export PATH="$PATH:$GOPATH/bin"


export GREP_OPTIONS='--color=auto'
export GPG_TTY=(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/badt/Devel/google-cloud-sdk/path.bash.inc' ]; then source '/Users/badt/Devel/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/badt/Devel/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/badt/Devel/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$PATH:/Users/badt/Devel/google-cloud-sdk/bin"
