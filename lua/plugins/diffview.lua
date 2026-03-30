return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  opts = function()
    local actions = require "diffview.actions"
    return {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
      },
      keymaps = {
        file_panel = {
          { "n", "<leader>mo", actions.conflict_choose "ours", { desc = "Choose OURS" } },
          { "n", "<leader>mt", actions.conflict_choose "theirs", { desc = "Choose THEIRS" } },
          { "n", "<leader>mb", actions.conflict_choose "base", { desc = "Choose BASE" } },
          { "n", "<leader>ma", actions.conflict_choose "all", { desc = "Choose ALL" } },
          { "n", "<leader>mx", actions.conflict_choose "none", { desc = "Choose NONE" } },
          { "n", "<leader>mO", actions.conflict_choose_all "ours", { desc = "Choose OURS (whole file)" } },
          { "n", "<leader>mT", actions.conflict_choose_all "theirs", { desc = "Choose THEIRS (whole file)" } },
          { "n", "<leader>mB", actions.conflict_choose_all "base", { desc = "Choose BASE (whole file)" } },
          { "n", "<leader>mA", actions.conflict_choose_all "all", { desc = "Choose ALL (whole file)" } },
        },
        view = {
          { "n", "<leader>mo", actions.conflict_choose "ours", { desc = "Choose OURS" } },
          { "n", "<leader>mt", actions.conflict_choose "theirs", { desc = "Choose THEIRS" } },
          { "n", "<leader>mb", actions.conflict_choose "base", { desc = "Choose BASE" } },
          { "n", "<leader>ma", actions.conflict_choose "all", { desc = "Choose ALL" } },
          { "n", "<leader>mx", actions.conflict_choose "none", { desc = "Choose NONE" } },
        },
      },
    }
  end,
}
