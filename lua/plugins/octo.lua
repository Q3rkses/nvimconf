---@type LazySpec
return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      picker = "snacks",
    },
    keys = {
      { "<leader>op", "<cmd>Octo pr list<cr>", desc = "GitHub PR list" },
      { "<leader>oi", "<cmd>Octo issue list<cr>", desc = "GitHub issue list" },
    },
  },
}
