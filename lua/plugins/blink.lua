return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = function(_, opts)
      opts = opts or {}

      local ok_luasnip, luasnip = pcall(require, "luasnip")
      if ok_luasnip then pcall(function() require("luasnip.loaders.from_vscode").lazy_load() end) end

      -- Core completion behavior
      opts.completion = opts.completion or {}
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.auto_show = true

      -- Show docs while navigating
      opts.completion.documentation = opts.completion.documentation or {}
      opts.completion.documentation.auto_show = true
      opts.completion.documentation.auto_show_delay_ms = 150

      -- Ghost text (inline preview).
      opts.completion.ghost_text = { enabled = true }

      -- Sources: LSP + snippets + path + buffer (the classic “best of all worlds”)
      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp", "snippets", "path", "buffer" }

      opts.cmdline = { enabled = true }

      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "default"

      return opts
    end,
  },
}
