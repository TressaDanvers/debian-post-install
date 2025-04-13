#!/usr/bin/env sh

## Configure Nix
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update nixpkgs

## Install Home Manager Config
mkdir -p "$HOME/.config"

nix-shell -p git --run\
  "git clone https://github.com/TressaDanvers/home-manager.git \"$HOME/.config/home-manager\""

mv "$HOME/.config/home-manager/.git" "$HOME/.config/home-manager/.git.bak"

nix-shell -p home-manager --run\
  "home-manager switch --flake \"$HOME/.config/home-manager/#$USER\" --extra-experimental-features \"nix-command flakes\" -b bak"

mv "$HOME/.config/home-manager/.git.bak" "$HOME/.config/home-manager/.git"

nix-shell -p home-manager --run\
  "home-manager switch"

exec bash
