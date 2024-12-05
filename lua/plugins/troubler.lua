return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      position = "bottom",
      icons = true,
      mode = "workspace_diagnostics",
      auto_open = false,
      auto_close = false,
      padding = false,
    })

    -- Keymaps for trouble
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
  end,
}
