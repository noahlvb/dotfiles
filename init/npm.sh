#!/usr/bin/env bash
# Installing NVM and Nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

sudo npm install npm -g
sudo npm update -g

sudo npm install -g diff-so-fancy
sudo npm install -g is-online
