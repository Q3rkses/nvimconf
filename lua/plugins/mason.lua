---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "lua-language-server",
        "bash-language-server", -- Bash LSP (same)
        "lemminx", -- XML LSP (for .world, .sdf, .urdf, etc.)
        "clangd", -- C/C++ LSP
        "basedpyright", -- Python LSP

        -- formatters / linters (every entry here is referenced by autoformat.lua)
        "stylua",
        "ruff", -- Python linter+formatter (Rust binary, installs cleanly on 3.14)
        "clang-format",
        "prettier",
        "yamlfmt",
        "shfmt",
        "jq",
      },
    },
  },
}
