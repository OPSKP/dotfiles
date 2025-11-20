#!/bin/bash

# Define the path to your .aliases file within the dotfiles repo structure
ALIASES_FILE="$HOME/.aliases"

# Define the target shell config file (default for Codespaces)
SHELL_CONFIG="$HOME/.zshrc"

# Check if the shell config file already sources the aliases file
if ! grep -q "source $ALIASES_FILE" "$SHELL_CONFIG"; then
  echo "" >> "$SHELL_CONFIG"
  echo "# Source custom aliases added by dotfiles install.sh script" >> "$SHELL_CONFIG"
  echo "source $ALIASES_FILE" >> "$SHELL_CONFIG"
  echo "✅ Added source command for .aliases to $SHELL_CONFIG"
else
  echo "ℹ️ $ALIASES_FILE is already sourced in $SHELL_CONFIG. Skipping."
fi
