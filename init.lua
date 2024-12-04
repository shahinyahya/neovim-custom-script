vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
-- vim.opt.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- local opts = {}

-- Hit enter when entering to nvim to display Neotree
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- To check arg "."
    local args = vim.fn.argv()
    if #args == 1 and args[1] == "." then
      -- Close empyt buffers, if any;
      vim.cmd("bd")
      -- Open Neotree in current position
      vim.cmd("Neotree position=current")
    end
  end,
})

require("vim-keyoptions")
require("lazy").setup("plugins")
