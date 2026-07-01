return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = true,
    notify_on_error = false,

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      json = { "jq" },
      yaml = { "yamlfmt" },
      markdown = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
  },
}
