[[ $- != *i* ]] && return

alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

PS1="[\u@\h \W]\$ "

export PATH=$PATH:$JAVA_HOME/bin
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"

