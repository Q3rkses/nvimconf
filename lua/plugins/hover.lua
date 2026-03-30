return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup {
      init = function()
        require "hover.providers.lsp"
        require "hover.providers.man"
      end,
      preview_opts = {
        border = "rounded",
      },
      preview_window = false,
      title = true,
    }
  end,
  keys = {
    {
      "K",
      function() require("hover").hover() end,
      desc = "Hover",
    },
    {
      "gK",
      function() require("hover").hover_select() end,
      desc = "Hover select provider",
    },
  },
}
