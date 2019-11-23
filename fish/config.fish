set -xg PATH /bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin

fish_vi_key_bindings

alias termbin "nc termbin.com 9999"
alias stat    "stat -x"
alias ls      "ls -GFh"
alias ll      "ls -GFhl"
alias la      "ls -Gfhla"

function reload
	source $HOME/.config/fish/config.fish
end

function config
	vim $HOME/.config/fish/config.fish
end

function clever_pwd
	printf "%s" (pwd \
		| string replace $GOPATH "\$GOPATH" \
		| string replace $HOME "\$HOME" \
	)
end


source $HOME/.config/fish/public.fish
if test -e $HOME/.config/fish/private.fish
	source $HOME/.config/fish/private.fish
end

set -xg fish_user_paths $PATH

function fish_greeting
end

function fish_mode_prompt
end

function fish_prompt
	printf "└─╴\n"
	set_color --bold yellow
	printf "%s@%s" $USER (hostname)
	set_color normal
	printf " :: "
	type -q clever_pwd; \
		and printf "%s " (clever_pwd); \
		or  printf "%s " (pwd)

	printf "\n"
	set_color normal
	printf "┌─╴ "
end

function fish_right_prompt
	set_color yellow
	printf "%s " $ROOM

	set_color -b white
	switch $fish_bind_mode
		case default
			set_color --bold red
			echo ' N '
		case insert
			set_color --bold green
			echo ' I '
		case replace_one
			set_color --bold green
			echo ' R '
		case visual
			set_color --bold brmagenta
			echo ' V '
		case '*'
			set_color --bold red
			echo ' ? '
	end
	set_color normal
	printf "\n"
end
