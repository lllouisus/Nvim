local M = {}

function M.config()
    vim.g.VM_theme = 'ocean'
    vim.g.VM_highlight_matches = 'underline'
    vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Select All'] = '<C-a>',

        ['Add Cursor Up'] = '<C-Up>',
        ['Add Cursor Down'] = '<C-Down>',

        ['Add Cursor At Pos'] = '<C-x>',
        ['Add Cursor At Word'] = '<C-w>',

        ['Find Next'] = ']',
        ['Find Prev'] = '[',

        ['Move Left'] = '<C-S-Left>',
        ['Move Right'] = '<C-S-Right>',

        ['Skip Region'] = 'q',
        ['Remove Region'] = 'q',
    }
end

function M.setup()
    -- do nothing
end

return M
