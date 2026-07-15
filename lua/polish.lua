-- lua/polish.lua

vim.env.PATH = vim.fn.expand "~/.cargo/bin" .. ":" .. vim.env.PATH

vim.filetype.add {
  extension = {
    moos = "moos",
    bhv = "moos",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "moos",
  callback = function() vim.bo.commentstring = "// %s" end,
  desc = "Set commentstring for MOOS files",
})

local function ghost_hl() vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#9399b2", italic = true }) end
vim.api.nvim_create_autocmd("ColorScheme", { callback = ghost_hl })
ghost_hl()

vim.deprecate = function() end
