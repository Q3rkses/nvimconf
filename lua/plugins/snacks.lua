return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    --------------------------------------------------------------------------
    -- Core QoL
    --------------------------------------------------------------------------
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },

    --------------------------------------------------------------------------
    -- Dashboard (AstroNvim default home screen)
    --------------------------------------------------------------------------
    dashboard = {
      enabled = true,

      preset = {
        header = table.concat({
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        }, "\n"),

        keys = {
          {
            icon = " ",
            key = "n",
            desc = "New file",
            action = function() vim.cmd "ene | startinsert" end,
          },
          {
            icon = " ",
            key = "f",
            desc = "Find file",
            action = function() require("snacks").picker.files() end,
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      sections = (function()
        local quotes = {
          "“Life is like riding a bicycle. To keep your balance, you must keep moving.” – Albert Einstein, 1930",
          "“The mind is everything. What you think you become.” – Bruce Lee, 1971",
          "“Strength does not come from winning. Your struggles develop your strengths.” – Arnold Schwarzenegger, 1977",
          "“If you want something, you’ve never had, you must be willing to do something you’ve never done.” – Thomas Jefferson, 1784",
          "“If you don’t take risks, you can’t create a future.” – Monkey D. Luffy, One Piece, 1999",
          "“There’s no meaning in being afraid. The only thing fear does is hold you back.” – Vegeta, Dragon Ball Z, 1989",
          "“You don’t have to be crazy strong. You just have to keep going.” – Yuji Itadori, Jujutsu Kaisen, 2020",
          "“You should enjoy the little detours. Because that’s where you’ll find the things more important than what you want.” – Ging Freecss, Hunter × Hunter, 2011",
        }

        math.randomseed(vim.loop.hrtime() + vim.fn.getpid())
        local quote = quotes[math.random(#quotes)]

        return {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },

          { section = "startup", padding = 1 },

          {
            text = quote,
            align = "center",
            padding = 1,
          },
        }
      end)(),
    },

    --------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------
    explorer = { enabled = true },

    picker = {
      enabled = true,

      layout = {
        preset = "default",
        width = 0.95,
        height = 0.90,
        border = "rounded",
      },

      preview = "file",

      previewers = {
        file = {
          max_size = 256 * 1024,
          max_line_length = 500,
        },
      },

      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            preview = false,
            layout = { position = "right" },
          },
        },

        grep = {
          exclude = {
            "*.jpg",
            "*.jpeg",
            "*.png",
            "*.gif",
            "*.webp",
            "*.svg",
            "*.pdf",
            "*.mp4",
            "*.mov",
            "*.mkv",
            "*.webm",
          },
        },
      },
    },

    --------------------------------------------------------------------------
    -- LSP helpers
    --------------------------------------------------------------------------
    words = { enabled = true },
    rename = { enabled = true },

    --------------------------------------------------------------------------
    -- Focus / UI
    --------------------------------------------------------------------------
    zen = { enabled = true },
    dim = { enabled = true },

    --------------------------------------------------------------------------
    -- Git
    --------------------------------------------------------------------------
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },

    --------------------------------------------------------------------------
    -- Image rendering (Kitty graphics protocol)
    --------------------------------------------------------------------------
    image = {
      enabled = true,
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        "pdf",
        "mp4",
        "mov",
        "mkv",
        "webm",
      },
    },
  },
}
