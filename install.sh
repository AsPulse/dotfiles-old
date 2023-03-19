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

stow -R -v -d ./ -t ~ zsh

curl https://get.volta.sh | bash


