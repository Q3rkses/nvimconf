return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    sources = { "filesystem", "buffers", "git_status" },
    source_selector = {
      winbar = true,
      statusline = false,
    },
    default_component_configs = {
      indent = { with_markers = true, indent_size = 2 },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "?",
          ignored = "!",
          unstaged = "○",
          staged = "●",
          conflict = "⚠",
        },
      },
    },
    window = {
      position = "right",
      width = 32,
      mappings = {
        -- normal bindings
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["Y"] = "copy",
        ["P"] = "paste_from_clipboard",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
