require'hop'.setup{
      quit_key = '<SPC>',
}

require'hop.highlight'.insert_highlights()

vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "f", "<cmd>HopChar1<CR>", {noremap=true})
