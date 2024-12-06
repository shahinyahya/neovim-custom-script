return {
    "edluffy/specs.nvim",
    config = function()
        require('specs').setup({
            show_jumps = true,
            min_jump = 30,
            popup = {
                delay_ms = 0,
                inc_ms = 10,
                blend = 10,
                width = 10,
                winhl = "PMenu",
                -- Using simplified fader function
                fader = function(blend)
                    return math.max(0, math.floor(blend * 0.8))
                end,
                -- Using simplified resizer function
                resizer = function(width)
                    return math.max(1, math.floor(width * 0.9))
                end,
            },
            ignore_filetypes = {},
            ignore_buftypes = {
                nofile = true,
            },
        })

        -- Cursor settings
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"
        
        -- Cursor highlight
        vim.cmd([[
            highlight Cursor guifg=white guibg=#61afef
            highlight iCursor guifg=white guibg=#61afef
        ]])
    end
}
