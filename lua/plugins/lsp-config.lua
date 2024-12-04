return {
  {
    "williamboman/mason.nvim",
    config = function()
      local config = require("mason")
      config.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local config = require("mason-lspconfig")
      config.setup({
        ensure_installed = { "lua_ls", "angularls", "ts_ls", "html", "cssls", "tailwindcss", "docker_compose_language_service", "dockerls", "pyright", "bashls" }
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      require("luasnip.loaders.from_vscode").lazy_load()

      -- FastAPI snippets
      luasnip.add_snippets("python", {
        luasnip.snippet("fapi", {
          luasnip.text_node({"from fastapi import FastAPI", "", "app = FastAPI()", "", ""}),
          luasnip.text_node({"@app."}), luasnip.insert_node(1, "get"),
          luasnip.text_node({'("'}), luasnip.insert_node(2, "/"),
          luasnip.text_node({'")'}), luasnip.text_node({'', 'def '}),
          luasnip.insert_node(3, "endpoint"),
          luasnip.text_node({'():', '    return {"message": "'}),
          luasnip.insert_node(4, "Hello World"),
          luasnip.text_node({'"}'}),
        }),
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.angularls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_init = function(client)
          local venv = vim.fn.findfile('../venv/bin/python', vim.fn.getcwd() .. ';')
          local poetry = vim.fn.findfile('poetry.lock', vim.fn.getcwd() .. ';')
          local python_path
          if venv ~= '' then
            python_path = vim.fn.fnamemodify(venv, ':p')
          elseif poetry ~= '' then
            python_path = vim.fn.trim(vim.fn.system('poetry env info -p')) .. '/bin/python'
          else
            python_path = vim.fn.exepath('python3') or vim.fn.exepath('python')
          end
          if python_path then
            client.config.settings.python.pythonPath = python_path
          end
        end,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "basic",
            }
          }
        }
      })
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
      
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
