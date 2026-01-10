-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation: :h astrocore---@type LazySpec

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Commands at vim startup
    autocmds = require "config.autocmds",
  },

  opt = {
    -- Swap / backup behavior
    swapfile = true, -- keep swap (crash recovery)
    backup = false, -- no ~ files
    writebackup = false,

    -- Persistent undo (best feature, keep it)
    undofile = true,
    undodir = vim.fn.stdpath "state" .. "/undo//",

    -- Less noisy temp behavior
    directory = vim.fn.stdpath "state" .. "/swap//",
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

  -- keep your options
  options = {
    opt = {
      relativenumber = true,
      number = true,
      spell = false,
      signcolumn = "yes",
      wrap = false,
    },
  },

  mappings = {
    n = {
      -- Ctrl+S: save + format
      ["<C-s>"] = {
        function()
          vim.cmd "write"
          require("conform").format { async = true, lsp_fallback = true }
        end,
        desc = "Save and format",
      },
    },

    i = {
      -- Ctrl+S in insert: exit insert, save + format, (stays in normal after)
      ["<C-s>"] = {
        function()
          vim.cmd "write"
          require("conform").format { async = true, lsp_fallback = true }
        end,
        desc = "Save and format",
      },
    },

    v = {
      -- VSCode-like move selection
      ["<A-j>"] = { ":move '>+1<CR>gv=gv", desc = "Move selection down" },
      ["<A-k>"] = { ":move '<-2<CR>gv=gv", desc = "Move selection up" },
    },
    x = {
      ["<A-j>"] = { ":move '>+1<CR>gv=gv", desc = "Move selection down" },
      ["<A-k>"] = { ":move '<-2<CR>gv=gv", desc = "Move selection up" },
    },
  },
}
