local api = require('Comment.api')

api.toggle.linewise(motion, config)
api.toggle.linewise.current(motion?, config?)
api.toggle.linewise.count(count, config?)

api.toggle.blockwise(motion, config?)
api.toggle.blockwise.current(motion?, config?)
api.toggle.blockwise.count(count, config?)

-- Toggle current line (linewise) using C-/
vim.keymap.set('n', 'g/', api.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
vim.keymap.set('n', 'g//', api.toggle.blockwise.current)

-- Toggle lines (linewise) with dot-repeat support
-- Example: <leader>gc3j will comment 4 lines
vim.keymap.set(
    'n', '<leader>gc', api.call('toggle.linewise', 'g@'),
    { expr = true }
)

-- Toggle lines (blockwise) with dot-repeat support
-- Example: <leader>gb3j will comment 4 lines
vim.keymap.set(
    'n', '<leader>gb', api.call('toggle.blockwise', 'g@'),
    { expr = true }
)

local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
)
