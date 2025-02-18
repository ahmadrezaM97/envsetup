#!/bin/bash

# Ensure the script is running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script is intended for macOS only."
  exit 1
fi

# Check if Homebrew is installed; if not, install it.
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Verify that brew is now available
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew installation may have failed or is not in your PATH."
    echo "Please follow the instructions at https://brew.sh/ to complete installation."
    exit 1
  fi
fi

echo "Updating Homebrew..."
brew update

echo "Installing Ansible via Homebrew..."
brew install ansible

if [[ $? -eq 0 ]]; then
  echo "Ansible was installed successfully on macOS!"
else
  echo "There was an error installing Ansible on macOS."
  exit 1
fi
