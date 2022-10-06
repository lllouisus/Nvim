local G = require('G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compiled_path = G.fn.stdpath('config')..'/plugin/packer_compiled.lua'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    G.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.fn.system({'rm', '-rf', compiled_path})
    G.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

-- 所有插件配置分 config 和 setup 部分
-- config 发生在插件载入前 一般为 let g:xxx = xxx 或者 hi xxx xxx 或者 map x xxx 之类的 配置
-- setup  发生在插件载入后 一般为 require('xxx').setup() 之类的配置
require('packer').startup({
    function(use)
        -- packer 管理自己的版本
        use { 'wbthomason/packer.nvim' }

        -- 启动时间分析
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        -- vv 快速选中内容插件
        require('pack/vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('pack/vim-expand-region').setup()", event = 'CursorHold' }

        -- ff 高亮光标下的word
        require('pack/vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('pack/vim-interestingwords').setup()", event = 'CursorHold' }

        -- github copilot
        require('pack/copilot').config()
        use { 'github/copilot.vim', config = "require('pack/copilot').setup()", event = 'InsertEnter' }

        -- 浮动终端
        require('pack/vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('pack/vim-floaterm').setup()" }

        -- tree-sitter
        require('pack/tree-sitter').config()
        use { 'nvim-treesitter/nvim-treesitter', config = "require('pack/tree-sitter').setup()", run = ':TSUpdate', event = 'BufRead' }
        use { 'nvim-treesitter/playground', after = { 'nvim-treesitter' } }

        -- markdown预览插件 导航生成插件
        use { 'iamcco/markdown-preview.nvim', config = "require('pack/markdown')", run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown' }

        -- 文件管理器
        require('pack/nvim-tree').config()
        use { 'kyazdani42/nvim-tree.lua', config = "require('pack/nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' }, required = { 'kyazdani42/nvim-web-devicons' } }

        -- 状态栏 & 标题栏
        require('pack/nvim-lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('pack/nvim-lines').setup()" }
        use { 'yaocccc/nvim-hlchunk' }

        ----------------------------------------------------------------------------------------------------
        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim', config = "require('pack/mason-lspconfig')", event = "CursorHold" }
        use { "hrsh7th/nvim-cmp" , config = "require('pack/cmp')" }
        use { 'neovim/nvim-lspconfig', config = "require('pack/lsp-language-server')" }
        use { 'glepnir/lspsaga.nvim' }
        
        -- Cmp
        use { 'hrsh7th/cmp-nvim-lua' } --nvim-cmp source for neovim Lua API.
        use { 'hrsh7th/cmp-nvim-lsp' } 
        use { 'onsails/lspkind-nvim' }  --美化自动完成提示信息
        use { 'hrsh7th/cmp-buffer' }  --从buffer中智能提示
        use { 'octaltree/cmp-look' }  --用于完成英语单词
        use { 'hrsh7th/cmp-path' }  --自动提示硬盘上的文件
        use { 'f3fora/cmp-spell' } --nvim-cmp 的拼写源基于 vim 的拼写建议
        use { 'hrsh7th/cmp-emoji' }   --输入: 可以显示表情
        use { 'ray-x/lsp_signature.nvim', config = "require('pack/lsp-signature')" }

        use {
            "L3MON4D3/LuaSnip",
            requires = {
                "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
                -- "rafamadriz/friendly-snippets" --代码段合集
            }
        }

        -- Hop
        use { 'phaazon/hop.nvim', branch = 'v2', config = "require('pack/hop')", event = "CursorHold" }

        -- Autopairs
        use { 'windwp/nvim-autopairs', config = "require('pack/autopairs')", event = "CursorHold" }

        -- Tomment Tool
        use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
        }

        -- Translator Tool
       use { 'voldikss/vim-translator' }

       -- Gitsigns
       use { 'lewis6991/gitsigns.nvim', config = "require('pack/gitsigns')", event = "CursorHold" }

       -- History
       use { 'dinhhuy258/vim-local-history' }

       -- Symbols-Outline
       use { 'simrat39/symbols-outline.nvim', config = "require('pack/symbols-outline')", event = "CursorHold" }

       -- Surround
       use { 'tpope/vim-surround' }

       -- Multiple Tool
       use { 'mg979/vim-visual-multi' }
       vim.cmd([[
            source ~/.config/nvim/lua/pack/visual-multi.vim
       ]])

       -- FZF
       use 'nvim-lua/plenary.nvim'
       use 'nvim-lua/popup.nvim'
       use 'ibhagwan/fzf-lua'

       -- telescope ui select
       -- use {'nvim-telescope/telescope-ui-select.nvim' }

       use { 'nvim-telescope/telescope.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('pack/telescope')", event = "CursorHold" }
       use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}



        ----------------------------------------------------------------------------------------------------

    end,
    config = {
        git = { clone_timeout = 120 },
        display = {
            working_sym = '[ ]', error_sym = '[✗]', done_sym = '[✓]', removed_sym = ' - ', moved_sym = ' → ', header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})

if packer_bootstrap then
    require('packer').sync()
end
