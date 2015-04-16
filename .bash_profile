# Prompt
PS1="[\u@$(scutil --get ComputerName):\W]\\$ " 

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Node.js
export NODE_PATH="/usr/local/lib/node_modules"

# CCache + Clang
export CC="ccache clang"
export CXX="ccache clang++"
export CCACHE_CPP2=YES

# Locale fix for SSH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# A bit of coloring da shell!!
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Final things
# ============
export PATH="/usr/local/Cellar/ccache/3.2.1/libexec:$PATH"
