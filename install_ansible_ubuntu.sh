#!/bin/bash
set -e

# Check if Ansible is installed
if command -v ansible >/dev/null 2>&1; then
    echo "Ansible is already installed."
else
    echo "Ansible not found. Installing Ansible..."
    # Update package list and install prerequisites
    sudo apt update
    sudo apt install -y software-properties-common

    # Add the official Ansible PPA and install Ansible
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt update
    sudo apt install -y ansible
    echo "Installation complete."
fi



