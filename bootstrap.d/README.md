# Bootstrap Scripts

This directory contains modular installation scripts for setting up a development environment.

## Script Overview

The scripts run in numerical order:

1. **01-system-update.sh** - Updates system packages and installs common tools
2. **02-zsh.sh** - Installs and configures zsh with oh-my-zsh and plugins, including keybindings for zsh-autocomplete
3. **03-gh-cli.sh** - Installs the GitHub CLI
4. **04-neovim.sh** - Installs neovim and configures it with essential plugins (Telescope, ALE, tmux navigator, Fugitive)
5. **05-opencode.sh** - Installs opencode AI tool
6. **06-gcloud.sh** - Installs Google Cloud SDK
7. **07-tmux-mosh.sh** - Installs tmux and mosh with tmux configuration including vim integration
8. **08-mise.sh** - Installs mise for version management
9. **09-direnv-stow.sh** - Installs direnv and stow, with automatic stow setup for dotfiles

## Usage

Run the main bootstrap script:

```bash
./tools/scripts/bootstrap.sh
```

Or run individual scripts:

```bash
./tools/scripts/bootstrap.d/04-neovim.sh
```

## Customization

You can:

- Skip scripts by making them non-executable: `chmod -x 05-opencode.sh`
- Add new scripts with a numeric prefix to control order
- Modify individual scripts without affecting others

## Dotfiles Management with Stow

The `09-direnv-stow.sh` script will automatically stow dotfiles if you have a `dotfiles/` directory in your repository root.

Example dotfiles structure:

```
dotfiles/
  zsh/
    .zshrc
    .zsh_aliases
  vim/
    .vimrc
  tmux/
    .tmux.conf
```

To manually stow a package:

```bash
cd dotfiles
stow -t $HOME zsh
```
