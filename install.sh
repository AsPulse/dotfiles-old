#!/bin/sh
set -e

mkdir -p ~/.config/nvim
stow -R -v -d ./ -t ~/.config starship
stow -R -v -d ./ -t ~/.config/nvim neovim

mkdir -p ~/.config/lazygit
stow -R -v -d ./ -t ~/.config/lazygit lazygit

mkdir -p ~/.config/hypr
stow -R -v -d ./ -t ~/.config/hypr hypr

mkdir -p ~/.config/eww
stow -R -v -d ./ -t ~/.config/eww eww

mkdir -p ~/.vivaldi
stow -R -v -d ./ -t ~/.vivaldi vivaldi

mkdir -p ~/.vim
mkdir -p ~/.vim/tsnip
stow -R -v -d ./ -t ~/.vim/tsnip tsnip

stow -R -v zsh -t ~/

mkdir -p ~/git
stow -R -v -d ./ -t ~/git git
git config --global core.excludesfile ~/git/.gitignore_global

cargo install cargo-docs cargo-update cargo-about cargo-script cargo-insta cargo-expand cross
cargo install eza xcp fd-find bat du-dust
cargo install ripgrep difftastic tokio-console
cargo install-update --all

volta install np live-server typescript typescript-language-server lehre pnpm turbo aicommits
gh extension install seachicken/gh-poi

