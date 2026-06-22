-- lua/polish.lua
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
