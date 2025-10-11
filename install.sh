#!/usr/bin/env bash
sudo apt update
# esto seguro que funciona
sudo apt install curl python3-pip ansible -y
if [ -z "$CODESPACE_NAME" ]; then 
  ansible-playbook ./Vagrant/localhost-deploy.yml --ask-become-pass
else
  ansible-playbook ./Vagrant/minimal-deploy.yml
fi



