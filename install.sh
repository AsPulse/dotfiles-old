#!/bin/sh
set -e

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]
 then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 else
  echo "Homebrew already installed."
fi

brew bundle
curl https://get.volta.sh | bash

stow -R -v -d ./ -t ~ zsh

mkdir -p ~/.config/nvim
stow -R -v -d ./ -t ~/.config/nvim neovim

mkdir -p ~/.vivaldi
stow -R -v -d ./ -t ~/.vivaldi vivaldi

mkdir -p ~/.vim
mkdir -p ~/.vim/tsnip
stow -R -v -d ./ -t ~/.vim/tsnip tsnip
