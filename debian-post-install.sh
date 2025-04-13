#!/usr/bin/env sh

## Nala Package Manager
sudo apt install nala -y

## Nix Package Manager
sudo nala install nix -y
sudo usermod -aG nix-users "$USER"

## System Utilities
sudo nala install curl ntp -y

## Setup for User Configuration
echo "sh <(curl https://raw.githubusercontent.com/TressaDanvers/debian-post-install/refs/heads/master/debian-user-setup.sh)" >> "$HOME/.profile"

## Reboot
sudo reboot
