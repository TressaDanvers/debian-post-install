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
