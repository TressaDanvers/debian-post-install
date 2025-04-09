#!/usr/bin/env sh
echo "  This post install script makes the assumption that"
echo "the user running it is not root and has access to run"
echo "elevated commands using the sudo utility."
echo ""
echo "  This script makes no assumptions of what applications"
echo "were installed with the operating system, or by the"
echo "user post-install, and will seek to install neccessary"
echo "utilities using the package manager."

echo ""
read -p "Press Enter to continue." </dev/tty

## Nala Package Manager
sudo apt install nala -y

## Nix Package Manager
sudo nala install nix -y
sudo usermod -aG nix-users "$USER"
nix-channel --add https://nixos.org/channels/nixpkgs-24.11 nixpkgs
nix-channel --update nixpkgs

## Install Home Manager Config
mkdir -p "$HOME/.config"
nix-shell -p git --run\
  git clone\
    https://github.com/TressaDanvers/home-manager.git\
    "$HOME/.config/home-manager"
nix-shell -p home-manager --run\
  home-manager switch --flake "$HOME/.config/home-manager/#default"\
    --extra-experimental-features "nix-command flakes" -b bak
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
home-manager switch
exec bash
