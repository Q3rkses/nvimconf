---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "cpp",
      "c",
      "bash",
      "yaml",
      "json",
      "toml",
      "markdown",
      "markdown_inline",
      "cmake",
      "regex",
    },
  },
}
