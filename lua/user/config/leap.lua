require('leap').opts.highlight_unlabeled_phase_one_targets = true

vim.keymap.set({'x', 'o', 'n', 'v'}, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n', 'v'}, 'gs', '<Plug>(leap-cross-window)')

vim.keymap.set({'x', 'o', 'n', 'v'}, 'FB', '<Plug>(leap-backward-to)')
