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

## Neovim

Leader key: `<Space>`

### Plugins

| Plugin | Purpose |
|--------|---------|
| **telescope.nvim** | Fuzzy finder for files, text, symbols, git |
| **oil.nvim** | File explorer (edit filesystem as text) |
| **harpoon** | Quick file jumping between frequently used files |
| **conform.nvim** | Code formatting (black, prettier, stylua, etc.) |
| **blink.cmp** | Autocompletion |
| **nvim-treesitter** | Syntax highlighting & code understanding |
| **gitsigns.nvim** | Git diff signs in the gutter |
| **which-key.nvim** | Keybinding cheatsheet (press leader and wait) |
| **lualine.nvim** | Statusline |
| **catppuccin** | Colorscheme |
| **todo-comments.nvim** | Highlight TODO/FIXME comments |
| **trouble.nvim** | Pretty diagnostics list |
| **render-markdown.nvim** | Render markdown in-buffer |
| **undotree** | Visual undo history |

### Formatters

| Language | Formatter |
|----------|----------|
| Python | black |
| JavaScript/TypeScript | prettier |
| JSON, HTML, CSS, SCSS, YAML | prettier |
| Lua | stylua |
| Shell (sh/bash/zsh) | shfmt |

All formatters are auto-installed via **Mason** on first launch.

### File Navigation (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (uses `fd`) |
| `<leader>fg` | Live grep (search across files) |
| `<leader>fb` | List open buffers |
| `<leader>fr` | Recent files |
| `<leader>fw` | Grep word under cursor |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader>fs` | Document symbols (functions, classes) |
| `<leader>fS` | Workspace symbols |
| `<leader>fd` | List diagnostics |
| `<leader>fk` | List keymaps |
| `<leader>fh` | Help tags |
| `<leader>fc` | Git commits |
| `<leader>fB` | Git branches |

### File Explorer (Oil.nvim)

| Key | Action |
|-----|--------|
| `-` | Open parent directory (like vim-vinegar) |
| `<leader>e` | Open file explorer |
| `q` | Close explorer |

Oil lets you edit the filesystem like a buffer — rename, delete, create files by editing text.

### Harpoon (Quick file jumping)

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to harpoon list |
| `<leader>h` | Toggle harpoon quick menu |
| `<leader>1` | Jump to harpoon file 1 |
| `<leader>2` | Jump to harpoon file 2 |
| `<leader>3` | Jump to harpoon file 3 |
| `<leader>4` | Jump to harpoon file 4 |

### LSP / Code Actions

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action (quick fix) |
| `<leader>rs` | Restart LSP |
| `<leader>F` | Format buffer |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Show line diagnostic (float) |
| `<leader>td` | Toggle diagnostics |

### Buffers

| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader>bd` | Delete/close buffer |

### Windows

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `<A-h/j/k/l>` | Resize windows (alt + direction) |

### Editing

| Key | Action |
|-----|--------|
| `jj` or `jk` | Exit insert mode |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all (discard changes) |
| `H` | Jump to line start (first non-blank) |
| `L` | Jump to line end |
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `<leader>p` | Paste without overwriting register |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<C-a>` | Select all |
| `<Esc>` | Clear search highlights |
| `<C-d/u>` | Scroll down/up (keeps cursor centered) |
| `< >` (visual) | Indent/outdent (keeps selection) |

### Useful Commands

```vim
:Telescope find_files     " Find files
:Telescope live_grep      " Search text across project
:Oil                      " Open file explorer
:Mason                    " Manage LSP servers/formatters
:Lazy sync                " Update all plugins
:ConformInfo              " Check formatter status
:LspInfo                  " Check LSP server status
```

### Tips

- **Harpoon workflow**: Use `<leader>a` to add files you're working on. Then jump between them with `<leader>1-4`. Much faster than re-finding files.
- **Oil is powerful**: Press `-` in any file to go up a directory. You can create files by typing their name, rename by editing, delete by removing lines.
- **Which-key**: Press `<leader>` and wait ~400ms — a popup shows all available keybindings.
- **Telescope in projects**: `<leader>fg` (live grep) searches your entire project. Use `<leader>fw` to find all occurrences of the word under cursor.
- **Paste without losing clipboard**: Select text, then `<leader>p` replaces it without overwriting your yank register.
- **Moving lines**: In visual mode, `J` and `K` move the selection up/down.

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
