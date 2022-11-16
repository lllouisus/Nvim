local G = require"first_love.G"
local Gmap = vim.keymap
vim.cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])
vim.cmd('command! W w !doas tee > /dev/null %')


G.map({
    -- Nop Map
    {'n', 's', '<NOP>', {} },

    -- General
    {'i', 'jk', '<ESC>', {}},

    { 'n', 'Q', ':q<CR>', {} },
    { 'n', 'T', ':qa!<CR>', {} },
    { 'n', 'S', '&buftype == "acwrite" ? ":W<CR>" : ":w!<CR>"', { noremap = true, silent = true, expr = true} },
    { 'n', ';', ':', {} },
    { 'v', ';', ':', {} },
    { 'i', '<C-e>', '<Enter>', {} },
    { 'n', '<C-e>', '<Enter>', {} },
    { 'i', '<C-d>', '<BackSpace>', {} },

    { 'n', '+', '<C-a>', {} },
    { 'n', '-', '<C-x>', {} },


    -- Command 
    { 'c', '<C-e>', '<Enter>', { noremap = true } },
    { 'c', '<C-d>', '<BackSpace>', { noremap = true } },
    { 'c', '<C-k>', '<C-p>', { noremap = true } },
    { 'c', '<C-j>', '<C-n>', { noremap = true } },
    { 'c', '<C-h>', '<Left>', { noremap = true } },
    { 'c', '<C-l>', '<Right>', { noremap = true } },

    -- Ctrl Shift + Move
    { 'i', '<C-k>', '<Up>', { noremap = true, silent = true } },
    { 'i', '<C-j>', '<Down>', { noremap = true, silent = true } },
    { 'i', '<C-h>', '<Left>', { noremap = true, silent = true } },
    { 'i', '<C-l>', '<Right>', { noremap = true, silent = true } },
    { 'n', '<C-k>', '<Up>', { noremap = true, silent = true } },
    { 'n', '<C-j>', '<Down>', { noremap = true, silent = true } },

    { 'n', '<C-k>', '6k', { noremap = true } },
    { 'n', '<C-j>', '6j', { noremap = true } },
    { 'v', '<C-k>', '6k', { noremap = true } },
    { 'v', '<C-j>', '6j', { noremap = true } },

    { 'n', 'H', '^', { noremap = true } },
    { 'n', 'L', '$', { noremap = true } },
    { 'v', 'H', '^', { noremap = true } },
    { 'v', 'L', '$', { noremap = true } },
    { 'v', 'q', '<ESC>', { noremap = true } },
    { 'n', 'va', 'gg<S-v>G', { noremap = true } },

    { 'n', '<Space><Enter>', ':nohlsearch<CR>', { noremap = true } },

    -- Registers
    { 'n', 'sr', ':Registers<CR>', { noremap = true } },

    -- Startup Time/Lazyload
    { 'n', '<Leader>fa', ':StartupTime<CR>', { noremap = true } },
    { 'n', '<Leader>fs', ':PackerStatus<CR>', { noremap = true } },

    -- -- Copy/Paste/Delete
    { 'v', 'Y', '"+y', { noremap = true } },
    { 'v', 'P', '"+p', { noremap = true } },
    { 'n', 'P', '"+p', { noremap = true } },
    { 'v', 'cu', '"+d', { noremap = true } },
    { 'n', 'cuw', '"+diw', { noremap = true } },
    { 'n', 'YY', '"+YY', { noremap = true } },

    { 'n', 'x', '"_x', { noremap = true } },
    { 'v', 'x', '"_x', { noremap = true } },
    { 'n', 'dw', 'vb"_d', { noremap = true } },

    -- NeoTree
    { 'n', 'tt', ':NeoTreeFloat<CR>', { noremap = true } },

    -- Window Move & Resize
    { 'n', 'sv', ':vsplit<CR><C-w>w', { noremap = true } },
    { 'n', 'ss', ':split<CR><C-w>w', { noremap = true } },
    { 'n', 'so', ':only<CR>', { noremap = true } },

    { 'n', '<C-Left>', ':vertical resize +2<CR>', { noremap = true } },
    { 'n', '<C-Right>', ':vertical resize -2<CR>', { noremap = true } },
    { 'n', 's=', '<C-w>=', { noremap = true } },

    { 'n', 'th', '<C-w>h', { noremap = true } },
    { 'n', 'tl', '<C-w>l', { noremap = true } },
    { 'n', 'tj', '<C-w>j', { noremap = true } },
    { 'n', 'tk', '<C-w>k', { noremap = true } },

    -- Buffers
    { 'n', 'sn', ':tabedit<CR>', { noremap = true } },

    { 'n', '<Leader>d', ':bd!<CR>', { noremap = true, silent = true } },
    { 'n', '<A-Left>', ':bp<CR>', { noremap = true, silent = true } },
    { 'n', '<A-Right>', ':bn<CR>', { noremap = true, silent = true } },
    { 'i', '<A-Left>', ':bp<CR>', { noremap = true, silent = true } },
    { 'i', '<A-Right>', ':bn<CR>', { noremap = true, silent = true } },

    -- Visual Move
    { 'v', '<S-Tab>', '<gv', { noremap = true } },
    { 'v', '<Tab>', '>gv', { noremap = true } },

    -- Translate
    { 'n', 'te', ':TranslateW<CR>', { noremap = true } },
    { 'v', 'te', ':TranslateW<CR>', { noremap = true } },

    -- C-s = :%s/
    { 'n', '<C-s>', ':<c-u>%s/\\v//gc<left><left><left><left>', { noremap = true } },
    { 'v', '<C-s>', ':%s/\\v//gc<left><left><left><left>', { noremap = true } },


})





-- 重设tab长度
vim.cmd('command! -nargs=* SetTab call SwitchTab(<q-args>)')
vim.cmd([[
fun! SwitchTab(tab_len)
if !empty(a:tab_len)
    let [&shiftwidth, &softtabstop, &tabstop] = [a:tab_len, a:tab_len, a:tab_len]
else
    let l:tab_len = input('input shiftwidth: ')
    if !empty(l:tab_len)
        let [&shiftwidth, &softtabstop, &tabstop] = [l:tab_len, l:tab_len, l:tab_len]
        endif
        endif
        redraw!
        echo printf('shiftwidth: %d', &shiftwidth)
        endf
]])

-- 驼峰转换
G.map({{ 'v', 't', ':call ToggleHump()<CR>', { noremap = true, silent = true }},} )
G.cmd([[
    fun! ToggleHump()
        let [l, c1, c2] = [line('.'), col("'<"), col("'>")]
        let line = getline(l)
        echo c1 c2
        let w = line[c1 - 1 : c2 - 2]
        let w = w =~ '_' ? substitute(w, '\v_(.)', '\u\1', 'G') : substitute(substitute(w, '\v^(\u)', '\l\1', 'G'), '\v(\u)', '_\l\1', 'G')
        call setbufline('%', l, printf('%s%s%s', c1 == 1 ? '' : line[:c1-2], w, c2 == 1 ? '' : line[c2-1:]))
        call cursor(l, c1)
    endf
]])
