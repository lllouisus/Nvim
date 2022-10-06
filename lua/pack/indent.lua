vim.g.indent_blankline_char_list = {' '}
-- vim.g.indent_blankline_char_list = {"╰", "─", ">"}
vim.g.indent_blankline_indent_level = 4


require("indent_blankline").setup{
    char = "│",
    -- char = "┊",
    -- char = {"╰", "─", ">"},
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    space_char_blankline = ' ',
    show_current_context = true,
}

-- require("indent_blankline").setup ({
--     -- char = {'─', '─', '╭', '│', '╰', '─', '>'},
--     -- char = "┊",
--     space_char_blankline = {'─', '─', '╭', '│', '╰', '─', '>'},
--     show_current_context = true,
--     show_current_context_start = true,
--     -- buftype_exclude = { "terminal" },
-- })
