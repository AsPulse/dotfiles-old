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
export BROWSER="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
eval "$(starship init zsh)"


ulimit -n 65535

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

function neovide() {
  local neovide="/mnt/c/Users/aspulse/Documents/repos/neovide/target/release/neovide.exe"
  local port=$(find_first_free_port 6000 7000)
  if [[ $port -eq -1 ]]; then
    echo "No free port found for neovide. (:6000 - :7000)"
    return 1
  fi
  nvim --headless --listen localhost:$port "$*" &
  local nvimserver=$!
  echo "Runnning nvim server using :$port, pid: $nvimserver..."

  $neovide --multigrid --remote-tcp=localhost:$port
  kill $nvimserver
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

function cd() {
  builtin cd "$(~/repos/wsl-dirutils/target/release/wsl-dirutils convert "$*")"
}
function pwd() {
  ~/repos/wsl-dirutils/target/release/wsl-dirutils pwd > /dev/null
}


alias pn='popi_before neovide'
alias pnvim='popi_before nvim'
alias pcd='popi_before'
