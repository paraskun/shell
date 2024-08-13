[[ $- != *i* ]] && return

alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

PS1="[\u@\h \W]\$ "

if [[ -z "$DISPLAY" ]]; then
	Hyprland;
fi

export PATH=$PATH:$JAVA_HOME/bin

