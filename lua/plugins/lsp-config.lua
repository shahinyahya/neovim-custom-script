return {
  {
   "williamboman/mason.nvim",
    config = function()
      local config  = require("mason")
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
        ensure_installed = { "lua_ls", "angularls", "ts_ls", "html", "cssls", "tailwindcss", "docker_compose_language_service", "dockerls", "golangci_lint_ls", "pyright", "bashls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Server Spec settings
      lspconfig.lua_ls.setup({})
      lspconfig.angularls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.golangci_lint_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.bashls.setup({})
      
      --Keybindings for lsp-config
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
