local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- jj / jk to escape insert
map("i", "jj", "<Esc>")
map("i", "jk", "<Esc>")

-- Better line start/end
map({ "n", "v", "o" }, "H", "^")
map({ "n", "v", "o" }, "L", "$")

-- Save / quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Resize splits
map("n", "<A-h>", "<cmd>vertical resize -2<CR>", { desc = "Shrink width" })
map("n", "<A-l>", "<cmd>vertical resize +2<CR>", { desc = "Grow width" })
map("n", "<A-j>", "<cmd>resize -2<CR>", { desc = "Shrink height" })
map("n", "<A-k>", "<cmd>resize +2<CR>", { desc = "Grow height" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste (don't replace register when pasting over selection)
map("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Yank to system clipboard explicitly
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Diagnostics
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>td", function()
  local enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not enabled)
end, { desc = "Toggle diagnostics" })

-- Quickfix (don't leave visual)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })
