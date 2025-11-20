#!/bin/bash

# Source file in dotfiles repo (copied to home directory by github)
ALIASES_SOURCE="$HOME/.aliases"

# Target shell config file (default for Codespaces)
SHELL_CONFIG="$HOME/.zshrc"

echo "--- Running dotfiles install script ---"

# 1. Ensure the aliases file is present
if [[ ! -f "$ALIASES_SOURCE" ]]; then
    echo "❌ Error: $ALIASES_SOURCE not found in home directory after cloning dotfiles."
    exit 1
fi

# 2. Append the source command to the existing .zshrc file
if ! grep -q "source $ALIASES_SOURCE" "$SHELL_CONFIG"; then
  echo "" >> "$SHELL_CONFIG"
  echo "# Source custom aliases added by dotfiles install.sh script" >> "$SHELL_CONFIG"
  echo "source $ALIASES_SOURCE" >> "$SHELL_CONFIG"
  echo "✅ Added source command for .aliases to $SHELL_CONFIG"
else
  echo "ℹ️ $ALIASES_SOURCE is already sourced in $SHELL_CONFIG. Skipping append."
fi

# 3. Inform the user they might need to restart their terminal
echo "ℹ️ New aliases will be available in the next terminal session, or run: source ~/.zshrc"
echo "--- Finished install script ---"
