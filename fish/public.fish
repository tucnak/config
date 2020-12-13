set -xg GPG_TTY (tty)
gpgconf --launch gpg-agent
echo | gpg-connect-agent
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -xg CC "clang"
set -xg CXX "clang++"
set -xg CCACHE_CPP2 YES
set -xg LANG en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg CLICOLOR 1
set -xg LSCOLORS ExFxCxDxBxegedabagacad

set -xg ANDROID_HOME /Users/badt/Library/Android/sdk
set -xg ANDROID_NDK_HOME /Users/badt/Dev/ndk
set -xg LIBRARY_PATH /usr/local/lib /usr/local/opt/openssl/lib

function terminal # user@host
	set details $argv[1]
	set mode $argv[2]
	ssh -C $details -t "tmux -CC $mode"
end

function tunnel # user@host:hostPort:clientPort
	set details (echo $argv[1] | string split "@" | string split ":")

	set user (echo $details | cut -d ' ' -f 1)
	set host (echo $details | cut -d ' ' -f 2)
	set userPort (echo $details | cut -d ' ' -f 3)
	set localPort (echo $details | cut -d ' ' -f 4)

	ssh -L $localPort:127.0.0.1:$userPort -CNl $user $host
end

function outpost
	lsof -nP -i4TCP:$argv[1] | grep LISTEN
end

source ~/.iterm2_shell_integration.fish
function iterm2_print_user_vars
	set layout (defaults read ~/Library/Preferences/com.apple.HIToolbox.plist \
		AppleSelectedInputSources |\
		egrep -w 'KeyboardLayout Name' |\
		sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

	switch "$layout"
		case "U.S."
			iterm2_set_user_var layoutCode "English"
		case "RussianWin"
			iterm2_set_user_var layoutCode "Russian"
		case "Ukrainian-PC"
			iterm2_set_user_var layoutCode "Ukrainian"
		case "*"
			iterm2_set_user_var layoutCode "Unknown"
	end
end

function gomod_on
	set -xg GO111MODULE yes
end

function gomod_off
	set -xg GO111MODULE no
end

