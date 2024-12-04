vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Custom Keybindings
vim.keymap.set({'n', 'v'}, '<TAB>', ':bn<CR>', {silent = true})
vim.keymap.set({'n', 'v'}, '<S-TAB>', ':bp<CR>', {silent = true})
