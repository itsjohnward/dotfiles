#!/bin/sh

set -e

# Bootstrap script to set up dotfiles and development tools
# This script orchestrates modular installation scripts for better maintainability

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
BOOTSTRAP_DIR="$SCRIPT_DIR/bootstrap.d"

echo "=== Bootstrap Setup ==="
echo "Running modular installation scripts from $BOOTSTRAP_DIR"
echo

# Run all bootstrap scripts in order
for script in "$BOOTSTRAP_DIR"/*.sh; do
  if [ -f "$script" ] && [ -x "$script" ]; then
    echo ">>> Running $(basename "$script")..."
    "$script"
    echo
  fi
done

echo "=== Bootstrap Complete ==="
echo
echo "Next steps:"
echo "  1. Run 'gcloud init' to complete gcloud CLI setup"
echo "  2. Open neovim and run ':PlugInstall' to install plugins"
echo "  3. Restart your shell or run 'source ~/.zshrc' to apply changes"
echo "  4. Configure your dotfiles in the dotfiles/ directory and use stow to manage them"
