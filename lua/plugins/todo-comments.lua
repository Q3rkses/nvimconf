-- AstroNvim already wires this plugin up (keywords, signs, and the <Leader>fT / ]T / [T
-- mappings), so this only adjusts what its defaults get wrong for this colorscheme.
---@type LazySpec
return {
  "folke/todo-comments.nvim",
  opts = {
    -- Named colors resolve against highlight groups. ayu themes the Diagnostic* groups,
    -- so FIX/TODO/HACK/WARN/NOTE already land on theme colors -- but `default` (PERF) and
    -- `test` fall back to Identifier, which is the same blue as TODO. Pin them apart.
    colors = {
      default = { "#D2A6FF" }, -- purple: PERF / OPTIM / PERFORMANCE
      test = { "#E6B450" }, -- gold: TEST / PASSED / FAILED
    },
  },
}
