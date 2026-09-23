-- Browse, run and submit LeetCode problems from nvim.
-- Start with `nvim leetcode.nvim` or `:Leet`. Sign in once via `:Leet cookie update`.
-- The cookie lives in `stdpath("cache")/leetcode/cookie`, outside this repo.

local lang = "rust"

-- Solutions go in the per-language repo under ~/projects/personal, so each one stays
-- its own git repo. The plugin resolves this once at startup, so switching with
-- `:Leet lang` still writes here; change `lang` above to move.
local folders = { python3 = "python", golang = "go" }
local home = vim.fn.expand(("~/projects/personal/%s/leetcode"):format(folders[lang] or lang))

-- Solutions are loose `<id>.<slug>.rs` files, which rust-analyzer ignores outside a
-- project. A Cargo workspace won't work (dotted names can't be modules), so declare
-- each file as its own crate in rust-project.json and reload on question open.
local function sync_rust_project()
  local sysroot = vim.trim(vim.fn.system { "rustc", "--print", "sysroot" })
  local crates = {}
  for _, file in ipairs(vim.fn.glob(home .. "/*.rs", false, true)) do
    table.insert(crates, { root_module = vim.fn.fnamemodify(file, ":t"), edition = "2024", deps = {}, cfg = {} })
  end
  vim.fn.writefile({
    vim.json.encode {
      sysroot = sysroot,
      -- needs `rustup component add rust-src` for std completions
      sysroot_src = sysroot .. "/lib/rustlib/src/rust/library",
      crates = crates,
    },
  }, home .. "/rust-project.json")
  for _, client in ipairs(vim.lsp.get_clients { name = "rust_analyzer" }) do
    client:request("rust-analyzer/reloadWorkspace", nil, function() end)
  end
end

-- Types LeetCode's judge defines for you. Injected code is stripped on run/submit.
local rust_prelude = {
  "#[allow(dead_code)]",
  "struct Solution;",
  "",
  "#[allow(dead_code)]",
  "#[derive(PartialEq, Eq, Clone, Debug)]",
  "pub struct ListNode {",
  "    pub val: i32,",
  "    pub next: Option<Box<ListNode>>,",
  "}",
  "",
  "#[allow(dead_code)]",
  "#[derive(Debug, PartialEq, Eq)]",
  "pub struct TreeNode {",
  "    pub val: i32,",
  "    pub left: Option<std::rc::Rc<std::cell::RefCell<TreeNode>>>,",
  "    pub right: Option<std::rc::Rc<std::cell::RefCell<TreeNode>>>,",
  "}",
}

--- Mix two #RRGGBB colors. `t` is how far to travel from `a` to `b` (0..1).
---@param a string
---@param b string
---@param t number
---@return string
local function blend(a, b, t)
  local ar, ag, ab = a:match "^#(%x%x)(%x%x)(%x%x)$"
  local br, bg, bb = b:match "^#(%x%x)(%x%x)(%x%x)$"
  if not ar or not br then return a end
  local function mix(x, y) return math.floor(tonumber(x, 16) + (tonumber(y, 16) - tonumber(x, 16)) * t + 0.5) end
  return string.format("#%02X%02X%02X", mix(ar, br), mix(ag, bg), mix(ab, bb))
end

-- The default theme already derives most highlights from the active colorscheme, so
-- ayu-dark comes through for free. Only its hardcoded values need overriding.
local function ayu_theme()
  local c = require "ayu.colors"
  -- themes.lua wraps `generate` to darken surfaces, and it only populates the palette
  -- once the colorscheme applies. Re-run in case that hasn't happened yet.
  c.generate(false)

  local theme = {
    easy = { fg = c.string }, -- green
    medium = { fg = c.func }, -- amber
    hard = { fg = c.markup }, -- red

    -- `_alt` backs the progress bars, so it reads as a dim track, not text.
    easy_alt = { fg = blend(c.panel_bg, c.string, 0.25) },
    medium_alt = { fg = blend(c.panel_bg, c.func, 0.25) },
    hard_alt = { fg = blend(c.panel_bg, c.markup, 0.25) },

    -- `guide_normal` is too close to the bg to read; `guide_active` sits near the
    -- stock theme's #45475b.
    all_alt = { fg = c.guide_active },
  }

  -- Submission calendar: empty days sit just above the bg, then ramp to ayu green.
  theme.calendar_0 = { fg = c.guide_active }
  for i = 1, 10 do
    theme[("calendar_%d"):format(i * 10)] = { fg = blend(c.guide_active, c.string, i / 10) }
  end

  return theme
end

---@type LazySpec
return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  lazy = vim.fn.argv(0, -1) ~= "leetcode.nvim",
  build = function() vim.cmd "TSInstall html" end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "3rd/image.nvim", -- optional, enables `image_support` below
    {
      -- Via astrocore so which-key sees these at startup while the plugin stays
      -- lazy until `:Leet`.
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>L"] = { desc = " LeetCode" },

            -- finding something to solve
            ["<Leader>Lm"] = { "<Cmd>Leet menu<CR>", desc = "Menu (dashboard)" },
            ["<Leader>Ll"] = { "<Cmd>Leet list<CR>", desc = "List problems" },
            ["<Leader>LD"] = { "<Cmd>Leet daily<CR>", desc = "Daily question" },
            ["<Leader>LR"] = { "<Cmd>Leet random<CR>", desc = "Random question" },

            -- working the current question
            ["<Leader>Lt"] = { "<Cmd>Leet run<CR>", desc = "Run testcases" },
            ["<Leader>Ls"] = { "<Cmd>Leet submit<CR>", desc = "Submit" },
            ["<Leader>Lc"] = { "<Cmd>Leet console<CR>", desc = "Toggle console" },
            ["<Leader>Li"] = { "<Cmd>Leet info<CR>", desc = "Question info" },
            ["<Leader>Ld"] = { "<Cmd>Leet desc toggle<CR>", desc = "Toggle description pane" },
            ["<Leader>Lo"] = { "<Cmd>Leet open<CR>", desc = "Open in browser" },

            -- editor state
            ["<Leader>Lq"] = { "<Cmd>Leet lang<CR>", desc = "Change language" },
            ["<Leader>Lx"] = { "<Cmd>Leet reset<CR>", desc = "Reset to default snippet" },
            ["<Leader>Lp"] = { "<Cmd>Leet last_submit<CR>", desc = "Load last submission" },
          },
        },
      },
    },
  },
  opts = function()
    return {
      arg = "leetcode.nvim",
      lang = lang,
      storage = { home = home },
      picker = { provider = "snacks-picker" },
      -- Tree/grid questions embed diagrams; kitty renders them inline.
      image_support = true,
      theme = ayu_theme(),
      injector = {
        rust = { before = rust_prelude },
      },
      hooks = {
        question_enter = {
          function(q)
            if q.lang == "rust" then sync_rust_project() end
          end,
        },
      },
    }
  end,
}
