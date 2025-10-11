#!/usr/bin/env bash
sudo apt update
# curl, pip, ansible
sudo apt install curl python3-pip ansible -y
# install nix package manager 
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
if [ -z "$CODESPACE_NAME" ]; then 
  ansible-playbook ./Vagrant/localhost-deploy.yml --ask-become-pass
else
  ansible-playbook ./Vagrant/minimal-deploy.yml
fi



