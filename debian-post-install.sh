#!/usr/bin/env sh

## Nala Package Manager
sudo apt install nala -y

## Nix Package Manager
sudo nala install nix -y
sudo usermod -aG nix-users "$USER"
