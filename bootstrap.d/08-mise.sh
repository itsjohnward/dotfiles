#!/bin/sh
set -e

echo "Installing mise..."
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc

# Detect repo root dynamically
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)"

if [ -f "$REPO_ROOT/.github/nodejs.version" ]; then
  NODE_VERSION=$(cat "$REPO_ROOT/.github/nodejs.version")
  ~/.local/bin/mise use --global "node@$NODE_VERSION"
  echo "Configured mise to use Node.js $NODE_VERSION"
else
  echo "Warning: .github/nodejs.version not found. Skipping Node.js installation."
fi
