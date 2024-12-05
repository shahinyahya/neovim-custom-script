return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    -- Set default Vim notification
    vim.notify = notify
    notify.setup({
      background_colour = "#000000",
      stages = "slide",
      timeout = 3000,
      render = "default",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })
    notify.setup({})
  end,
}
