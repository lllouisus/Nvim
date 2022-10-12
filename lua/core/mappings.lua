G = require('core.G')

G.cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])
G.cmd('command! W w !doas tee > /dev/null %')

G.map({
    -- Nopmap
    { 'n', 's',                                         '<NOP>',                                                        {} },

    -- General
    { 'i', 'jk',                                        '<Esc>',                                                        {} },
    { 'n', 'Q',                                         '<Cmd> q <CR>',                                                 {} },
    { 'n', 'T',                                         '<Cmd> qa! <CR>',                                               {} },
    { 'n', 'S',                                          '&buftype == "acwrite" ? ":W<CR>" : ":w!<CR>"',                { noremap = true, silent = true, expr = true } },
    { 'n', ';',           ':',       {} },
    { 'v', ';',           ':',       {} },
    { 'n', '<c-e>',       '<Enter>',   {} },
    { 'i', '<c-e>',       '<Enter>',   {} },
    { 'n', '<c-d>',       '<BackSpace>',   {} },
    { 'i', '<c-d>',       '<BackSpace>',   {} },
    -- cmap
    { 'c', '<c-e>',       '<Enter>',   { noremap = true } },
    { 'c', '<c-d>',       '<BackSpace>',   { noremap = true } },
    { 'c', '<C-k>',        '<c-p>',   { noremap = true } },
    { 'c', '<C-j>',      '<c-n>',   { noremap = true } },

    -- CTRL SHIFT + Move
    { 'i', '<c-k>',    '<up>', { noremap = true, silent = true } },
    { 'i', '<c-j>',  '<down>', { noremap = true, silent = true } },
    { 'i', '<c-h>',  '<left>', { noremap = true, silent = true } },
    { 'i', '<c-l>',  '<right>', { noremap = true, silent = true } },
    { 'n', '<c-k>',    '6k',     { noremap = true } },
    { 'n', '<c-j>',  '6j',     { noremap = true } },
    { 'n', 'H',  '^',       { noremap = true } },
    { 'n', 'L', '$',       { noremap = true } },
    { 'v', '<c-k>',    '6k',     { noremap = true } },
    { 'v', '<c-j>',  '6j',     { noremap = true } },
    { 'v', 'H',  '^',       { noremap = true } },
    { 'v', 'L', '$',       { noremap = true } },
    { 'n', 'va',       'ggVG',    { noremap = true } },
    -- Alt + Move
    { 'n', '<A-up>',      ':m .-2<cr>',       { noremap = true, silent = true } },
    { 'n', '<A-down>',    ':m .+1<cr>',       { noremap = true, silent = true } },
    { 'i', '<A-up>',      '<Esc>:m .-2<cr>i', { noremap = true, silent = true } },
    { 'i', '<A-down>',    '<Esc>:m .+1<cr>i', { noremap = true, silent = true } },
    { 'v', '<A-up>',      ":m '<-2<cr>gv",    { noremap = true, silent = true } },
    { 'v', '<A-down>',    ":m '>+1<cr>gv",    { noremap = true, silent = true } },
    -- Page Pervierw
    { 'n', 'F',           '<c-f>',     { noremap = true } },
    { 'n', 'B',           '<c-b>',     { noremap = true } },

    -- Space + Enter
    { 'n', '<Space><Enter>',           ':nohlsearch<CR>',     { noremap = true } },

    -- Registers
    { 'n', 'sr',           ':Registers<CR>',     { noremap = true } },

    -- Copy / Paste
    { 'v', 'Y',           '"+y',     { noremap = true } },
    { 'v', 'P',           '"+p',     { noremap = true } },
    { 'n', 'P',           '"+p',     { noremap = true } },
    { 'v', 'cu',           '"+d',     { noremap = true } },
    { 'n', 'cuw',           '"+diw',     { noremap = true } },
    { 'n', 'YY',           '"+YY',     { noremap = true } },

    { 'n', 'x',           '"_x',     { noremap = true } },
    { 'v', 'x',           '"_x',     { noremap = true } },

    -- History
    { 'n', 'sc',           ':LocalHistoryToggle<CR>',     { noremap = true } },

    -- Window Move && Resize
    { 'n', 'sv',          ':vsp<cr><c-w>w',   { noremap = true } },
    { 'n', 'ss',          ':sp<cr><c-w>w',    { noremap = true } },
    { 'n', 'so',          ':only<cr>',        { noremap = true } },
    { 'n', '<c-left>',          ':vertical resize +2<CR>',        { noremap = true } },
    { 'n', '<c-right>',          ':vertical resize -2<CR>',        { noremap = true } },
    { 'n', 's=',          '<c-w>=',           { noremap = true } },
    { 'n', 'th',     '<c-w>h',           { noremap = true } },
    { 'n', 'tl',    '<c-w>l',           { noremap = true } },
    { 'n', 'tk',       '<c-w>k',           { noremap = true } },
    { 'n', 'tj',     '<c-w>j',           { noremap = true } },

    -- Buffers
    { 'n', '<leader>d',    ':bd!<cr>',          { noremap = true, silent = true } },
    { 'n', '<A-left>',    ':bp<cr>',          { noremap = true, silent = true } },
    { 'n', '<A-right>',   ':bn<cr>',          { noremap = true, silent = true } },
    { 'i', '<A-left>',    '<esc>:bp<cr>',     { noremap = true, silent = true } },
    { 'i', '<A-right>',   '<esc>:bn<cr>',     { noremap = true, silent = true } },

    -- VISUAL
    { 'n', 'va',       'gg<S-v>G',     { noremap = true } },
    { 'v', 'q',        '<Esc>',        { noremap = true } },

    -- VISUAL SELECT模式 s-tab tab左右缩进
    { 'v', '<s-tab>',     '<gv',     { noremap = true } },
    { 'v', '<tab>',       '>gv',     { noremap = true } },

    -- 打断
    --   { 'n', '<c-j>',       'f,a<cr><esc>', { noremap = true } },
    --   { 'i', '<c-j>',       '<esc>f,a<cr>', { noremap = true } },

    --  Comment
    { 'n', 'te',           ':TranslateW<CR>',     { noremap = true } },
    { 'v', 'te',           ':TranslateW<CR>',     { noremap = true } },

    -- C-s = :%s/
    { 'n', '<c-s>',       ':<c-u>%s/\\v//gc<left><left><left><left>', { noremap = true } },
    { 'v', '<c-s>',             ':s/\\v//gc<left><left><left><left>', { noremap = true } },

    -- FZF
    { 'n', 'sf',           ':lua require\'telescope.builtin\'.find_files{ cwd = \'~/.config\' }<CR>',     { noremap = true } },
    -- { 'n', 'sf',           '<Cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore=false, hidden = true})<CR>',     { noremap = true } },
    { 'n', 'sl',           ':lua require\'telescope.builtin\'.find_files{}<CR>',     { noremap = true } },
    { 'n', '<leader>fw',           ':lua require\'telescope.builtin\'.live_grep{}<CR>',     { noremap = true } },
    { 'n', '<leader>fb',           ':lua require\'telescope.builtin\'.buffers{}<CR>',     { noremap = true } },
    { 'n', '<leader>fh',           ':lua require\'telescope.builtin\'.help_tags{}<CR>',     { noremap = true } },
    { 'n', '<leader>fo',           ':lua require\'telescope.builtin\'.oldfiles{}<CR>',     { noremap = true } },
    { 'n', '<leader>bw',           ':lua require\'telescope.builtin\'.grep_string{}<CR>',     { noremap = true } },
    { 'n', '<leader>fm',           ':lua require\'telescope.builtin\'.builtin{}<CR>',     { noremap = true } },
    { 'n', '<leader>/',           ':lua require\'telescope.builtin\'.current_buffer_fuzzy_find{}<CR>',     { noremap = true } },
    { 'n', '<leader>fc',           ':lua require\'telescope.builtin\'.lsp_dynamic_workspace_symbols{}<CR>',     { noremap = true } },

    -- Lsp
    { 'n', 'sj',           ':Lspsaga lsp_finder<CR>',     { noremap = true } },
    { 'n', '<leader>rn',           ':Lspsaga rename<CR>',     { noremap = true } },
    { 'n', 'se',           ':Lspsaga peek_definition<CR>',     { noremap = true } },
    { 'n', 'sk',           ':Lspsaga hover_doc<CR>',     { noremap = true } },

    --- --- --- --- --- E N D --- --- --- ---
})


-- 重设tab长度
G.cmd('command! -nargs=* SetTab call SwitchTab(<q-args>)')
G.cmd([[
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
G.map({ { 'v', 't', ':call ToggleHump()<CR>', { noremap = true, silent = true } }, })
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
