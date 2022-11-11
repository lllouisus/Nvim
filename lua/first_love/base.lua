local G = require('first_love.G')

-- Number Line
G.g.mapleader = " "
G.p.number = true
-- G.p.relativenumber = true

-- Disable Backup
G.p.backup = false
G.p.hlsearch = true
G.p.swapfile = false
G.p.wrap = false

-- Tab
G.p.autoindent = true
G.p.smartindent = true
G.p.tabstop = 4
G.p.softtabstop = 4
G.p.shiftwidth = 4
G.p.smarttab = true
G.p.expandtab = true
G.p.smartcase = true

-- UTF-8
vim.scriptencoding = 'utf-8'
G.p.encoding = 'utf-8'
G.p.fileencoding = 'utf-8'

G.p.scrolloff = 5
G.p.sidescrolloff = 5

G.p.hlsearch = true
G.p.incsearch = true
G.p.ignorecase = true

G.cmd([[
    set inccommand=
    set timeoutlen=400
]])

-- Mouse / Display
G.p.mouse = "a"
G.w.signcolumn = "yes"
G.p.cursorline = true
G.p.termguicolors = true
G.cmd([[colorscheme mine]])

-- vim.diagnostic.config({
--   virtual_text = false,
-- })

-- Line / Hide
G.p.cmdheight = 1
G.p.laststatus = 0

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 300
    }
end
})

G.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

G.cmd([[
    set undofile
    set undodir=~/.config/nvim/cache/undodir
]])

G.cmd([[ 
    set updatetime=300
]])

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



