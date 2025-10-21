#!/usr/bin/env bash
sudo apt update
# curl, pip, ansible
sudo apt install curl python3-pip ansible -y
# install nix package manager 
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
ansible-galaxy collection install community.general
if [ -z "$CODESPACE_NAME" ]; then
  ansible-playbook ./Vagrant/localhost-deploy.yml --ask-become-pass
else
  ansible-playbook ./Vagrant/minimal-deploy.yml
fi

# To use this notification, you need to:
# Create a Telegram bot via @BotFather and get the bot token
# Get your chat ID (you can use @userinfobot to find your chat ID)
# Set the variables either:
# In the vars section of the playbook
# In a separate vars file
# As command-line arguments: --extra-vars "telegram_bot_token=YOUR_TOKEN telegram_chat_id=YOUR_CHAT_ID"
# Install the community.general collection if not already installed:
# ansible-galaxy collection install community.general