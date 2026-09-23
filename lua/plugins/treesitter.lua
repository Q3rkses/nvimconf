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
      "rust", -- leetcode.nvim solutions
      "html", -- leetcode.nvim question descriptions
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
