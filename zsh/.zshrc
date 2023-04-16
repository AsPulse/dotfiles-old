export GPG_TTY=$(tty)
export REPODIR="$HOME/repos"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk"
eval "$(starship init zsh)"
