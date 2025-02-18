#!/bin/bash

# Ensure the script is running on Ubuntu
if [[ "$(uname)" != "Linux" ]]; then
  echo "This script is intended for Ubuntu only."
  exit 1
fi

# Source OS release information
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  if [[ "$ID" != "ubuntu" && "$ID_LIKE" != *"ubuntu"* ]]; then
    echo "This script supports only Ubuntu."
    exit 1
  fi
else
  echo "Cannot determine the Linux distribution. This script supports only Ubuntu."
  exit 1
fi

echo "Updating apt repository..."
sudo apt update

# Install dependencies needed for adding PPAs
sudo apt install -y software-properties-common

echo "Adding the official Ansible PPA..."
sudo apt-add-repository --yes --update ppa:ansible/ansible

echo "Installing Ansible via apt..."
sudo apt install -y ansible

if [[ $? -eq 0 ]]; then
  echo "Ansible was installed successfully on Ubuntu!"
else
  echo "There was an error installing Ansible on Ubuntu."
  exit 1
fi
