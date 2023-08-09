alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"
export REPODIR="$HOME/repos"
export GPG_TTY=$TTY
eval "$(starship init zsh)"

alias popi='popi_result=$(~/repos/popi/target/release/popi) && [[ $? -eq 0 ]] && (cd "$popi_result" && nvim --headless --listen localhost:6666 . &; nvimserver=$!; neovide.exe --remote-tcp=localhost:6666 --multigrid; kill "$nvimserver")'

ulimit -n 65535
