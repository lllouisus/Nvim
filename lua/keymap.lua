local G = require('G')

G.cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])
G.cmd('command! W w !doas tee > /dev/null %')
G.map({

-- ╭─────────────────────────────────────────╮
-- │      设置s t 无效 ;=: ,重复上一次宏操作 │
-- ╰─────────────────────────────────────────╯
    { 'i', 'jk',           '<Esc>',   {} },

-- ╭─────────────╮
-- │      Nopmap │
-- ╰─────────────╯
    { 'n', 's',           '<nop>',   {} },
    { 's', 's',           '<nop>',   {} },

    { 'n', ';',           ':',       {} },
    { 'v', ';',           ':',       {} },

-- ╭──────────────────────╮
-- │     -- Copy && paste │
-- ╰──────────────────────╯
    -- { 'v', 'y',           '"0y',     { noremap = true } },
    -- { 'v', 'p',           '"0p',     { noremap = true } },
    -- { 'n', 'p',           '"0p',     { noremap = true } },

    { 'v', 'Y',           '"+y',     { noremap = true } },
    { 'v', 'P',           '"+p',     { noremap = true } },
    { 'n', 'P',           '"+p',     { noremap = true } },

    { 'v', 'cu',           '"+d',     { noremap = true } },
    { 'n', 'cuw',           '"+diw',     { noremap = true } },
    { 'n', 'YY',           '"+YY',     { noremap = true } },

-- ╭────────────────────╮
-- │      Page Pervierw │
-- ╰────────────────────╯
    { 'n', 'F',           '<c-f>',     { noremap = true } },
    { 'n', 'B',           '<c-b>',     { noremap = true } },

-- ╭───────────────╮
-- │     -- VISUAL │
-- ╰───────────────╯
    { 'n', 'va',       'gg<S-v>G',     { noremap = true } },
    { 'v', 'q',        '<Esc>',        { noremap = true } },

-- ╭───────────╮
-- │      打断 │
-- ╰───────────╯
 --   { 'n', '<c-j>',       'f,a<cr><esc>', { noremap = true } },
 --   { 'i', '<c-j>',       '<esc>f,a<cr>', { noremap = true } },

-- ╭───────────╮
-- │      cmap │
-- ╰───────────╯
--    { 'c', '<c-a>',       '<home>',  { noremap = true } },
--    { 'c', '<c-e>',       '<end>',   { noremap = true } },
--    { 'c', '<up>',        '<c-p>',   { noremap = true } },
--    { 'c', '<down>',      '<c-n>',   { noremap = true } },

-- ╭──────────────╮
-- │      Comment │
-- ╰──────────────╯
    { 'n', 'te',           ':TranslateW<CR>',     { noremap = true } },
    { 'v', 'te',           ':TranslateW<CR>',     { noremap = true } },

    -- Convert To Case
    { 'v', 'gu',           'gu<cr>',     { noremap = true } },
    { 'v', 'gU',           'gu<cr>',     { noremap = true } },

-- ╭────────────────────────╮
-- │     -- Symbols-Outline │
-- ╰────────────────────────╯
    { 'n', 'ta',           ':SymbolsOutline<cr>',     { noremap = true } },

-- ╭────────────╮
-- │     -- FZF │
-- ╰────────────╯
    { 'n', 'sf',           ':lua require\'telescope.builtin\'.find_files{ cwd = \'~/.config\' }<CR>',     { noremap = true } },
    { 'n', 'sl',           ':lua require\'telescope.builtin\'.find_files{}<CR>',     { noremap = true } },
    { 'n', '<leader>fg',           ':lua require\'telescope.builtin\'.live_grep{}<CR>',     { noremap = true } },
    { 'n', '<leader>fb',           ':lua require\'telescope.builtin\'.buffers{}<CR>',     { noremap = true } },
    { 'n', '<leader>fh',           ':lua require\'telescope.builtin\'.help_tags{}<CR>',     { noremap = true } },
    { 'n', '<leader>fo',           ':lua require\'telescope.builtin\'.oldfiles{}<CR>',     { noremap = true } },
    { 'n', '<leader>bw',           ':lua require\'telescope.builtin\'.grep_string{}<CR>',     { noremap = true } },
    { 'n', '<leader>fm',           ':lua require\'telescope.builtin\'.builtin{}<CR>',     { noremap = true } },
    { 'n', '<leader>/',           ':lua require\'telescope.builtin\'.current_buffer_fuzzy_find{}<CR>',     { noremap = true } },
    { 'n', '<leader>fc',           ':lua require\'telescope.builtin\'.lsp_dynamic_workspace_symbols{}<CR>',     { noremap = true } },
    { 'n', '<leader>l',           ':lua require\'telescope.builtin\'.treesitter{}<CR>',     { noremap = true } },

-- ╭────────────╮
-- │     -- LSP │
-- ╰────────────╯
    { 'n', 'sj',           ':Lspsaga lsp_finder<CR>',     { noremap = true } },
    { 'n', '<leader>rn',           ':Lspsaga rename<CR>',     { noremap = true } },
    { 'n', 'se',           ':Lspsaga peek_definition<CR>',     { noremap = true } },
    { 'n', 'sk',           ':Lspsaga hover_doc<CR>',     { noremap = true } },

-- ╭─────────────────╮
-- │      Translator │
-- ╰─────────────────╯
    { 'n', 'g/',           ':CBalbox<CR>',     { noremap = true } },
    { 'v', 'g/',           ':CBalbox<CR>',     { noremap = true } },

-- ╭────────────────╮
-- │     -- History │
-- ╰────────────────╯
    { 'n', 'sc',           ':LocalHistoryToggle<CR>',     { noremap = true } },

-- ╭────────────────╮
-- │      Registers │
-- ╰────────────────╯
    { 'n', 'sr',           ':Registers<CR>',     { noremap = true } },


-- ╭─────────────────╮
-- │      c-s = :%s/ │
-- ╰─────────────────╯
    { 'n', '<c-s>',       ':<c-u>%s/\\v//gc<left><left><left><left>', { noremap = true } },
    { 'v', '<c-s>',             ':s/\\v//gc<left><left><left><left>', { noremap = true } },

-- ╭───────────────────────╮
-- │      only change text │
-- ╰───────────────────────╯
    { 'n', 'x',           '"_x',     { noremap = true } },
    { 'v', 'x',           '"_x',     { noremap = true } },

-- ╭──────────────────╮
-- │      S保存 Q退出 │
-- ╰──────────────────╯
    { 'n', 'S',           '&buftype == "acwrite" ? ":W<CR>" : ":w!<CR>"', { noremap = true, silent = true, expr = true } },
    { 'n', 'Q',           ':q<cr>', { noremap = true, silent = true } },
    { 'n', 'T',           ':qa!<cr>', { noremap = true, silent = true } },

-- ╭──────────────────────────────────────────╮
-- │      VISUAL SELECT模式 s-tab tab左右缩进 │
-- ╰──────────────────────────────────────────╯
    { 'v', '<',           '<gv',     { noremap = true } },
    { 'v', '>',           '>gv',     { noremap = true } },
    { 'v', '<s-tab>',     '<gv',     { noremap = true } },
    { 'v', '<tab>',       '>gv',     { noremap = true } },

-- ╭─────────────────────────────────╮
-- │      CTRL SHIFT + 方向 快速跳转 │
-- ╰─────────────────────────────────╯
--    { 'i', '<c-s-up>',    '<up><up><up><up><up><up><up><up><up><up>', { noremap = true, silent = true } },
--    { 'i', '<c-s-down>',  '<down><down><down><down><down><down><down><down><down><down>', { noremap = true, silent = true } },
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

-- ╭──────────────────────────────╮
-- │      选中全文 选中{ 复制全文 │
-- ╰──────────────────────────────╯
    { 'n', '<m-a>',       'ggVG',    { noremap = true } },
    { 'n', '<m-s>',       'vi{',     { noremap = true } },
    { 'n', '<leader>y',   ':%yank<cr>', { noremap = true } },

-- ╭────────────────────────╮
-- │      alt + 上 下移动行 │
-- ╰────────────────────────╯
    { 'n', '<m-up>',      ':m .-2<cr>',       { noremap = true, silent = true } },
    { 'n', '<m-down>',    ':m .+1<cr>',       { noremap = true, silent = true } },
    { 'i', '<m-up>',      '<Esc>:m .-2<cr>i', { noremap = true, silent = true } },
    { 'i', '<m-down>',    '<Esc>:m .+1<cr>i', { noremap = true, silent = true } },
    { 'v', '<m-up>',      ":m '<-2<cr>gv",    { noremap = true, silent = true } },
    { 'v', '<m-down>',    ":m '>+1<cr>gv",    { noremap = true, silent = true } },

-- ╭───────────────────────────────────────────────────────────────────────╮
-- │    Window Move && Resize
-- ╰───────────────────────────────────────────────────────────────────────╯
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


-- ╭──────────────╮
-- │      buffers │
-- ╰──────────────╯
    { 'n', '<leader>d',    ':bd!<cr>',          { noremap = true, silent = true } },
    { 'n', '<m-left>',    ':bp<cr>',          { noremap = true, silent = true } },
    { 'n', '<m-right>',   ':bn<cr>',          { noremap = true, silent = true } },
    { 'v', '<m-left>',    '<esc>:bp<cr>',     { noremap = true, silent = true } },
    { 'v', '<m-right>',   '<esc>:bn<cr>',     { noremap = true, silent = true } },
    { 'i', '<m-left>',    '<esc>:bp<cr>',     { noremap = true, silent = true } },
    { 'i', '<m-right>',   '<esc>:bn<cr>',     { noremap = true, silent = true } },


})

-- ╭──────────────╮
-- │  重设tab长度 │
-- ╰──────────────╯
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

-- ╭───────────╮
-- │  驼峰转换 │
-- ╰───────────╯
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
