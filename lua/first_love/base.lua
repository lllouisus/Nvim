local G = require"first_love.G"

vim.cmd("autocmd!")

-- Leader
G.g.mapleader = " "

-- UTF-8
vim.scriptencoding = 'utf-8'
G.p.encoding = 'utf-8'
G.p.fileencoding = 'utf-8'

-- Highlights/Colors/Display
G.w.number = true
G.p.cursorline = true
G.p.termguicolors = true
-- G.p.winblend = 0
-- G.p.wildoptions = 'pum'
-- G.p.pumblend = 5
-- G.p.background = 'dark'
G.w.signcolumn = 'yes'
G.cmd([[colorscheme mine]])

-- Search 
G.p.hlsearch = true
G.p.incsearch = true
G.p.inccommand = 'split'
G.p.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
G.p.smartcase = true
G.p.timeoutlen = 400
G.p.updatetime = 300

-- Mouse move
G.p.mouse = 'a'

-- Tab
G.p.autoindent = true
G.p.smartindent = true
G.p.tabstop = 4
G.p.softtabstop = 4
G.p.shiftwidth = 4
G.p.smarttab = true
G.p.expandtab = true

-- Not Backup
G.p.backup = false
G.p.swapfile = false
G.p.wrap = false -- No Wrap lines

-- Copy Color
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 300
    }
end
})

vim.cmd [[
augroup remember _folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END
]]


-- Cursor Location 

-- 
G.cmd([[ 
        set undofile 
        set undodir=~/.config/nvim/cache/undodir
]])

-- Code Fold
G.cmd([[
    set foldenable
    set foldmethod=manual
    set viewdir=~/.config/nvim/cache/viewdir
]])

-- Save History
G.p.viminfo = '!,\'10000,<50,s10,h'

G.p.title = true
G.p.showcmd = true
G.p.cmdheight = 1
G.p.laststatus = 0
G.p.scrolloff = 10
G.p.shell = 'zsh'
G.p.backupskip = { '/tmp/*', '/private/tmp/*' }
G.p.breakindent = true
G.p.backspace = { 'start', 'eol', 'indent' }
G.p.path:append { '**' } -- Finding files - Search down into subfolders
G.p.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
G.p.formatoptions:append { 'r' }

-- 提示多余空格和TODO
G.cmd([[
    hi ErrSpace ctermbg=238
    " autocmd BufWinEnter * syn match ErrSpace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/
    autocmd BufWinEnter * syn match Todo /TODO\(:.*\)*/
]])
