fish_vi_key_bindings

function sudo --description "sudo !!"
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

alias termbin "nc termbin.com 9999"
alias ls      "ls -GFh"
alias tree    "tree -N"

gpgconf --launch gpg-agent
echo | gpg-connect-agent
set -xg GPG_TTY (tty)
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -xg GOPATH $HOME/go
set -xg GOROOT /usr/local/go
set -xg PATH /bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin $HOME/bin $GOROOT/bin $GOPATH/bin $HOME/.cargo/bin

set -xg LIBRARY_PATH /usr/local/lib /usr/local/opt/openssl/lib
set -xg CPLUS_INCLUDE_PATH /usr/local/include /usr/local/opt/ccache/libexec
set -xg PKG_CONFIG_PATH /lib/pkgconfig /usr/local/lib/pkgconfig /usr/local/opt/libarchive/lib/pkgconfig
set -xg CC "clang"
set -xg CXX "clang++"
set -xg LDFLAGS "-L/usr/local/opt/openssl/lib -L/usr/local/opt/openblas/lib -L/usr/local/opt/sqlite/lib"
set -xg CPPFLAGS "-I/usr/local/opt/openssl/include -I/usr/local/opt/openblas/include -I/usr/local/opt/sqlite/include"
set -xg CCACHE_CPP2 YES
set -xg LANG en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg CLICOLOR 1
set -xg LSCOLORS ExFxCxDxBxegedabagacad
set -xg HOMEBREW_NO_AUTO_UPDATE 1

if test -e $HOME/.config/fish/private.fish
	source $HOME/.config/fish/private.fish
end
if test -e $HOME/.config/fish/iterm2.fish
	source $HOME/.config/fish/iterm2.fish
end
source $HOME/dev/gcloud/path.fish.inc

function sshtmux
	set details $argv[1]
	set mode $argv[2]
	ssh -C $details -t "tmux -CC $mode"
end

function outpost
	lsof -nP -i4TCP:$argv[1] | grep LISTEN
end

function reload
	source $HOME/.config/fish/config.fish
end

function config
	if test (count $argv) -gt 0
		vim $HOME/.config/fish/$argv[1].fish
		return
	end
	vim $HOME/.config/fish/config.fish
end

function fish_greeting
end

function fish_mode_prompt
end

function fish_prompt
	set pwd (string split / (pwd))
	set_color --bold red
	printf "%s@%s" $USER (hostname)

	if test -n "$MNTROOM"
		set_color --bold white
		printf " <%s>" $MNTROOM
	end

	set_color normal
	# printf "%s \$ " $pwd[-1]
	printf " \$ "
end

function fish_right_prompt
	set_color brblack

	switch $fish_bind_mode
		case default
			set_color --bold -b grey
			printf ' N '
		case insert
			# set_color --bold -b green
			# printf ' I '
		case replace_one
			set_color --bold -b red
			printf ' R '
		case visual
			set_color --bold -b magenta
			printf ' V '
	end
	set_color normal
end
