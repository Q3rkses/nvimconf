-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation: :h astrocore

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
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
        -- keep AstroVim buffer navigation defaults
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bd"] = {
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
            vim.cmd("write")
            require("astronvim.utils.buffer").format()
          end,
          desc = "Save and format",
        },

        -- VSCode-like move line
        ["<A-j>"] = { ":move .+1<CR>==", desc = "Move line down" },
        ["<A-k>"] = { ":move .-2<CR>==", desc = "Move line up" },

        -- LSP references (AstroVim usually already has gr, but this makes it explicit)
        ["gr"] = {
          function() require("telescope.builtin").lsp_references() end,
          desc = "LSP references",
        },

        -- Optional: explicit back/forward besides Ctrl-o / Ctrl-i
        ["<Leader>b"] = { "<C-o>", desc = "Jump back" },
        ["<Leader>f"] = { "<C-i>", desc = "Jump forward" },
      },

      i = {
        -- Ctrl+S in insert: exit insert, save + format, (stays in normal after)
        ["<C-s>"] = {
          function()
            vim.cmd("stopinsert")
            vim.cmd("write")
            require("astronvim.utils.buffer").format()
          end,
          desc = "Save and format",
        },
      },

      v = {
        -- VSCode-like move selection
        ["<A-j>"] = { ":move '>+1<CR>gv=gv", desc = "Move selection down" },
        ["<A-k>"] = { ":move '<-2<CR>gv=gv", desc = "Move selection up" },
      },
    },
  },
}

