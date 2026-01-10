---@type LazySpec
return {
  "Shatur/neovim-ayu",
  lazy = false, -- ensure it's available at startup
  priority = 1000, -- load before most UI stuff
  config = function()
    require("ayu").setup {
      mirage = false,
      overrides = {},
    }
    -- AstroVim can also set this via astroui, but doing it here is fine too:
    vim.cmd.colorscheme "ayu-dark"
  end,
}
