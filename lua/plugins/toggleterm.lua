return {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
      require("toggleterm").setup({})
      vim.keymap.set('n', '<leader>t', ':ToggleTerm toggle size=20 direction=horizontal<CR>', {})
      vim.keymap.set('n', '<leader>tt', ':ToggleTerm toggle size=70 direction=vertical<CR>', {})
    end
}
