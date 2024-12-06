return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				hide_cursor = true,
				respect_scrolloff = false,
				performance_mode = true,
			})
		end,
	},

	{
		"gen740/smoothcursor.nvim",
		config = function()
			require("smoothcursor").setup({
				autostart = true,
				type = "default", -- The "default" type is more VSCode-like
				intervals = 7, -- Even lower interval for smoother movement
				speed = 10, -- Faster speed
				priority = 1, -- Higher priority
				texthl = nil, -- No highlight
				linehl = nil, -- No line highlight
				cursor = nil, -- Use default cursor
				fancy = {
					enable = false, -- Disable fancy mode for VSCode-like feel
				},
				disabled_filetypes = {
					"TelescopePrompt",
					"neo-tree",
					"notify",
				},
			})

			-- VSCode-like cursor settings
			vim.opt.cursorline = true
			vim.opt.cursorlineopt = "number"
			vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
			vim.opt.mousemoveevent = true
			vim.opt.virtualedit = "block"
			vim.opt.updatetime = 50 -- Super fast cursor response
			vim.opt.ttimeoutlen = 0 -- No delay when switching modes
			vim.opt.timeoutlen = 300
			vim.opt.ttyfast = true
			vim.opt.lazyredraw = false
		end,
	},

	{
		"echasnovski/mini.animate",
		config = function()
			local animate = require("mini.animate")
			animate.setup({
				cursor = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 30, unit = "total" }), -- Faster duration
					path = animate.gen_path.line(), -- Straight line path like VSCode
				},
				scroll = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				resize = { enable = false },
				open = { enable = false },
				close = { enable = false },
			})
		end,
	},
}
