set -xg PATH /bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin

set -xg SHELL /usr/local/bin/fish

source $HOME/.config/fish/public.fish
if test -e $HOME/.config/fish/private.fish
	source $HOME/.config/fish/private.fish
end

if status is-interactive
else
    exit
end

fish_vi_key_bindings

alias termbin "nc termbin.com 9999"
alias ls      "ls -GFh"
alias ll      "ls -l"
alias la      "ll -a"
alias tree    "tree -N"

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

set -xg fish_user_paths $PATH

function fish_greeting
end

function fish_mode_prompt
end

function fish_prompt
	set_color --bold yellow
	printf "%s@%s " $USER (hostname)

	if test -n "$ROOM"
		set_color --bold white
		printf "<%s> " $ROOM
	end

	set_color normal
	printf "\$ "
end

function fish_right_prompt
	set_color brblack

	switch $fish_bind_mode
		case default
			set_color --bold -b brcyan
			printf ' N '
		case insert
			set_color --bold -b green
			printf ' I '
		case replace_one
			set_color --bold -b red
			printf ' R '
		case visual
			set_color --bold -b magenta
			printf ' V '
	end
	set_color normal
end
#fish_add_path /usr/local/opt/openjdk/bin
