#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Adding Repo's
e_header "Adding repo's"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
sudo add-apt-repository "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse"
sudo curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

# Updating repo's
e_header "Updating repo's"
sudo apt-get -y update
sudo apt-get -y upgrade

# Installing packages
packages=(
    meld
    bash-completion
    ngrep
    git
    build-essential
    docker-ce
    gimp
    google-chrome-stable
    gparted
    nodejs
    npm
    spotify-client
    vlc
    wine
    wireshark
    virtualbox
    teamviewer
    skypeforlinux
    plymouth
    mongodb-org
#   -- Python --
    python3-xmltodict
    python3-flask
#   ---- PHP ---
    php-common
    php7.0
    php7.0-cli
    php7.0-common
    php7.0-curl
    php7.0-fpm
    php7.0-gd
    php7.0-json
    php7.0-mbstring
    php7.0-opcache
    php7.0-readline
    php7.0-xml
    php7.0-zip
)


if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq -y --allow-unauthenticated install "$package"
  done
fi
