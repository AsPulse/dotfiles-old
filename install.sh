#!/bin/sh
set -e

sudo apt update
sudo apt install gcc g++ make net-tools gnuplot

# Install Homebrew
if ! command -v brew > /dev/null 2>&1 ; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 else
  echo "Homebrew already installed."
fi

ulimit -n 65535
brew bundle || true
curl https://get.volta.sh | bash
curl -sSL https://install.python-poetry.org | python3 -

mkdir -p ~/.config
mkdir -p ~/.config/nvim
stow -R -v -d ./ -t ~/.config starship
stow -R -v -d ./ -t ~/.config/nvim neovim

mkdir -p ~/.vivaldi
stow -R -v -d ./ -t ~/.vivaldi vivaldi

mkdir -p ~/.vim
mkdir -p ~/.vim/tsnip
stow -R -v -d ./ -t ~/.vim/tsnip tsnip

stow -R -v zsh -t ~/

mkdir -p ~/git
stow -R -v -d ./ -t ~/git git
git config --global core.excludesfile ~/git/.gitignore_global
 
volta install np live-server typescript typescript-language-server lehre pnpm turbo aicommits
gh extension install seachicken/gh-poi

cargo install --git https://github.com/AsPulse/cargo-docs.git --branch chore/add-cargo-feature --features vendored-libgit2
cargo install cargo-update --features vendored-libgit2
cargo install cargo-about ripgrep wsl-dirutils difftastic
cargo install-update --all
