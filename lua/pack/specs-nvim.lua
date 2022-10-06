require('specs').setup{ 
    show_jumps  = true,
    min_jump = 8,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 8, -- time increments used for fade/resize effects 
        blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 18,
        winhl = "SpecsH",
        fader = require('specs').empty_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}
