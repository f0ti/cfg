==============
# git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

==============
# PS1
if [ "$color_prompt" = yes ]; then
	PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[$(tput bold)\]\[\033[38;5;1m\] :: \[\033[01;34m\]\w \[\e[33m\]\$(parse_git_branch)\[\033[00m\]$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

==============
# tmux terminal
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	  exec tmux
fi
