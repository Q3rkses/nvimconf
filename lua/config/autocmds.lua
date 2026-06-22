return {
  -- Auto-dismiss the "swap file found" dialog by silently deleting the swap.
  -- With undofile = true, persistent undo covers the recovery use case.
  dismiss_swap_dialog = {
    {
      event = "SwapExists",
      desc = "Auto-delete stale swap files without prompting",
      callback = function() vim.v.swapchoice = "d" end,
    },
  },

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
