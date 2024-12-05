return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "wesQ3/vim-windowswap",
    },
    config = function()
      vim.opt.termguicolors = true

      vim.opt.laststatus = 3
      vim.opt.showtabline = 2

      require("bufferline").setup({
        options = {
          -- mode = "tabs",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          auto_hide = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
              padding = 1,
            },
          },
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
          tab_size = 18,
          enforce_regular_tabs = true,
          always_show_bufferline = true,
        },
      })
    end,
  },
  {
  	"mrjones2014/smart-splits.nvim",
  	config = function()
  		require("smart-splits").setup({
  			ignored_filetypes = { "neo-tree" },
  			ignored_buftypes = { "neo-tree" },
  		})

  		-- Resize splits with Alt + Arrow keys
  		-- vim.keymap.set("n", "<A-Left>", require("smart-splits").resize_left)
  		-- vim.keymap.set("n", "<A-Down>", require("smart-splits").resize_down)
  		-- vim.keymap.set("n", "<A-Up>", require("smart-splits").resize_up)
  		-- vim.keymap.set("n", "<A-Right>", require("smart-splits").resize_right)
  	end,
  },
}
