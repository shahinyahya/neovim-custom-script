return {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
      require("toggleterm").setup({})
      vim.keymap.set('n', '<leader>t', ':ToggleTerm size=20 direction=horizontal<CR>', {})
      vim.keymap.set('n', '<leader>tt', ':ToggleTerm size=70 direction=vertical<CR>', {})
    end
}
