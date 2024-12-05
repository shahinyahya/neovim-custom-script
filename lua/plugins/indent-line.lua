return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    -- local highlight = {
    -- 	"RainbowRed",
    -- 	"RainbowYellow",
    -- 	"RainbowBlue",
    -- 	"RainbowOrange",
    -- 	"RainbowGreen",
    -- 	"RainbowViolet",
    -- 	"RainbowCyan",
    -- }

    local highlight = {
      "CursorColumn",
      "Whitespace",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = highlight,
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
        show_exact_scope = true,
        highlight = { "Function", "Label" },
        priority = 500,
      },
      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
        },
      },
    })

    vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "none" })
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1a1a1a" })

    vim.api.nvim_set_hl(0, "CursorColumn", { fg = "#3b3b3b" })
  end,
}
