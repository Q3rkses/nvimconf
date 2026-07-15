-- AstroNvim ships none-ls in its core, so simply not having a spec here leaves it
-- enabled -- it has to be turned off explicitly.
--
-- Everything it registered is now covered by tooling already in this config:
--   * formatting (stylua, clang-format, prettier, shfmt, yamlfmt) -> conform.nvim
--   * lua diagnostics (selene)                                    -> lua_ls
--   * python diagnostics                                          -> the ruff language
--     server, which is a strict upgrade: none-ls never registered ruff at all
---@type LazySpec
return {
  { "nvimtools/none-ls.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim", enabled = false },
}
