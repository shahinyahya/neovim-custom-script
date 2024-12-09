return {
	-- {
	--   "catppuccin/nvim",
	--   lazy = false,
	--   name = "catppuccin",
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme "catppuccin"
	--   end
	-- },

	-- {
	--   "scottmckendry/cyberdream.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme "cyberdream"
	--   end
	-- },

	-- {
	--   'navarasu/onedark.nvim',
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     require('onedark').setup({})
	--   end
	-- },

	-- {
	-- 	"morhetz/gruvbox",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
}
}
