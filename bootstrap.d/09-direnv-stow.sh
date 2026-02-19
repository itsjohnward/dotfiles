#!/bin/sh
set -e

echo "Installing direnv and stow..."
sudo apt install -y direnv stow
echo "eval \"\$(direnv hook zsh)\"" >> ~/.zshrc

# Set up stow for dotfiles management
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)"
DOTFILES_DIR="$REPO_ROOT/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
  echo "Using stow to manage dotfiles from $DOTFILES_DIR..."
  cd "$DOTFILES_DIR"
  
  # Stow all packages in the dotfiles directory (skip hidden and special directories)
  for dir in */; do
    package_name=$(basename "$dir")
    # Skip common non-dotfile directories
    case "$package_name" in
      .git|README|docs|scripts|bin)
        echo "Skipping $package_name..."
        continue
        ;;
    esac
    echo "Stowing $package_name..."
    stow -t "$HOME" "$package_name" || echo "Warning: Failed to stow $package_name (may already exist)"
  done
  
  echo "Dotfiles stowed successfully!"
else
  echo "Info: No dotfiles directory found at $DOTFILES_DIR"
  echo "You can create a dotfiles structure like:"
  echo "  dotfiles/"
  echo "    zsh/.zshrc"
  echo "    vim/.vimrc"
  echo "    tmux/.tmux.conf"
  echo "Then run: cd $DOTFILES_DIR && stow -t \$HOME <package>"
fi
