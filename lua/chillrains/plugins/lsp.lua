return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- lsp installer
    "j-hui/fidget.nvim",
    "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-cmdline",
    -- "hrsh7th/nvim-cmp",
    -- "L3MON4D3/LuaSnip",
    -- "saadparwaiz1/cmp_luasnip",
  },

  opts = {
    servers = { eslint = {} },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },

  config = function()
    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js linter
        "gofumpt", -- go formatter
        "golangci-lint", -- go linters
        -- "isort",         -- python formatter
        -- "black",         -- python formatter
        -- "pylint",        -- python linter
      },
    })

    require("fidget").setup({})
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "cssls",
        "tailwindcss",
        "gopls",
        "jsonls",
      },
      handlers = {
        function(server_name) -- default handkler (optional)
          local cmp_lsp = require("cmp_nvim_lsp")
          local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
          )
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- Lua
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
        -- cssls
        ["cssls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.cssls.setup({
            settings = {
              css = {
                lint = { unknownAtRules = "ignore" },
              },
            },
          })
        end,
        -- tsserver
        ["tsserver"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tsserver.setup({
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,
        -- gopls
        ["gopls"] = function()
          local lspconfig = require("lspconfig")
          local util_lsp = require("lspconfig/util")
          lspconfig.gopls.setup({
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = util_lsp.root_pattern("go.work", "go.mod", ".git"),
            single_file_support = true,
            settings = {
              gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,
        -- jsonls
        ["jsonls"] = function()
          require("lspconfig").jsonls.setup({})
        end,
        -- end here
      },
    })

    -- -- cmp
    -- local cmp = require("cmp")
    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
    --
    -- cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    --   mapping = cmp.mapping.preset.insert({
    --     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    --     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    --     ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    --     ["<C-space>"] = cmp.mapping.complete(),
    --     -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- i like to use enter too
    --   }),
    --   sources = cmp.config.sources({
    --     { name = "nvim_lsp" },
    --     { name = "luasnip" }, -- For luasnip users.
    --   }, {
    --     { name = "buffer" },
    --   }),
    -- })

    vim.diagnostic.config({ virtual_text = true })
  end,
}
