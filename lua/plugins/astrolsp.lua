---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    formatting = {
      -- conform.nvim owns format-on-save (see autoformat.lua). Leaving this enabled runs
      -- the LSP formatter over the buffer as well, so e.g. lua_ls and stylua would each
      -- reformat every save with different styles.
      format_on_save = { enabled = false },
      timeout_ms = 1000,
    },
    -- enable servers that you already have installed without mason
    servers = {
      "clangd",
      "basedpyright", -- python types / completion
      "ruff", -- python linting + import sorting (replaces none-ls)
      "rust_analyzer",
      "lua_ls",
      "bashls",
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        -- resolved from PATH (mason's bin dir is on it) rather than an absolute path, so
        -- this survives a mason reinstall or a different machine. Point clangd at a build
        -- directory per-project with a `.clangd` file (CompileFlags.CompilationDatabase)
        -- rather than pinning one workspace for every C/C++ project you open.
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
          "--offset-encoding=utf-16",
        },
      },

      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      },
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    -- runs after AstroLSP's own on_attach
    on_attach = function(client)
      -- ruff and basedpyright both attach to python buffers; let basedpyright answer
      -- hover (it knows types) and leave ruff to diagnostics and code actions
      if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
    end,
  },
}
