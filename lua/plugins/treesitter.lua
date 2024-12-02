return  {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "python", "php", "c", "html", "css", "scss", "query", "yaml", "toml", "vim", "vimdoc"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
