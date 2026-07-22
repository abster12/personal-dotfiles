# Abhigyan's dotfiles

Personal macOS dev environment. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Stack

- **Shell:** zsh + Starship + fzf + zoxide
- **Editor:** Neovim (lazy.nvim)
- **Terminal:** Ghostty (Catppuccin Macchiato, JetBrains Mono Nerd Font)
- **Git:** sensible defaults + aliases
- **Packages:** Homebrew Brewfile

## Setup

```bash
# already cloned to ~/.dotfiles
~/.dotfiles/bootstrap.sh
```

Or step by step:

```bash
brew bundle --file=~/.dotfiles/packages/Brewfile
cd ~/.dotfiles && stow --restow --target=$HOME home
```

## Layout

```
~/.dotfiles/
├── bootstrap.sh
├── packages/Brewfile
└── home/                 # stowed → ~
    ├── .zshrc
    ├── .zprofile
    └── .config/
        ├── nvim/
        ├── ghostty/
        ├── git/
        ├── starship.toml
        └── ripgrep/
```

## Updating

```bash
# after editing files in ~/.dotfiles/home
cd ~/.dotfiles && stow --restow --target=$HOME home

# packages
brew bundle --file=~/.dotfiles/packages/Brewfile
```

## Important

Edit files under `~/.dotfiles/home/...`, not the symlinked paths directly
(or edit via the symlink — both work since they're the same inode).
Never replace a symlink with a real file if you want stow to keep managing it.
