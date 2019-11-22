set -e GOROOT
set -xg GO111MODULE on

set -xg CC "clang"
set -xg CXX "clang++"
set -xg CCACHE_CPP2 YES

gpgconf --launch gpg-agent
echo | gpg-connect-agent
set -xg GPG_TTY (tty)
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -xg LANG en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8

set -xg CLICOLOR 1
set -xg LSCOLORS ExFxCxDxBxegedabagacad

function terminal # user@host
	set details (echo $argv)
	ssh -C $details -t "tmux -CC at || tmux -CC"
end

function tunnel # user@host@port
	set details (echo $argv[1] | string split "@" | string split ":")

	set user (echo $details | cut -d ' ' -f 1)
	set host (echo $details | cut -d ' ' -f 2)
	set port (echo $details | cut -d ' ' -f 3)

	ssh -L $port:127.0.0.1:$port -CNfl $user $host
end

function outpost
	lsof -nP -i4TCP:$argv[1] | grep LISTEN
end

