# dotfiles-bootstrap

Bootstrap script for setting up a fresh machine with my [dotfiles](https://github.com/sashton/dotfiles) (private) via [chezmoi](https://www.chezmoi.io/) and Homebrew.

## Usage

On a fresh macOS, Linux, or WSL machine:

```bash
curl -fsSL https://raw.githubusercontent.com/sashton/dotfiles-bootstrap/main/install.sh -o /tmp/bootstrap.sh && bash /tmp/bootstrap.sh && rm /tmp/bootstrap.sh
```

Download-then-run (rather than `curl | bash`) gives the script an interactive TTY, which Homebrew's installer needs for sudo prompts and `gh auth login` needs for browser-based authentication.

This will:

1. Install Homebrew
2. Install GitHub CLI (`gh`)
3. Prompt for `gh auth login` (opens a browser to authenticate)
4. Hand off to `chezmoi init --apply` against the private dotfiles repo
