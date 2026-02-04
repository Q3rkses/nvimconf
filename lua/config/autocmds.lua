return {
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
}
