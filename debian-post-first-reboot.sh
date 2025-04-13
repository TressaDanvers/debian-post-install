#!/usr/bin/env sh

## Configure Nix
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update nixpkgs

## Install Home Manager Config
mkdir -p "$HOME/.config"

nix-shell -p git --run\
  "git clone https://github.com/TressaDanvers/home-manager.git \"$HOME/.config/home-manager\""

nix-shell -p home-manager --run\
  "home-manager switch --flake \"$HOME/.config/home-manager/#default\" --extra-experimental-features \"nix-command flakes\" -b bak"

home-manager switch
