set -xg PATH /bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin

fish_vi_key_bindings

alias termbin "nc termbin.com 9999"
alias stat    "stat -x"
alias ls      "ls -GFh"
alias ll      "ls -l"
alias la      "ll -a"

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
	set_color --bold yellow
	printf "%s@%s " $USER (hostname)

	if test -z ROOM
		set_color --bold white
		printf "<%s> " $ROOM
	end

	set_color normal
	printf "\$ "
end

function fish_right_prompt
	set_color brblack
	type -q clever_pwd; \
		and printf "%s " (clever_pwd); \
		or  printf "%s " (pwd)

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
