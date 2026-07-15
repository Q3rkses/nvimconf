---@type LazySpec
return {
  "Shatur/neovim-ayu",
  lazy = false, -- ensure it's available at startup
  priority = 1000, -- load before most UI stuff
  config = function()
    local colors = require "ayu.colors"

    --- Nudge a #RRGGBB color a few steps darker, clamped at black
    ---@param hex string
    ---@return string
    local function darken(hex)
      local r, g, b = hex:match "^#(%x%x)(%x%x)(%x%x)$"
      if not r then return hex end
      return string.format(
        "#%02X%02X%02X",
        math.max(tonumber(r, 16) - 3, 0),
        math.max(tonumber(g, 16) - 3, 0),
        math.max(tonumber(b, 16) - 3, 0)
      )
    end

    -- Take every ayu surface down a touch. `generate` rebuilds the palette from scratch on
    -- each colorscheme apply, so wrap it rather than assigning the colors once. Every
    -- background group is derived from these, so they all shift together.
    local generate = colors.generate
    colors.generate = function(mirage)
      generate(mirage)
      for _, name in ipairs { "bg", "line", "panel_bg", "panel_shadow", "panel_border" } do
        colors[name] = darken(colors[name])
      end
    end

    require("ayu").setup {
      mirage = false,
      overrides = {},
    }
    -- AstroVim can also set this via astroui, but doing it here is fine too:
    vim.cmd.colorscheme "ayu-dark"
  end,
}
