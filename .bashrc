#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias
alias ls='ls --color=auto'
alias suspend='systemctl suspend'
alias poweroff='shutdown now'
#alias code='com.visualstudio.code'

#
PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]: \[\e[0m\]\[\e[1;32m\]\w \n[\[\e[0;92m\]~\[\e[0;92m\]> \[\e[0m\]"
#PS1='\[\e[0;1;3m\]\w \[\e[0;92m\]~\[\e[0;92m\]> \[\e[0m\]'

# ENV variable
export EDITOR="vim"
export BROWSER="chromium"
export NVM_DIR="$HOME/.nvm"
export GTK_THEEME="Adwaita-dark"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### LF
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" = "1" ]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

