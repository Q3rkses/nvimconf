---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "ayu-dark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = {
        NoiceCmdlinePopupBorder = { fg = "#E6B450" },
        NoiceCmdlinePopupTitle = { fg = "#E6B450", bold = true },
        NoiceCmdlineIcon = { fg = "#E6B450" },
        PmenuSel = { fg = "#0A0E14", bg = "#E6B450" },
        -- winbar (breadcrumbs) and tabline both sit on the editor bg so neither reads
        -- as a separate strip
        WinBar = { fg = "#565B66", bg = "#080B11" },
        WinBarNC = { fg = "#3E434E", bg = "#080B11" },
        TabLine = { fg = "#565B66", bg = "#080B11" },
        TabLineFill = { bg = "#080B11" },
        TabLineSel = { fg = "#BFBDB6", bg = "#0E1219" }, -- active tab lifts only slightly
        WinSeparator = { fg = "#05080D", bg = "#05080D" },
        NeoTreeNormal = { bg = "#05080D" },
        NeoTreeNormalNC = { bg = "#05080D" },
        NeoTreeEndOfBuffer = { bg = "#05080D" },
        -- neo-tree ships hardcoded near-black defaults for the source selector tabs;
        -- blend them into the panel so the whole column reads as one surface
        NeoTreeTabActive = { bg = "#05080D", fg = "#E6B450", bold = true },
        NeoTreeTabInactive = { bg = "#05080D", fg = "#565B66" },
        NeoTreeTabSeparatorActive = { bg = "#05080D", fg = "#05080D" },
        NeoTreeTabSeparatorInactive = { bg = "#05080D", fg = "#05080D" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- nvchad-style statusline: one accent block for the mode, muted greys through the
    -- middle, and small accent pills closing out the right (see heirline.lua for shapes)
    status = {
      attributes = {
        mode = { bold = true },
      },
      colors = {
        -- the bar itself sits just barely above the editor bg
        fg = "#BFBDB6",
        bg = "#0C1017",
        section_fg = "#8A9199",
        section_bg = "#0C1017",

        -- monochrome mode blocks: white / grey / darker grey rather than accent hues
        normal = "#FFFFFF",
        insert = "#9BA3AE",
        visual = "#5F6673",
        replace = "#B8BFC9",
        command = "#7A8290",
        terminal = "#9BA3AE",
        inactive = "#3E434E",

        -- dark text punched out of any solid block (mode, pills)
        block_fg = "#080B11",
        mode_fg = "#080B11",

        -- the recessed file box, one step lighter than the bar
        file_info_fg = "#BFBDB6",
        file_info_bg = "#171C26",

        git_branch_fg = "#7A8290", -- dim, no block
        lsp_fg = "#8A9199",

        -- ayu doesn't define the GitSigns* groups AstroNvim probes for, so these would
        -- otherwise fall back to generic non-ayu colors; use ayu's own vcs palette
        git_added = "#7FD962",
        git_changed = "#73B8FF",
        git_removed = "#F26D78",

        -- rounded pills on the right; fg and bg match so icon pill + text read as one
        directory_fg = "#F07178", -- salmon
        directory_bg = "#F07178",
        nav_fg = "#FF8F40", -- orange
        nav_bg = "#FF8F40",

        -- quieter buffer tabs: the active tab lifts only slightly off the tabline
        tabline_bg = "#080B11",
        buffer_bg = "#080B11",
        buffer_fg = "#565B66",
        buffer_active_bg = "#0E1219",
        buffer_active_fg = "#BFBDB6",

        -- used by the tabline to reserve the Neo-tree column (see heirline.lua)
        neotree_bg = "#05080D",
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
