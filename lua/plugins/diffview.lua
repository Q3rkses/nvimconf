return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  opts = function()
    local actions = require "diffview.actions"

    -- Resolve a single conflict hunk: <leader>m{o,t,b,a,x}
    local function choose()
      local maps = {}
      for _, side in ipairs { "ours", "theirs", "base", "all", "none" } do
        local key = side:sub(1, 1)
        if side == "none" then key = "x" end
        table.insert(
          maps,
          { "n", "<leader>m" .. key, actions.conflict_choose(side), { desc = "Choose " .. side:upper() } }
        )
      end
      return maps
    end

    -- Resolve every conflict in the file at once: <leader>m{O,T,B,A}
    local function choose_all()
      local maps = {}
      for _, side in ipairs { "ours", "theirs", "base", "all" } do
        table.insert(maps, {
          "n",
          "<leader>m" .. side:sub(1, 1):upper(),
          actions.conflict_choose_all(side),
          { desc = "Choose " .. side:upper() .. " (whole file)" },
        })
      end
      return maps
    end

    return {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
      },
      keymaps = {
        file_panel = vim.list_extend(choose(), choose_all()),
        view = choose(),
      },
    }
  end,
}
