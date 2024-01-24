alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
export HOMEBREW_NO_AUTO_UPDATE=true
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

export REPODIR="$HOME/repos"
export GPG_TTY=$TTY
export GIT_EXTERNAL_DIFF="difft --display=inline --color=always"
eval "$(starship init zsh)"


# export XDG_RUNTIME_DIR=/tmp/xdg
# export WAYLAND_DISPLAY=wayland-0
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# export LIBGL_ALWAYS_INDIRECT=0

function find_first_free_port() {
  local start_port=$1
  local end_port=$2

  local used_ports=$(netstat -tuln | grep -oE ':([0-9]{1,5})' | tr -d ':' | sort -nu)

  for port in {$start_port..$end_port}; do
    if ! echo "$used_ports" | grep -wq $port; then
      echo $port
      return 0
    fi
  done

  echo -1
  return 1
}

function popi_before() {
  local popi_result=$(mktemp)
  ~/repos/popi/target/release/popi > "$popi_result"
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  cd "$(cat $popi_result)"
  "$@"
}

function neovide() {
  ~/repos/neovide/target/release/neovide
}

function less_with_unbuffer () {
  unbuffer "$@" | less -SR
}

alias pn='popi_before neovide'
alias pnvim='popi_before nvim'
alias pcd='popi_before'
alias ul='less_with_unbuffer'
alias legit='git'
alias ls='eza --icons'
alias cat='bat'
alias lock='swaylock -C ~/.config/swaylock'
