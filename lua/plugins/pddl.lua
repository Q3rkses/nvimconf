-- lua/plugins/pddl.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add {
        extension = {
          pddl = "lisp",
          world = "xml",
          sdf = "xml",
        },
      }
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "commonlisp", "xml" })
    end,
  },
}
