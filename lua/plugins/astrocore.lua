-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation: :h astrocore

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = require "config.autocmds",

    options = {
      opt = {
        -- Swap / backup behavior
        swapfile = true,
        backup = false,
        writebackup = false,

        -- Persistent undo
        undofile = true,
        undodir = vim.fn.stdpath "state" .. "/undo//",

        -- Swap directory
        directory = vim.fn.stdpath "state" .. "/swap//",

        -- Editor prefs
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
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

    mappings = {
      n = {
        ["<C-s>"] = {
          function()
            vim.cmd "write"
            require("conform").format { async = true, lsp_fallback = true }
          end,
          desc = "Save and format",
        },

        ["<leader>e"] = {
          function() require("snacks").explorer() end,
          desc = "Explorer (Snacks)",
        },
      },

      i = {
        ["<C-s>"] = {
          function()
            vim.cmd "write"
            require("conform").format { async = true, lsp_fallback = true }
          end,
          desc = "Save and format",
        },
      },

      v = {
        ["<A-j>"] = { ":move '>+1<CR>gv=gv", desc = "Move selection down" },
        ["<A-k>"] = { ":move '<-2<CR>gv=gv", desc = "Move selection up" },
      },

      x = {
        ["<A-j>"] = { ":move '>+1<CR>gv=gv", desc = "Move selection down" },
        ["<A-k>"] = { ":move '<-2<CR>gv=gv", desc = "Move selection up" },
      },
    },
  },
}
