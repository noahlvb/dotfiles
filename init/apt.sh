#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Adding Repo's
e_header "Adding repo's"
sudo cp sources/bootstrap_sources.list /etc/apt/sources.list.d/bootstrap_sources.list

# Updating repo's
e_header "Updating repo's"
sudo apt-get update
sudo apt-get upgrade

# Installing packages
packages=(
    meld
    bash-completion
    ngrep
    git
    atom
    build-essential
    docker-engine
    fleet
    gimp
    gitkraken
    google-chrome-stable
    gparted
    nodejs
    spotify-client
)

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
