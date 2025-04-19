#!/bin/bash

sudo apt install python3-pylsp
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

source $HOME/.zshrc

npm install -g npm

nvm install 22
nvm use 22
