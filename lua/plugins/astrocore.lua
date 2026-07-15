---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = require "config.autocmds",
    mappings = require "config.keymaps",

    options = {
      opt = {
        swapfile = true,
        backup = false,
        writebackup = false,
        undofile = true,
        undodir = vim.fn.stdpath "state" .. "/undo//",
        directory = vim.fn.stdpath "state" .. "/swap//",
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        showtabline = 2,
      },
    },

    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },

    diagnostics = {
      virtual_text = true,
      underline = true,
    },
  },
}
