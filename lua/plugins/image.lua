-- Inline image rendering via the terminal graphics protocol.
-- Pulled in for leetcode.nvim's `image_support`. It does a bare `require("image")`,
-- so snacks.image does not satisfy it. Needs kitty.

---@type LazySpec
return {
  "3rd/image.nvim",
  -- Loaded by description render time; `Leet` is the only entry point.
  cmd = "Leet",
  -- The repo ships a rockspec, so lazy would set `build = "rockspec"` and pull in
  -- hererocks to build the `magick` rock. `magick_cli` below makes it dead weight,
  -- and the build fails anyway with no Lua 5.1 available.
  build = false,
  opts = {
    backend = "kitty",
    -- Shells out to ImageMagick instead of the luarock. Handles v6 (`convert`) as
    -- well as v7 (`magick`), and v6 is what's installed here.
    processor = "magick_cli",
    integrations = {
      -- Only leetcode.nvim drives this. Left on, every markdown buffer would start
      -- fetching and rendering remote images.
      markdown = { enabled = false },
      neorg = { enabled = false },
      typst = { enabled = false },
      html = { enabled = false },
      css = { enabled = false },
    },
    max_width_window_percentage = 80,
    -- Images draw over the terminal grid, not the buffer, so they do not scroll with
    -- it. Clear them once the window stops showing them.
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "" },
  },
}
