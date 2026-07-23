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

### Language Servers & Formatters

| Language | LSP Server | Formatter |
|----------|-----------|-----------|
| Lua | lua-language-server | stylua |
| JavaScript/TypeScript | ts_ls + eslint | prettier |
| JSON | json-lsp | prettier |
| HTML | html-lsp | prettier |
| CSS/SCSS | css-lsp | prettier |
| Python | pyright | black |
| Shell (sh/bash/zsh) | bashls | shfmt |
| YAML | yamlls | prettier |
| Java | jdtls | — |

All language servers and formatters are auto-installed via **Mason** on first launch.

### File Navigation (Telescope)

| Key | Description |
|-----|-------------|
| `<leader>ff` | **Find files** — Opens a fuzzy file finder powered by `fd` for fast searching. Type to filter by name, press Enter to open. Hidden files included. |
| `<leader>fg` | **Live grep** — Searches text content across your entire project using ripgrep. Results update as you type. Great for finding where a function or variable is used. |
| `<leader>fb` | **List buffers** — Shows all currently open files (buffers). Quick way to switch between files you already have open without closing anything. |
| `<leader>fr` | **Recent files** — Shows your most recently opened files. Perfect for reopening a file you were just working on but closed. |
| `<leader>fw` | **Grep word under cursor** — Instantly searches the entire project for the word your cursor is on. No need to copy-paste or type it out. |
| `<leader>/` | **Search in buffer** — Fuzzy find text within the current file only. Fast way to jump to a specific line or section in the open file. |
| `<leader>fs` | **Document symbols** — Lists all functions, classes, variables, and other symbols in the current file using LSP. Jump directly to any symbol. |
| `<leader>fS` | **Workspace symbols** — Same as above but searches across the entire project. Find any function or class from anywhere in your codebase. |
| `<leader>fd` | **Diagnostics** — Lists all errors, warnings, and hints from the LSP across your project. Navigate directly to any issue. |
| `<leader>fk` | **Keymaps** — Opens a searchable list of all your keybindings. Great for discovering or remembering shortcuts. |
| `<leader>fh` | **Help tags** — Fuzzy search through Neovim's built-in help documentation. Learn about any Vim feature or command. |
| `<leader>fc` | **Git commits** — Browse your git commit history. View commit messages, authors, and diffs for any commit. |
| `<leader>fB` | **Git branches** — List all local and remote branches. Select one to switch to it instantly. |

### File Explorer (Oil.nvim)

Oil turns your filesystem into a normal Neovim buffer you can edit directly — rename files by editing their name, create files by typing a new name, delete files by removing their line.

| Key | Description |
|-----|-------------|
| `-` | **Open parent directory** — Opens the folder containing the current file. Press `-` again to go up another level. Like a file browser's "back" button. |
| `<leader>e` | **Open file explorer** — Opens Oil at the project root. Browse your project structure visually, then select a file to open it. |
| `q` | **Close explorer** — Closes the Oil window and returns to your previous buffer. |

### Harpoon (Quick file jumping)

Harpoon lets you mark frequently-used files and jump between them instantly. Think of it as browser bookmarks for your code files.

| Key | Description |
|-----|-------------|
| `<leader>a` | **Add file** — Marks the current file in your harpoon list. Add up to 4+ files you're actively working on. |
| `<leader>h` | **Toggle menu** — Opens the harpoon quick menu showing all marked files. You can reorder, add, or remove entries here. |
| `<leader>1` | **Jump to file 1** — Instantly switch to the first file in your harpoon list. No searching, no tabs — just one keystroke. |
| `<leader>2` | **Jump to file 2** — Instantly switch to the second file in your harpoon list. |
| `<leader>3` | **Jump to file 3** — Instantly switch to the third file in your harpoon list. |
| `<leader>4` | **Jump to file 4** — Instantly switch to the fourth file in your harpoon list. |

### LSP / Code Actions

These shortcuts use the Language Server Protocol (LSP) — the same intelligence that powers autocomplete, error detection, and "Go to Definition" in VS Code.

| Key | Description |
|-----|-------------|
| `gd` | **Go to definition** — Jumps to where the function/class/variable under your cursor is defined. Like "right-click → Go to Definition" in VS Code. |
| `gD` | **Go to declaration** — Jumps to the declaration of a symbol. May differ from definition in languages with forward declarations (e.g., C/C++). |
| `gr` | **Find references** — Shows every place the symbol under cursor is used across the project. Essential for understanding impact before renaming. |
| `gi` | **Go to implementation** — Jumps to the concrete implementation of an interface or abstract method. Useful in OOP codebases. |
| `gt` | **Go to type definition** — Shows the actual type/struct of a variable. Helpful when a function returns an interface and you want to see the concrete type. |
| `K` | **Hover documentation** — Shows a popup with the type signature, docstring, and documentation for the symbol under cursor. |
| `<leader>rn` | **Rename symbol** — Renames the variable/function/class under cursor across the entire project. All references update automatically. |
| `<leader>ca` | **Code action** — Shows available quick fixes and refactors at cursor position — auto-imports, extract variable, fix lint errors, etc. |
| `<leader>rs` | **Restart LSP** — Restarts the language server. Use when the LSP gets stuck, stops giving completions, or after changing config. |
| `<leader>F` | **Format buffer** — Formats the current file using the configured formatter (black for Python, prettier for JS/TS, etc.). |
| `[d` | **Previous diagnostic** — Jumps to the previous error or warning in the file and shows details in a floating popup. |
| `]d` | **Next diagnostic** — Jumps to the next error or warning in the file and shows details in a floating popup. |
| `<leader>d` | **Line diagnostics** — Shows all diagnostics for the current line in a floating popup. Useful when multiple errors overlap. |
| `<leader>td` | **Toggle diagnostics** — Turns all error/warning indicators on or off. Handy when you want a clean view while reading code. |

### Buffers

Buffers are open files. You can have many buffers open but only see one at a time. These shortcuts let you switch between them quickly.

| Key | Description |
|-----|-------------|
| `<S-h>` | **Previous buffer** — Switch to the file to the left (like switching browser tabs left). Shift+H. |
| `<S-l>` | **Next buffer** — Switch to the file to the right (like switching browser tabs right). Shift+L. |
| `<leader>bd` | **Delete buffer** — Closes the current file without closing the window/split. Other buffers stay open. |

### Windows (Splits)

Windows are split panes within Neovim. You can have multiple files visible side by side.

| Key | Description |
|-----|-------------|
| `<C-h>` | **Move to left window** — Jump your cursor to the split on the left. |
| `<C-j>` | **Move to window below** — Jump your cursor to the split below. |
| `<C-k>` | **Move to window above** — Jump your cursor to the split above. |
| `<C-l>` | **Move to right window** — Jump your cursor to the split on the right. |
| `<A-h>` | **Shrink width** — Make the current window narrower by 2 columns (Alt+H). |
| `<A-l>` | **Grow width** — Make the current window wider by 2 columns (Alt+L). |
| `<A-j>` | **Shrink height** — Make the current window shorter by 2 rows (Alt+J). |
| `<A-k>` | **Grow height** — Make the current window taller by 2 rows (Alt+K). |

### Editing

| Key | Description |
|-----|-------------|
| `jj` or `jk` | **Exit insert mode** — Type these quickly instead of reaching for Escape. Much faster for touch typists. |
| `<leader>w` | **Save file** — Writes the current buffer to disk. |
| `<leader>q` | **Quit** — Closes the current window. Neovim warns you if there are unsaved changes. |
| `<leader>Q` | **Quit all** — Force-closes all windows and exits Neovim without saving. |
| `H` | **Line start** — Jumps to the first non-blank character of the line (like pressing `^` in normal Vim). |
| `L` | **Line end** — Jumps to the last character of the line (like pressing `$` in normal Vim). |
| `J` (visual) | **Move line down** — In visual mode, moves the selected line(s) down by one. Selection stays active so you can keep pressing. |
| `K` (visual) | **Move line up** — In visual mode, moves the selected line(s) up by one. Selection stays active so you can keep pressing. |
| `<leader>p` | **Paste without losing clipboard** — Pastes over a visual selection without replacing what's in your yank register. The original copied text is preserved. |
| `<leader>y` | **Yank to clipboard** — Copies selected text to the **system** clipboard so you can paste it in other apps (browser, Slack, etc.). |
| `<leader>Y` | **Yank line to clipboard** — Copies the entire current line to the system clipboard. |
| `<C-a>` | **Select all** — Selects all text in the current buffer (Ctrl+A). |
| `<Esc>` | **Clear highlights** — Removes the yellow highlight from search results after you're done reviewing matches. |
| `<C-d>` | **Scroll down** — Scrolls half a page down while keeping your cursor centered on screen. Easier to read while scrolling. |
| `<C-u>` | **Scroll up** — Scrolls half a page up while keeping your cursor centered on screen. |
| `<` (visual) | **Outdent** — Shifts selected lines one indent level to the left. Selection stays active so you can keep pressing. |
| `>` (visual) | **Indent** — Shifts selected lines one indent level to the right. Selection stays active so you can keep pressing. |

### Useful Commands

| Command | Description |
|---------|-------------|
| `:Telescope find_files` | Open the file finder from the command line instead of using the keybinding. |
| `:Telescope live_grep` | Open live grep from the command line. Useful for scripting or when you forget the keybinding. |
| `:Oil` | Open the file explorer from the command line. |
| `:Mason` | Opens Mason's UI to manage LSP servers and formatters. Install, update, or uninstall tools here. |
| `:MasonInstall <name>` | Manually install a specific tool (e.g., `:MasonInstall black` or `:MasonInstall prettier`). |
| `:Lazy sync` | Updates all plugins to their latest versions. Run periodically to get bug fixes and new features. |
| `:Lazy clean` | Removes plugins that are no longer referenced in your config. |
| `:ConformInfo` | Shows which formatter will be used for the current file type and whether it's installed correctly. |
| `:LspInfo` | Shows which language servers are attached to the current buffer and their status. Debug LSP issues here. |
| `:TSInstall <lang>` | Manually install a treesitter parser for a language (e.g., `:TSInstall python`). |

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
