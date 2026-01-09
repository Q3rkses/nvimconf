-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation: :h astrocore---@type LazySpec

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
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

    autocmds = {
      kitty_padding = {
        {
          event = "VimEnter",
          desc = "Disable kitty padding in Neovim",
          callback = function()
            local to = vim.env.KITTY_LISTEN_ON
            local win = vim.env.KITTY_WINDOW_ID
            if to and win then
              vim.fn.system {
                "kitty",
                "@",
                "--to",
                to,
                "set-spacing",
                "--match",
                "id:" .. win,
                "padding=0",
              }
            end
          end,
        },
        {
          event = "VimLeavePre",
          desc = "Restore kitty padding after Neovim exits",
          callback = function()
            local to = vim.env.KITTY_LISTEN_ON
            local win = vim.env.KITTY_WINDOW_ID
            if to and win then
              vim.fn.system {
                "kitty",
                "@",
                "--to",
                to,
                "set-spacing",
                "--match",
                "id:" .. win,
                "padding=10",
              }
            end
          end,
        },
      },
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
        -- keep AstroVim buffer navigation defaults
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bp"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
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
  },
}
