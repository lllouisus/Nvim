local G = require('core.G')

G.g.mapleader = " "
G.p.number = true
-- G.p.relativenumber = true

vim.scriptencoding = 'utf-8'
vim.encoding = 'utf-8'
vim.fileencoding = 'utf-8'

G.p.scrolloff = 5
G.p.sidescrolloff = 5

G.p.hlsearch = true
G.p.incsearch = true
G.p.ignorecase = true

-- Tab
G.p.autoindent = true
G.p.smartindent = true
G.p.tabstop = 4
G.p.softtabstop = 4
G.p.shiftwidth = 4
G.p.smarttab = true
G.p.expandtab = true

G.p.smartcase = true
G.p.autoread = true
G.b.autoread = true

-- Mouse
G.w.signcolumn = "yes"
-- G.p.mouse = 'a'

-- About Colors
G.p.cursorline = true
-- G.p.termguicolors = true

G.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 300
    }
end
})

vim.cmd('colorscheme colors_hi')

-- 不自动备份 不换行
G.cmd([[
    set nobackup
    set noswapfile
    set nowrap
]])

-- 光标回到上次位置
G.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- 持久化撤销
G.cmd([[
    set undofile
    set undodir=~/.config/nvim/cache/undodir
]])

-- 错误无提示音 去除屏幕闪烁
G.cmd([[
    set vb
    set t_vb=""
    set t_ut=""
    set hidden
]])

-- vim保存1000条文件记录
G.cmd([[ set viminfo=!,'10000,<50,s10,h ]])


vim.cmd [[
augroup remember _folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END
]]

-- 提示多余空格和TODO
G.cmd([[
    hi ErrSpace ctermbg=238
    " autocmd BufWinEnter * syn match ErrSpace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/
    autocmd BufWinEnter * syn match Todo /TODO\(:.*\)*/
]])
