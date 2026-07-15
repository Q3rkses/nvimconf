return {
  "stevearc/conform.nvim",
  opts = {
    -- conform is the single source of truth for formatting; LSP format-on-save is turned
    -- off in astrolsp.lua and none-ls is disabled, otherwise a save would run several
    -- formatters over the same buffer. `fallback` still lets the LSP format filetypes
    -- that have no formatter listed below.
    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
    notify_on_error = true,

    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      python = { "ruff_organize_imports", "ruff_format" },
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
