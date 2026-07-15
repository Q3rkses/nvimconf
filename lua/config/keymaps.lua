return {
  n = {
    -- conform formats on write (see autoformat.lua), so saving is all this needs to do;
    -- formatting after the write would leave the reformatted buffer unsaved
    ["<C-s>"] = { "<Cmd>write<CR>", desc = "Save and format" },

    ["<leader>e"] = {
      "<Cmd>Neotree toggle<CR>",
      desc = "Toggle Explorer (Neo-tree)",
    },
  },

  i = {
    ["<C-s>"] = { "<Cmd>write<CR>", desc = "Save and format" },
  },
}
