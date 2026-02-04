return {
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require("scrollbar").setup {
        show = true,
        handle = {
          text = " ",
          color = nil,
          hide_if_all_visible = true,
        },
        marks = {
          Search = { color = "orange" },
          Error = { color = "red" },
          Warn = { color = "yellow" },
          Info = { color = "blue" },
          Hint = { color = "green" },
          GitAdd = { color = "green" },
          GitChange = { color = "yellow" },
          GitDelete = { color = "red" },
        },
      }
    end,
  },
}
