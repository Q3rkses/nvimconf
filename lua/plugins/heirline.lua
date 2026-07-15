return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    -- nvchad-style shapes: left-hand blocks taper off with a hard slant,
    -- right-hand blocks sit in rounded pills
    local slant = vim.fn.nr2char(0xE0BC) -- powerline upper-left triangle, a "/" taper
    local round_l = vim.fn.nr2char(0xE0B6) -- powerline left half circle
    local round_r = vim.fn.nr2char(0xE0B4) -- powerline right half circle
    local icon_dir = vim.fn.nr2char(0xF024B) -- nf-md-folder
    local icon_nav = vim.fn.nr2char(0xF0CA) -- nf-fa-list_ul

    --- A blank cell between elements; a fresh table per call so heirline can hold
    --- its own state on each one
    local function gap() return { provider = " " } end

    --- A rounded icon pill followed by plain accent text, like nvchad's cwd/position blocks
    ---@param color string name of the color for the pill and its text
    ---@param icon string the glyph shown inside the pill
    ---@param text function provider for the text trailing the pill
    ---@param update table|string events that refresh the text
    local function pill(color, icon, text, update)
      return {
        { provider = round_l, hl = { fg = color, bg = "bg" } },
        { provider = icon, hl = { fg = "block_fg", bg = color } },
        { provider = round_r, hl = { fg = color, bg = "bg" } },
        { provider = text, hl = { fg = color, bg = "bg" }, update = update },
      }
    end

    local directory = pill(
      "directory_bg",
      icon_dir,
      function() return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " " end,
      { "DirChanged", "BufEnter" }
    )

    local navigation = pill("nav_bg", icon_nav, status.provider.percentage { padding = { left = 1, right = 1 } }, {
      "CursorMoved",
      "CursorMovedI",
      "BufEnter",
    })

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },

      -- mode: solid accent block tapering into the file box
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
        surround = {
          separator = { "", slant },
          color = function() return { main = status.hl.mode_bg(), right = "file_info_bg" } end,
          update = { "ModeChanged", pattern = "*:*" },
        },
      },

      -- file: recessed box tapering into the bar
      status.component.file_info {
        filename = { padding = { right = 1 } },
        filetype = false,
        surround = { separator = { "", slant }, color = { main = "file_info_bg", right = "bg" } },
      },

      -- everything mid-bar rides directly on the bar, no blocks
      gap(),
      status.component.git_branch { surround = false },
      gap(),
      status.component.git_diff { surround = false },
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.diagnostics { surround = false },
      gap(),
      status.component.lsp { surround = false },
      gap(),
      directory,
      gap(),
      navigation,
      gap(),
    }

    -- AstroNvim's built-in tabline padding only covers a sidebar in the *first* window,
    -- so a right-docked Neo-tree still gets the bufferline drawn over its column. Reserve
    -- that column in Neo-tree's own background so the tree reads as flush with the top.
    local function sidebar_win()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neo-tree" then return win end
      end
    end
    if opts.tabline then
      table.insert(opts.tabline, {
        condition = function(self)
          self.winid = sidebar_win()
          if not self.winid then return false end
          self.winwidth = vim.api.nvim_win_get_width(self.winid)
          -- only when docked against the right edge
          return vim.api.nvim_win_get_position(self.winid)[2] + self.winwidth >= vim.o.columns
        end,
        provider = function(self) return (" "):rep(self.winwidth + 1) end,
        hl = { bg = "neotree_bg" },
        update = { "BufWinEnter", "BufWinLeave", "WinNew", "WinClosed", "WinResized", "VimResized" },
      })
    end

    return opts
  end,
}
