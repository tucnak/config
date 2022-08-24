fish_vi_key_bindings

function sudo --description "sudo !!"
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

alias pose "docker compose"
alias termbin "nc termbin.com 9999"
alias ls      "ls -GFh"
alias tree    "tree -N"

set -xg GOPATH $HOME/go
set -xg PATH /bin /usr/local/bin /usr/bin $HOME/bin $GOPATH/bin
set -xg GPG_TTY (tty)
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -xg LANG en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg CLICOLOR 1
set -xg LSCOLORS ExFxCxDxBxegedabagacad
set -xg HOMEBREW_NO_AUTO_UPDATE 1

gpgconf --launch gpg-agent

if test -e $HOME/.config/fish/iterm2.fish
	source $HOME/.config/fish/iterm2.fish
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
	mvim $HOME/.config/fish/config.fish
end

function fish_greeting
end

function fish_mode_prompt
end

function fish_prompt
	#set pwd (string split / (pwd))
	set_color --bold red
	printf "%s\$ " (prompt_pwd)
	set_color normal
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
