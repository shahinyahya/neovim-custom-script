return {
  "edluffy/specs.nvim",
  config = function()
      require('specs').setup({
          show_jumps  = true,
          min_jump = 30,
          popup = {
              delay_ms = 0,
              inc_ms = 10,
              blend = 10,
              width = 10,
              winhl = "PMenu",
              fader = function(blend)
                  local col = blend
                  col = math.floor(col * 0.8)
                  return col >= 0 and col or 0
              end,
              resizer = function(width, cols, _, _)
                  local cur_width = width
                  cur_width = math.floor(cur_width * 0.9)
                  return cur_width >= 1 and cur_width or 0
              end,
          },
          ignore_filetypes = {},
          ignore_buftypes = {
              nofile = true,
          },
      })

      -- VSCode-like cursor settings
      vim.opt.guicursor = table.concat({
          'n-v-c:block-Cursor/lCursor-blinkwait300-blinkoff200-blinkon200',
          'i-ci-ve:ver25-Cursor/lCursor-blinkwait300-blinkoff200-blinkon200',
          'r-cr:hor20',
          'o:hor50'
      }, ',')

      -- Highlight settings
      vim.cmd([[
          highlight Cursor guifg=white guibg=#61afef
          highlight iCursor guifg=white guibg=#61afef
          set guicursor+=a:blinkon200
      ]])

      vim.opt.updatetime = 50
      vim.opt.timeoutlen = 300
      vim.opt.ttimeoutlen = 0
  end
}
