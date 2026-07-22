return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 400,
    spec = {
      { "<leader>f", group = "find/format" },
      { "<leader>h", group = "git hunks / harpoon" },
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>r", group = "rename/restart" },
      { "<leader>t", group = "toggle" },
      { "<leader>u", group = "ui/undo" },
      { "<leader>x", group = "diagnostics" },
    },
  },
}
