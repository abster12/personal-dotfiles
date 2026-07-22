local opt = vim.opt
local g = vim.g

-- Leader
g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs / indent
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "80"
opt.showmode = false
opt.wrap = false
opt.splitbelow = true
opt.splitright = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.fillchars = { eob = " " }
opt.laststatus = 3
opt.pumheight = 12
opt.winborder = "rounded"

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.isfname:append("@-@")

-- Folds (ufo-friendly defaults; treesitter can drive them)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Disable netrw (oil.nvim replaces it)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
