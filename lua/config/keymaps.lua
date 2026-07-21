return {
  n = {
    -- conform formats on write (see autoformat.lua), so saving is all this needs to do;
    -- formatting after the write would leave the reformatted buffer unsaved
    ["<C-s>"] = { "<Cmd>write<CR>", desc = "Save and format" },
    ["<leader>e"] = {
      "<Cmd>Neotree toggle<CR>",
      desc = "Toggle Explorer (Neo-tree)",
    },

    -- Center cursor on movement inside of files.
    ["<C-d>"] = { "<C-d>zz", desc = "Half-page down, centered" },
    ["<C-u>"] = { "<C-u>zz", desc = "Half-page up, centered" },
    ["n"] = { "nzzzv", desc = "Next search result, centered" },
    ["N"] = { "Nzzzv", desc = "Prev search result, centered" },
  },

  i = {
    ["<C-s>"] = { "<Cmd>write<CR>", desc = "Save and format" },
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up" },
    ["p"] = { [["_dP]], desc = "Paste without overwriting register" },
  },
  t = {
    ["jk"] = { "<C-\\><C-n>", desc = "Terminal: escape to normal mode" },
  },
}
