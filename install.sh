#!/bin/bash
set -e

# Bootstrap script for sashton's dotfiles.
# Installs Homebrew, GitHub CLI, authenticates, then hands off to chezmoi.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/sashton/dotfiles-bootstrap/main/install.sh | bash

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add brew to PATH for this script
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d /home/linuxbrew/.linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install gh
if ! command -v gh &>/dev/null; then
  brew install gh
fi

# Authenticate with GitHub
if ! gh auth status &>/dev/null; then
  gh auth login
  gh auth setup-git
fi

# Hand off to chezmoi (clones private dotfiles repo via gh credentials)
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --branch chezmoi sashton
