# load in the platform file
if [ ! -e $HOME/.platform ]; then
	echo "Create either a .mac or .linux file in the dotfiles location and run the install script again."
fi

PLATFORM=$(cat ~/.platform)

# keep our files modular and specific
# load them in as a standalone, and their platform specific counterparts too
for ref in ".development" ".bash_aliases" ".bash_colors" ".bash_prompt" ".bash_exports" "z.sh"; do

	# do the file itself
	if [ -e $HOME/$ref ] || [ -h $HOME/$ref ]; then
		source $HOME/$ref
	fi

	# source platform specific related
	for pf in "linux" "mac"; do

		if [ -e "${HOME}/${ref}_${pf}" ] && [ "${PLATFORM}" = "${pf}" ]; then
			source "${HOME}/${ref}_${pf}"
		fi

	done

done

# Dotfiles command
source "${HOME}/.bash_dotfiles"

# Node.js version manager.
if [ -e "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Ruby version manager.
if [ -e "$HOME/.rvm" ]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Visual studio code command line
if [ -e "/Applications/Visual Studio Code.app" ]; then
	export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.bash.inc' ]; then
	source '/usr/local/bin/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.bash.inc' ]; then
	source '/usr/local/bin/google-cloud-sdk/completion.bash.inc';
fi

# Yarn
if [ -e "$HOME/.yarn/bin" ]; then
	export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
