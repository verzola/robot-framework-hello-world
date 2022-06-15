#!/bin/bash
sudo apt install -y python3 python3-pip python3-dev
sudo pip install --user pipenv
pipenv install
pipenv run rfbrowser init
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install "lts/*"
nvm use --lts
npx playwright install-deps
