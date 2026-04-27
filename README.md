# dotfiles-bootstrap

Bootstrap script for setting up a fresh machine with my [dotfiles](https://github.com/sashton/dotfiles) (private) via [chezmoi](https://www.chezmoi.io/) and Homebrew.

## Usage

On a fresh macOS, Linux, or WSL 1 machine:

```bash
curl -fsSL https://raw.githubusercontent.com/sashton/dotfiles-bootstrap/main/install.sh | bash
```

This will:

1. Install Homebrew
2. Install GitHub CLI (`gh`)
3. Prompt for `gh auth login` (opens a browser to authenticate)
4. Hand off to `chezmoi init --apply` against the private dotfiles repo
