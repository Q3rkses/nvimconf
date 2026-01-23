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

  no_binary_image_buffers = {
    {
      event = { "BufReadPre", "BufNewFile" },
      pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.bmp", "*.tiff" },
      desc = "Disable text features for image files",
      callback = function(args)
        vim.bo[args.buf].swapfile = false
        vim.bo[args.buf].undofile = false
        vim.bo[args.buf].bufhidden = "wipe"
        vim.bo[args.buf].buftype = "nofile"
      end,
    },
  },
}
