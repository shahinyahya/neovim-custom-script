vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Custom Keybindings
vim.keymap.set({'n', 'v'}, '<TAB>', ':bn<CR>', {silent = true})
vim.keymap.set({'n', 'v'}, '<S-TAB>', ':bp<CR>', {silent = true})
vim.keymap.set({'n','v'}, '<leader>c', ':bd<CR>', {silent = true})
vim.keymap.set({'n', 'v'}, '<leader>]', ':bn<CR>', {silent =true})
vim.keymap.set({'n', 'v'}, '<leader>[', ':bp<CR>', {silent = true})
-- Key option for editor and editor side
vim.keymap.set({'n', 'v'}, '<C-k>', ':wincmd l<CR>', {})
vim.keymap.set({'n', 'v'}, '<C-j>', ':Neotree focus<CR>', {})
-- Keys for pane split
vim.keymap.set({'n', 'v'}, '<leader>v', ':vs<CR>', {})
vim.keymap.set({'n', 'v'}, '<leader>vv', ':sp<CR>', {})

