#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print messages
function info() {
    echo "==> $1"
}

# Check for Homebrew and install if not present
if ! command -v brew &> /dev/null; then
    info "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    info "Homebrew is already installed."
fi

# Update Homebrew
info "Updating Homebrew..."
brew update

# Install Git if not already installed
if ! command -v git &> /dev/null; then
    info "Git not found. Installing Git..."
    brew install git
else
    info "Git is already installed."
fi

# Install Ansible if not already installed
# Check for pip and install if not present
if ! command -v pip3 &> /dev/null; then
  info "pip3 not found. Installing pip3..."
  brew install python
else
  info "pip3 is already installed."
fi

# Install Ansible if not already installed
if ! command -v ansible &> /dev/null; then
  info "Ansible not found. Installing Ansible with pip3..."
  pip3 install ansible
else
  info "Ansible is already installed."
fi

# Run the ansible-pull command
info "Running ansible-pull to execute playbook..."
ansible-pull -U https://github.com/ahmadrezaM97/envsetup.git src/install_all.yaml -vvv

info "Script complete."
