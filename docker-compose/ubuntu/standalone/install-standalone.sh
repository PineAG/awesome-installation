#!/usr/bin/env bash

# Install Docker Engine
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
cat ./resources/docker-ubuntu-gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Install Docker Compose
cp ./resources/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Install Auto completion for Docker Compose
## Bash
cp ./resources/docker-compose-completion /etc/bash_completion.d/docker-compose

## Zsh
if [ ! -z $(which zsh) ] ; then
    echo "To install docker-compose autocompletion for zsh, view here: https://docs.docker.com/compose/completion/"
fi
